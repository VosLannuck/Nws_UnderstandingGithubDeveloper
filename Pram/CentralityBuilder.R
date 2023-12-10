load("Pram/Prim_Community_algorithm_saved_data.RData")

extract_top_n_centrality = function(centrality_result, n) {
  top_n <- sort(centrality_result, decreasing = TRUE)
  return(top_n[1:n])
}

top_n_degree_centrality <- as.table(extract_top_n_centrality(degree_cent_net, 10))
top_n_closeness_centrality <- as.table(extract_top_n_centrality(closeness_cent_net, 10))
top_n_betweenness_centrality <- as.table(extract_top_n_centrality(betweenness_cent_net, 10))
top_n_eigen_centrality <- as.table(extract_top_n_centrality(eigen_cent_net$vector, 10))
