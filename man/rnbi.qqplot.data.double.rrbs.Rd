% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/qqplot.R
\name{rnbi.qqplot.data.double.rrbs}
\alias{rnbi.qqplot.data.double.rrbs}
\title{rnbi.qqplot.data.double.rrbs
 For RRBS analaysis
convert the p-values of the two analysis in to an object of class qqplot.data which will be used to draw qqplot.}
\usage{
rnbi.qqplot.data.double.rrbs(x, y, p = "diffmeth.p.val")
}
\arguments{
\item{x}{a dataframe of differential methlytion p-value from one analysis}

\item{y}{a dataframe of differential methlytion p-value from second analysis}

\item{p}{column consist of differential methylation p-values}
}
\value{
return an object of class qqplot.data which will be used to draw qqplot for two RRBS analysis
}
\description{
rnbi.qqplot.data.double.rrbs
 For RRBS analaysis
convert the p-values of the two analysis in to an object of class qqplot.data which will be used to draw qqplot.
}
