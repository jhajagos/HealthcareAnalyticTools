"""
Script to extract a sub-graph from the Teaming dataset data set that is loaded in a MySQL
database. This script can use any variable in the node database as a selector. The node
database that you are connecting is "loading_teaming_nodes.sql". The "loading_teaming_nodes.sql"
populates the nodes database from provider for specific states.

A database connection is made through a MySQL database that has a DSN called teaming.

"""

__author__ = 'Janos G. Hajagos'

from extract_providers_to_graphml import *
from optparse import OptionParser


def string_list_to_python_list(string_list):
    return string_list.split(",")


def field_selection_with_like(field_name, like_values, padding_left_side=True, padding_right_side=False,
                              wild_card_left_side=False, wild_card_right_side=True, padder=""):

    sql_string = ""

    for like_value in like_values:
        like_value_string = ""
        if wild_card_left_side:
            like_value_string += '%'
        if padding_left_side:
            like_value_string += padder

        like_value_string += like_value

        if padding_right_side:
            like_value_string += padder
        if wild_card_right_side:
            like_value_string += '%'

        sql_string += "%s like '%s'" % (field_name, like_value_string)
        sql_string += " or "

    sql_string = sql_string[:-4]
    return "(" + sql_string + ")"


def field_selection_with_equal(field_names, equal_value=1):
    sql_string = ""
    for field_name in field_names:
        sql_string += "%s = %s" % (field_name, equal_value)
        sql_string += " or "
    sql_string = sql_string[:-4]
    return "(" + sql_string + ")"


if __name__ == "__main__":

    parser = OptionParser()
    parser.add_option("-z", "--zip_codes", dest="zip_codes", default=None,
                      help="A comma separated list of zip codes. You can add the full five digits '11721,11794' or '117,119' to select multiple zip codes. Do not delimit the list with single quotes. Example: -z 11721,11794")

    parser.add_option("-c", "--restrict_to_core_nodes_only", dest="include_core_nodes", default=False, help="Only include core nodes that meet the selection criteria. Leaf nodes that do not meet the primary selection criteria will not be extracted.", action="store_true")

    parser.add_option("-e", "--include_leaf_edges", dest="include_leaf_edges", default=False, help="By default edges connecting leaf nodes are not included. The -e parameter will include leaf to leaf edges. Warning: this can make your extracted graph very big.", action="store_true")

    parser.add_option("-n", "--npis", dest="npis", default=None, help="A comma separated list of NPIs to include. Example: -n 1558399980,1972545028,1417021007")

    parser.add_option("-b", "--binary_selection_fields", default=None, dest="binary_selection_fields", help="A list of binary indicator fields to use as selection criteria. Example: -b is_dentist,is_hospital")

    parser.add_option("-t", "--taxonomy_selection_fields", default=None, dest="taxonomy_selection_fields", help="A list of taxonomy codes to use as selection criteria. Example: -t 208D00000X,207Q00000X,207RG0300X,207R00000X")

    parser.add_option("-d", "--directory", default="./", dest="write_directory", help="The directory to write output files to. Example (Windows): -d E:\\cms_teaming\\files\\  Example (Linux): -d /data/cms_teaming/")

    parser.add_option("-f", "--file_name_prefix", dest="base_file_name", default="", help="Prefix for the output file names. For example, -d 'RI_pcp' would create the following file names: 'RI_pcp_node_db.csv', 'RI_pcp_edges.csv', 'RI_pcp.graphml'.")

    parser.add_option("-s", "--sole_provider", dest="sole_provider", help="Selects providers that are a single individual", action="store_true", default=False)

    parser.add_option("-g", "--group_provider", dest="non_sole_provider", help="Selects providers that are not a single individual", action="store_true", default=False)

    parser.add_option("-i", "--institutional_provider", dest="blank_sole_provider", help="Select an institutional provider", action="store_true", default=False)

    (options, args) = parser.parse_args()

    selection_fields_sql = {}

    if options.taxonomy_selection_fields:
        taxonomy_selection_field_list = string_list_to_python_list(options.taxonomy_selection_fields)
        taxonomy_selection_field_list_sql = field_selection_with_like("flattened_taxonomy_string",
                                                                      taxonomy_selection_field_list,
                                                                      padding_left_side=True,
                                                                      wild_card_right_side=True,
                                                                      wild_card_left_side=True, padder="|")
        selection_fields_sql["taxonomy_field_selection_list"] = taxonomy_selection_field_list_sql

    if options.zip_codes:
        zip_code_list = string_list_to_python_list(options.zip_codes)
        zip_selection_field_list_sql = field_selection_with_like("zip", zip_code_list, padding_left_side=True, wild_card_right_side=True, padder="")
        selection_fields_sql["zip_list"] = zip_selection_field_list_sql

    if options.binary_selection_fields:
        binary_selection_field_list = string_list_to_python_list(options.binary_selection_fields)
        binary_selection_field_list_sql = field_selection_with_equal(binary_selection_field_list, 1)
        selection_fields_sql["binary_selection_list"] = binary_selection_field_list_sql

    if options.npis:
        npi_list = [int(n) for n in string_list_to_python_list(options.npis)]
        selection_fields_sql["npi_selection_list"] = "npi in " + str(tuple(npi_list))

    if options.sole_provider:
        selection_fields_sql["sole_provider"] = "sole_provider = 'Y'"

    if options.non_sole_provider:
        selection_fields_sql["non_sole_provider"] = "sole_provider = 'N'"

    if options.blank_sole_provider:
        selection_fields_sql["blank_sole_provider"] = "sole_provider is NULL"

    where_criteria = ""
    for sql_clause in selection_fields_sql:
        where_criteria += selection_fields_sql[sql_clause] + " and "

    where_criteria = "(" + where_criteria[:-5] + ")"
    print(where_criteria)

    add_leaf_nodes = not options.include_core_nodes
    extract_provider_network(where_criteria, referral_table_name=REFERRAL_TABLE_NAME, npi_detail_table_name=NPI_DETAIL_TABLE_NAME,
         field_name_to_relationship=FIELD_NAME_TO_RELATIONSHIP, field_name_from_relationship=FIELD_NAME_FROM_RELATIONSHIP,
         file_name_prefix=options.base_file_name, add_leaf_to_leaf_edges=options.include_leaf_edges, node_label_name="provider_name",
         field_name_weight=FIELD_NAME_WEIGHT, add_leaf_nodes=add_leaf_nodes, directory=options.write_directory)
