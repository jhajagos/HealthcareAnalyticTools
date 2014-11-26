__author__ = 'janos'
import csv
import re
import networkx as nx
from optparse import OptionParser
import os
import sys


def export_edges_to_csv(csv_edge_file_name, provider_graph_to_export):
    """Export edges to CSV"""
    with open(csv_edge_file_name,"wb") as f:
        csv_edges = csv.writer(f)
        for node1 in provider_graph_to_export.edge:
            for node2 in provider_graph_to_export.edge[node1]:
                npi_from = node1
                npi_to = node2
                edge_data = provider_graph_to_export[node1][node2]
                csv_edges.writerow((npi_from, npi_to, edge_data["weight"]))


def export_nodes_to_csv(csv_node_file_name, provider_graph_to_export):
    """Export nodes to CSV"""
    with open(csv_node_file_name, "wb") as fw:
        i = 0
        csv_nodes = csv.writer(fw)
        for node in provider_graph_to_export.node:

            node_dict = provider_graph_to_export.node[node]
            if i == 0:
                header = node_dict.keys()

                header.sort()
                header = ["node_id"] + header

                csv_nodes.writerow(header)

            row_to_write = [node]
            for attribute in header[1:]:
                if attribute in node_dict:
                    value_to_write = node_dict[attribute]
                else:
                    value_to_write = ''

                row_to_write += [value_to_write]
            csv_nodes.writerow(row_to_write)

            i += 1
    return i


def regex_taxonomy(list_of_taxonomies):
    """Build a regular expression"""
    regex_string = "("
    i = 0
    for taxonomy in list_of_taxonomies:
        if i > 0:
            regex_string += '|'
        regex_string += '\\|%s' % taxonomy
        i += 1
    regex_string += ')'

    re_taxonomy_string = re.compile(regex_string)
    return re_taxonomy_string


def filter_graphml_by_flattened_provider_taxonomies(provider_graph_to_manipulate, list_of_taxonomies, field_name="flattened_taxonomy_string", keep_nodes_that_match=True, leaf_nodes_only=True):
    """List of taxonomies"""
    re_taxonomy_string = regex_taxonomy(list_of_taxonomies)
    for node_id in provider_graph_to_manipulate.nodes():
        node = provider_graph_to_manipulate.node[node_id]
        if field_name in node:
            flattened_taxonomy_string = node[field_name]
            match_result = re_taxonomy_string.match(flattened_taxonomy_string)
            if match_result:
                if keep_nodes_that_match:
                    pass # We don't do any thing if
                else:
                    if leaf_nodes_only:
                        if node["node_type"] == "leaf":
                            provider_graph_to_manipulate.remove_node(node_id)
                    else:
                        provider_graph_to_manipulate.remove_node(node_id)
            else:
                if keep_nodes_that_match:
                    if leaf_nodes_only:
                        if node["node_type"] == "leaf":
                            provider_graph_to_manipulate.remove_node(node_id)
                    else:
                        provider_graph_to_manipulate.remove_node(node_id)
                else:
                    pass
        else:
            if keep_nodes_that_match:
                if leaf_nodes_only:
                    if "node_type" in node:
                        if node["node_type"] == "leaf":
                            provider_graph_to_manipulate.remove_node(node_id)
                        else:
                            pass
                    else:
                        provider_graph_to_manipulate.remove_node(node_id)
                else:
                    provider_graph_to_manipulate.remove_node(node_id)

    return provider_graph_to_manipulate


def add_indicator_taxonomy_field_to_graph(provider_graph_to_manipulate, list_of_taxonomies, indicator_field_name, taxonomy_field_name="flattened_taxonomy_string"):
    re_taxonomy_string = regex_taxonomy(list_of_taxonomies)
    for node_id in provider_graph_to_manipulate.nodes():
        node = provider_graph_to_manipulate.node[node_id]
        if taxonomy_field_name in node:
            flattened_taxonomy_string = node[taxonomy_field_name]
            match_result = re_taxonomy_string.match(flattened_taxonomy_string)
            if match_result:
                node[indicator_field_name] = 1
            else:
                node[indicator_field_name] = 0
    return provider_graph_to_manipulate


def export_graph_to_csv(base_file_name, export_provider_graph):

    csv_node_file_name = base_file_name + "_nodes_db.csv"
    csv_edge_file_name = base_file_name + "_edges.csv"

    print("Writing CSV with nodes")
    export_nodes_to_csv(csv_node_file_name, export_provider_graph)

    print("Writing CSV of edges with weights")
    export_edges_to_csv(csv_edge_file_name, export_provider_graph)


