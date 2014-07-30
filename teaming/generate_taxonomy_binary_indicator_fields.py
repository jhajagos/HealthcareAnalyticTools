__author__ = 'janos'

from optparse import OptionParser
from easy_extract_providers_graphml import field_selection_with_like

if __name__ == "__main__":
    parser = OptionParser()

    parser.add_option("-o", "--file", dest="file_name", help="")
    parser.add_option("-t", "--taxonomy_list", dest="taxonomy_list", help="")
    parser.add_option("-n", "--table_name", dest="table_name", help="")
    parser.add_option("-f", "--field_name", dest="field_name", help="")
    parser.add_option("-x", "--taxonomy_field_name", dest="taxonomy_field_name", default="flattened_taxonomy_string", help="")

    (options, args) = parser.parse_args()
    with open(options.file_name, "w") as f:

        sql_string = "alter table %s add %s boolean;\n" % (options.table_name, options.field_name)

        condition_sql_statement = field_selection_with_like(options.taxonomy_field_name,
                                                         options.taxonomy_field_name.split(","), padding_left_side=True,
                                                         padding_right_side=False, padder="|", wild_card_left_side=True,
                                                         wild_card_right_side=True)

        sql_string += "update %s set %s = case when  %s then 1 else 0 end;\n" % (options.table_name, options.field_name, condition_sql_statement)

        f.write(sql_string)

