% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/SIMLR.R
\name{SIMLR}
\alias{SIMLR}
\title{SIMLR}
\usage{
SIMLR(X, c, no.dim = NA, k = 10, if.impute = FALSE, normalize = FALSE,
  cores.ratio = 1)
}
\arguments{
\item{X}{an (m x n) data matrix of gene expression measurements of individual cells or
and object of class SCESet}

\item{c}{number of clusters to be estimated over X}

\item{no.dim}{number of dimensions}

\item{k}{tuning parameter}

\item{if.impute}{should I traspose the input data?}

\item{normalize}{should I normalize the input data?}

\item{cores.ratio}{ratio of the number of cores to be used when computing the multi-kernel}
}
\value{
clusters the cells based on SIMLR and their similarities

list of 8 elements describing the clusters obtained by SIMLR, of which y are the resulting clusters: 
	y = results of k-means clusterings,
 	S = similarities computed by SIMLR, 
 	F = results from network diffiusion, 
 	ydata = data referring the the results by k-means,
 	alphaK = clustering coefficients,
 	execution.time = execution time of the present run,
 	converge = iterative convergence values by T-SNE,
 	LF = parameters of the clustering
}
\description{
perform the SIMLR clustering algorithm
}
\examples{
SIMLR(X = BuettnerFlorian$in_X, c = BuettnerFlorian$n_clust, cores.ratio = 0)

library(scran)
ncells = 50
ngenes = 25
mu <- 2^runif(ngenes, 3, 10)
gene.counts <- matrix(rnbinom(ngenes*ncells, mu=mu, size=2), nrow=ngenes)
rownames(gene.counts) = paste0("X", seq_len(ngenes))
sce = newSCESet(countData=data.frame(gene.counts))
output = SIMLR(X = sce, c = 8, cores.ratio = 0)

}
