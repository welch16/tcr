% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/stats.R
\name{bootstrap.tcr}
\alias{bootstrap.tcr}
\title{Bootstrap for data frames in package tcR.}
\usage{
bootstrap.tcr(.data, .fun = entropy.seg, .n = 1000, .size = nrow(.data),
  .sim = c("uniform", "percentage"), .postfun = function(x) {     unlist(x)
  }, .verbose = T, .prop.col = "Read.proportion", ...)
}
\arguments{
\item{.data}{Data frame.}

\item{.fun}{Function applied to each sample.}

\item{.n}{Number of iterations (i.e., size of a resulting distribution).}

\item{.size}{Size of samples. For \code{.sim} == "uniform" stands for number of rows to take.
For \code{.sim} == "percentage" stands for number of UMIs / read counts to take.}

\item{.sim}{A character string indicating the type of simulation required. Possible values are
"uniform" or "percentage". See "Details" for more details of type of simulation.}

\item{.postfun}{Function applied to the resulting list: list of results from each processed sample.}

\item{.verbose}{if T then show progress bar.}

\item{.prop.col}{Column with proportions for each clonotype.}

\item{...}{Further values passed to \code{.fun}.}
}
\value{
Either result from \code{.postfun} or list of length \code{.n} with values of \code{.fun}.
}
\description{
Resample rows (i.e., clones) in the given data frame and apply the given function to them.
}
\details{
Argument \code{.sim} can take two possible values: "uniform" (for uniform distribution), when
each row can be taken with equal probability, and "perccentage" when each row can be taken with
probability equal to its "Read.proportion" column.
}
\examples{
\dontrun{
# Apply entropy.seg function to samples of size 20000 from immdata$B data frame for 100 iterations.
bootstrap.tcr(immdata[[2]], .fun = entropy.seg, .n = 100, .size = 20000, .sim = 'uniform')
}
}
