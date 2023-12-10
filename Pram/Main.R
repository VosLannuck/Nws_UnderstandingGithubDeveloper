# This script only for generating cluster_calculationn using whole grraph
# If you would like to use it, feel free.

library("igraph")
library("CliquePercolation")

links <- read.csv("Pram/dataset/musae_git_edges.csv")
nodes <- read.csv("Pram/dataset/musae_git_target.csv")
load("Pram/Prim_Community_algorithm_saved_data.RData")

head(links)
head(nodes)


network <- igraph::graph_from_data_frame(d = links,
                                         vertices = nodes,
                                         directed = FALSE)
ls()

avg_path_length <- igraph::mean_distance(network)

degree_cent_net <- igraph::degree(network, mode = "all")
closeness_cent_net <- igraph::closeness(network, mode = "all")
betweenness_cent_net <- igraph::betweenness(network)
eigen_cent_net <- igraph::eigen_centrality(network)

clustering_coef <- igraph::transitivity(network, type="globalundirected")

# community_edge_betweeness <- igraph::cluster_edge_betweenness(network)
community_louvain <- igraph::cluster_louvain(network, weights = NULL)
community_leiden <- igraph::cluster_leiden(network, weights = NULL)
community_walktrap <- igraph::cluster_walktrap(network, weights = NULL)
community_leading_eigen <- igraph::cluster_leading_eigen(network,
                                                         weights = NULL)
community_infomap <- igraph::cluster_infomap(network)
community_optimal <- igraph::cluster_optimal(network, weights = NULL)

print(avg_path_length)
print(degree_cent_net)
print(closeness_cent_net)
print(betweenness_cent_net)
print(eigen_cent_net)

save_image <- function() {
  save.image("Pram/Prim_Community_algorithm_saved_data.RData")
}

#save_image()
