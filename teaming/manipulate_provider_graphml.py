__author__ = 'janos'
import csv
import re
import sys
import networkx as nx

def export_edges_to_csv(csv_edge_file_name, provider_graph):
    """Export edges to CSV"""
    with open(csv_edge_file_name,"wb") as f:
        csv_edges = csv.writer(f)
        for node1 in provider_graph.edge:
            for node2 in provider_graph.edge[node1]:
                npi_from = node1
                npi_to = node2
                edge_data = provider_graph[node1][node2]
                csv_edges.writerow((npi_from, npi_to, edge_data["weight"]))


def export_nodes_to_csv(csv_node_file_name, provider_graph):
    """Export nodes to CSV"""
    with open(csv_node_file_name, "wb") as fw:
        i = 0
        csv_nodes = csv.writer(fw)
        for node in provider_graph.node:

            node_dict = provider_graph.node[node]
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


def filter_graphml_by_flattened_provider_taxonomies(provider_graph, list_of_taxonomies, field_name="flattened_taxonomy_string", keep_node_that_matches=True, leaf_nodes_only=True):
    regex_string = "("
    i = 0
    for taxonomy in list_of_taxonomies:
        if i > 0:
            regex_string += '|'
        regex_string += '\\|%s' % taxonomy
        i += 1
    regex_string += ')'

    re_taxonomy_string = re.compile(regex_string)

    for node_id in provider_graph.nodes():
        node = provider_graph.node[node_id]
        if field_name in node:
            flattened_taxonomy_string = node[field_name]
            match_result = re_taxonomy_string.match(flattened_taxonomy_string)
            if match_result:
                if keep_node_that_matches:
                    pass # We don't do any thing if
                else:
                    if leaf_nodes_only:
                        if node["node_type"] == "leaf":
                            provider_graph.remove_node(node_id)
                    else:
                        provider_graph.remove_node(node_id)
            else:
                if keep_node_that_matches:
                    if leaf_nodes_only:
                        if node["node_type"] == "leaf":
                            provider_graph.remove_node(node_id)
                    else:
                        provider_graph.remove_node(node_id)
                else:
                    pass
        else:
            if keep_node_that_matches:
                if leaf_nodes_only:
                    if "node_type" in node:
                        if node["node_type"] == "leaf":
                            provider_graph.remove_node(node_id)
                        else:
                            pass
                    else:
                        provider_graph.remove_node(node_id)
                else:
                    provider_graph.remove_node(node_id)



    return provider_graph


def export_graph_to_csv(base_name, provider_graph):

    csv_node_file_name = base_name + ".nodes_db.csv"
    csv_edge_file_name = base_name + ".edges.csv"

    print("Writing CSV with nodes")
    export_nodes_to_csv(csv_node_file_name, provider_graph)

    print("Writing CSV of edges with weights")
    export_edges_to_csv(csv_edge_file_name, provider_graph)


if __name__ == "__main__":
    if len(sys.argv) == 3:
        graphml_file_name = sys.argv[1]
        taxonomy_list_string = sys.argv[2]

        taxonomy_list = taxonomy_list_string.split(',')

        print("Reading GraphML file")

        provider_graph = nx.read_graphml(graphml_file_name)
        #provider_graph_original = nx.read_graphml(graphml_file_name)
        #provider_graph = provider_graph_original.copy()


        number_of_nodes = len(provider_graph.nodes())
        base_name = graphml_file_name[: -1 * len(".graphml")]
        base_name_filtered = base_name + ".filtered"
        filtered_graphml_file_name = base_name_filtered + ".graphml"

        print("Filtering graph by taxonomy")
        filtered_graph = filter_graphml_by_flattened_provider_taxonomies(provider_graph, taxonomy_list)
        number_of_nodes_left = len(filtered_graph.nodes())

        removed_nodes = number_of_nodes - number_of_nodes_left
        print("Number of nodes in the filtered graph is %s (removed %s nodes)." % (number_of_nodes_left, removed_nodes))


        print("Exporting graphml to CSV")
        export_graph_to_csv(base_name_filtered, filtered_graph)

        print("Exporting filtered graph")
        nx.write_graphml(filtered_graph, filtered_graphml_file_name)



