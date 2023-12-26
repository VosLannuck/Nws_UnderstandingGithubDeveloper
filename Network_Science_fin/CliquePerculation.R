library("igraph")
library("CliquePercolation")


data <- read.csv("dataset.csv")

qGraph <- qgraph::qgraph(data)


g <- graph.data.frame(data, directed=FALSE)
num_cliques <- igraph::clique_size_counts(g,)
total_clique <- igraph::clique.number(g)

communities <- CliquePercolation::cpAlgorithm(qGraph, 20, "unweighted")

#save.image("qGraph.RData")
