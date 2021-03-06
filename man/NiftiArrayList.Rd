% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/NiftiArrayList.R
\name{NiftiArrayList}
\alias{NiftiArrayList}
\title{Write Multiple NiftiArray Objects into a List}
\usage{
NiftiArrayList(x, ..., verbose = FALSE)
}
\arguments{
\item{x}{a character or list of objects to be called with
\link{writeNiftiArray}}

\item{...}{additional arguments to pass to \link{NiftiArray}}

\item{verbose}{show progress bars if \code{pbapply} package installed.}
}
\value{
A list of class \code{NiftiArrayList}, which is a
list if \code{NiftiArray} objects
}
\description{
Reads multiple NiftiArray objects into elements of a list.
TODO: Add more detail based on BUG fix.
}
\examples{
nii_fname = system.file("extdata",
"example.nii.gz", package = "RNifti")
nii_fname = rep(nii_fname, 3)
res = NiftiArrayList(nii_fname)
if (requireNamespace("pbapply", quietly = TRUE)) {
   res = NiftiArrayList(nii_fname, verbose = TRUE)
} else {
   testthat::expect_warning({
   res = NiftiArrayList(nii_fname, verbose = TRUE)
   })
}
testthat::expect_is(res, "NiftiArrayList")
mat = as(res, "NiftiMatrix")
arr = as(res, "NiftiArray")
h5 = unlist(DelayedArray::seedApply(res, slot, "filepath"))
res2 = NiftiArrayList(h5)
testthat::expect_is(res2, "NiftiArrayList")
mat = as(res2, "NiftiMatrix")
arr = as(res2, "NiftiArray")
}