if __name__ == "__main__":
    usage = "usage: %prog [options] arg1 arg2"
    parser = OptionParser(usage=usage)

    parser.add_option("-g", "--graphml_file", dest="graphml_file_name", help="(REQUIRED) Specifies the name of the GraphML file to use as input.")
    parser.add_option("-t", "--taxonomy_fields", dest="taxonomy_selection_fields",
                      help="(REQUIRED) A list of NUCC taxonomy codes to use for selection purposes.")
    parser.add_option("-x", "--extract", dest="filter_graph", action="store_true",
                      help="(OPTIONAL) Only output nodes that match the taxonomy selection fields. If the -x parameter is not supplied, the default behavior is to output all nodes. If the -t parameter is set, a new binary indicator field will be added to the output file. The value of the binary indicator will be set to 1 if any of the taxonomy codes are present in the node. The name of the binary indicator will be by default 'binary_indicator_taxonomy_field'. The name can be optionally specified using the -a parameter.")
    parser.add_option("-n", "--name", dest="indicator_field_name",
                      help="(OPTIONAL) Specify a name for the new binary indicator field that will be created using the -x parameter. If no -n parameter is provided, a default name will be supplied by the -x parameter.") #Records matching the taxonomy selection fields will have a value of 1 on that new binary field. If the -a parameter is not supplied, no new binary indicator field will be added.
    parser.add_option("-l", "--filter_leaves_only", dest="restrict_to_leaf_nodes", help="(OPTIONAL) Apply the selection criteria to leaf nodes only and include all core nodes. If the -l parameter is not supplied, the default behavior is to filter both leaf and core nodes.", action="store_true",
                      default=False)
    parser.add_option("-r", "--remove_nodes", dest="remove_nodes", default=False, action="store_true", help="(OPTIONAL) Removes nodes that match the taxonomy selection criteria. If the -r parameter is not specified, then nodes that match the taxonomy selection criteria are retained.")
    parser.add_option("-d", "--directory", dest="directory", default=None,
                      help="(OPTIONAL) The directory where the output file will be placed. If the -d parameter is not supplied it will be set to the current directory. Examples (Windows): [-d C:\\cms_teaming\\graphs\\] and (Unix) [-d /cms_teaming/graphs/]")
    parser.add_option("-f", "--file_name_prefix", dest="base_file_name", default=None, help="(OPTIONAL) Prefix for the output file names. For example, -d 'RI_pcp' would create the following file names: 'RI_pcp_node_db.csv', 'RI_pcp_edges.csv', 'RI_pcp.graphml'. If the -f parameter is not specified, then the names of the three output files will be prefixed by the name of the input file with '_modified' appended.")
    #parser.add_option("-j", "--json_file_name", dest="json_file_name", help="(Not Implemented). Read taxonomy mappings from a JSON configuration file ", default=None)


    (options, args) = parser.parse_args()

    if options.taxonomy_selection_fields:
        taxonomy_list = options.taxonomy_selection_fields.split(',')

    if options.graphml_file_name:
        graphml_file_name = options.graphml_file_name
    else:
        print("Must indicate with -g a graphml file name")
        sys.exit()

    if options.restrict_to_leaf_nodes:
        restrict_to_leaf_nodes = True
    else:
        restrict_to_leaf_nodes = False

    print("Reading GraphML file: '%s'" % graphml_file_name)
    provider_graph = nx.read_graphml(graphml_file_name)
    print("Number of nodes read is %s" % len(provider_graph.nodes()))


    if options.base_file_name is None:
        graphml_file_name_only = os.path.split(graphml_file_name)[1]
        base_name = graphml_file_name_only[: -1 * len(".graphml")]
        base_name_manipulated = base_name + "_manipulated"
    else:
        base_name_manipulated = options.base_file_name

    manipulated_graphml_file_name = base_name_manipulated + ".graphml"
    graphml_file_name = os.path.abspath(graphml_file_name)
    original_directory, base_graphml_filename = os.path.split(graphml_file_name)
    print(original_directory, base_graphml_filename)
    if options.directory is None:
        if len(original_directory) == 0:
            base_directory = os.path.abspath("./")
        else:
            base_directory = original_directory
    else:
        base_directory = options.directory

    if True: #options.indicator_field_name:
        if options.indicator_field_name:
            indicator_field_name = options.indicator_field_name
        else:
            indicator_field_name = "binary_indicator_taxonomy_field"

        print("Adding indicator field '%s' based on taxonomy to the graph" % indicator_field_name)

        manipulated_graph = add_indicator_taxonomy_field_to_graph(provider_graph, taxonomy_list, indicator_field_name)

    if options.filter_graph:

        number_of_nodes = len(provider_graph.nodes())
        print("Filtering graph by taxonomy")
        keep_nodes_that_match = not options.remove_nodes
        if keep_nodes_that_match:
            print("Only nodes that match will be kept")
        manipulated_graph = filter_graphml_by_flattened_provider_taxonomies(provider_graph, taxonomy_list,
                                                                            leaf_nodes_only=restrict_to_leaf_nodes,
                                                                            keep_nodes_that_match=keep_nodes_that_match)
        number_of_nodes_left = len(manipulated_graph.nodes())

        removed_nodes = number_of_nodes - number_of_nodes_left
        print("Number of nodes in the filtered graph is %s (removed %s nodes)." % (number_of_nodes_left, removed_nodes))

    print("Exporting graphml to CSV node file '%s' and edge file '%s' to directory '%s'" % (base_name_manipulated + "_nodes_db.csv", base_name_manipulated + "_edges.csv", base_directory))
    export_graph_to_csv(os.path.join(base_directory, base_name_manipulated), manipulated_graph)

    print("Exporting filtered graph to GraphML file '%s' to directory '%s'" % (manipulated_graphml_file_name, base_directory))
    nx.write_graphml(manipulated_graph, os.path.join(base_directory, manipulated_graphml_file_name))



