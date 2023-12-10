library("igraph")

links <- read.csv("Pram/dataset/musae_git_edges.csv")
nodes <- read.csv("Pram/dataset/musae_git_target.csv")

head(links)
head(nodes)
load("Pram/Prim_Community_algorithm_saved_data.RData")
ls()
SAMPLE_SIZE <- 1000
network <- igraph::graph_from_data_frame(d = links,
                                         vertices = nodes,
                                         directed = FALSE)

nodes_sample <- sample(V(network), size = SAMPLE_SIZE)

sub_graph <- igraph::induced.subgraph(network, nodes_sample)

community_louvain_sub_graph <- igraph::cluster_louvain(sub_graph,
                                                       weights = NULL)

cluster_info = function(cluster_result, algoname="louvain") {
  print(sprintf("Community Detection Algo : %s", algoname))
  print(sprintf("Community Sizes :%i", length(cluster_result)))
  print(sprintf("Membership of %s ", algoname))
  print(sprintf("Length of membership %i",
                length(igraph::membership(cluster_result))))
  top_communities <- get_top(cluster_result, 10)
  print("Top %n Highest_degree")
  print(top_communities)
}

get_top <- function(community_result, n) {

  sorted_communities <- sort(igraph::sizes(community_result),
                                       decreasing = TRUE)
  top_n_communities <- sorted_communities[1:n]
  return (top_n_communities )

}
config_network = function(network, community_result, centrality, n = 10) {
  igraph::V(network)$size <- centrality * 3
  igraph::V(network)$label.cex <- 0.4
  igraph::E(network)$arrow.size <- 10
  plot(community_result, network)
}

config_network(network, community_infomap, centrality = degree_cent_net)
cluster_info(community_infomap)