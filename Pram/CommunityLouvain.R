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

length(network)

sub_network <- igraph::sample_asym_pref()(network, SAMPLE_SIZE)

community_louvain <- igraph::cluster_louvain(network, weights = NULL )

plot(community_louvain)

knitr::kable(links %>% head(10))