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
                      help="A comma separated list of zip codes. You can add the full five digits '11721,11794' or '117,119' to select multiple zip codes")

    #parser.add_option("-l", "--include_leaf_nodes", dest="include_leaf_nodes", default=False, help="Whether to include leaf nodes or not: '-l True")

    parser.add_option("-n", "--npis", dest="npis", default=None, help="A comma separated list of NPIs to include")

    parser.add_option("-b", "--binary_selection_fields", default=None, dest="binary_selection_fields", help="A list of fields that 'is_dentist,is_hospital'")

    parser.add_option("-t", "--taxonomy_selection_fields", default=None, dest="taxonomy_selection_fields", help="A list of taxonomy codes that you want to include in the selection criteria")

    parser.add_option("-d", "--directory", default="./", dest="write_directory", help="The directory which to write ouput files to")

    parser.add_option("-p", "--prefix", dest="file_name_prefix", help="The name to prefix on")

    (options, args) = parser.parse_args()

    selection_fields_sql = {}

    if options.taxonomy_selection_fields:
        taxonomy_selection_field_list = string_list_to_python_list(options.taxonomy_selection_fields)
        taxonomy_selection_field_list_sql = field_selection_with_like("flattened_taxonomy_string", taxonomy_selection_field_list, padding_left_side=True, wild_card_right_side=True, padder="|")
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

    where_criteria = ""
    for sql_clause in selection_fields_sql:
        where_criteria += selection_fields_sql[sql_clause] + " and "

    where_criteria = where_criteria[:-5]
    print(where_criteria)


    extract_provider_network(where_criteria, referral_table_name=REFERRAL_TABLE_NAME, npi_detail_table_name=NPI_DETAIL_TABLE_NAME,
         field_name_to_relationship=FIELD_NAME_TO_RELATIONSHIP, field_name_from_relationship=FIELD_NAME_FROM_RELATIONSHIP,
         file_name_prefix=options.file_name_prefix, add_leaf_to_leaf_edges=False, node_label_name="provider_name",
         field_name_weight=FIELD_NAME_WEIGHT, add_leaf_nodes=True, directory=options.write_directory)
