\name{includePackage}
\alias{includePackage}
\title{Include this specified package on all workers}
\usage{
includePackage(sc, pkg)
}
\arguments{
  \item{sc}{SparkContext to use}

  \item{pkg}{Package name}
}
\description{
This function can be used to include a package on all
workers before the user's code is executed. This is useful
in scenarios where other R package functions are used in a
function passed to functions like \code{lapply}. NOTE: The
package is assumed to be installed on every node in the
Spark cluster.
}
\examples{
\dontrun{
 library(Matrix)

 sc <- sparkR.init()
 # Include the matrix library we will be using
 includePackage(Matrix)

 generateSparse <- function(x) {
   sparseMatrix(i=c(1, 2, 3), j=c(1, 2, 3), x=c(1, 2, 3))
 }

 rdd <- lapplyPartition(parallelize(sc, 1:2, 2L), generateSparse)
 collect(rdd)
}
}

