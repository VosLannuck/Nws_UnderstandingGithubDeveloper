library(igraph)
library(rgexf)

data <- read.csv('dataset.csv')

g <- graph.data.frame(data, directed=FALSE)

community_louvain <- igraph::cluster_louvain(g, weights = NULL)
community_leiden <- igraph::cluster_leiden(g, weights = NULL)
community_walktrap <- igraph::cluster_walktrap(g, weights = NULL)
community_leading_eigen <- igraph::cluster_leading_eigen(g, weights = NULL)
community_infomap <- igraph::cluster_infomap(g)
community_greedy <- igraph::cluster_fast_greedy(g, weights = NULL)

#save.image("Image.RData")

save_community <- function(g, community_result,
                           save_path_algo_community = "./Communities/g_louvain_communities.csv",) # nolint) 
{
  community_result_membership <- membership(community_result)
  g_save <- g
  g_save$community <- community_result_membership
  v_graph <- igraph::as_ids(igraph::V(g_save))

  g_save_df <- data.frame(id = v_graph, communities = as.vector(g_save$community))

  utils::write.csv(g_save_df, file = save_path_algo_community, row.names=FALSE)

}

save_path_edge_louvain <- "./Communities/g_louvain_edgelist.csv"
save_path_communities_louvain <- "./Communities/g_louvain_communities.csv"

save_path_edge_walktrap <- "./Communities/g_walktrap_edgelist.csv"
save_path_communities_walktrap <- "./Communities/g_walktrap_communities.csv"

save_path_edge_leading_eigen <- "./Communities/g_Leigen_edgelist.csv"
save_path_communities_leading_eigen <- "./Communities/g_Leigen_communities.csv"

save_path_edge_greedy <- "./Communities/g_greedy_edgelist.csv"
save_path_communities_greedy <- "./Communities/g_greedy_communities.csv"

save_path_edge_infomap <- "./Communities/g_infomap.csv"
save_path_communities_infomap <- "./Communities/g_infomap_communities.csv"

save_community(g, community_louvain,
               save_path_algo_community = save_path_communities_louvain)

save_community(g, community_walktrap,
               save_path_algo_community = save_path_communities_walktrap)

save_community(g, community_leading_eigen,
               save_path_algo_community = save_path_communities_leading_eigen)

save_community(g, community_greedy,
               save_path_algo_community = save_path_communities_greedy)

save_community(g, community_infomap,
               save_path_algo_community = save_path_communities_infomap)