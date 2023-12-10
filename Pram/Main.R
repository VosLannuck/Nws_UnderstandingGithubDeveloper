library("igraph")

links <- read.csv("dataset/musae_git_edges.csv")
nodes <- read.csv("dataset/musae_git_target.csv")

head(nodes) 
head(links)

network <- graph_from_data_frame(d=links, vertices=nodes, directed = T)
network

length(E(network))
plot(network)

community <- cluster_edge_betweenness(network)