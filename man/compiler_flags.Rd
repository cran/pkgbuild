% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/compiler-flags.R
\name{compiler_flags}
\alias{compiler_flags}
\title{Default compiler flags used by devtools.}
\usage{
compiler_flags(debug = FALSE)
}
\arguments{
\item{debug}{If \code{TRUE} adds \code{-g -O0} to all flags
(Adding \env{FFLAGS} and \env{FCFLAGS})}
}
\description{
These default flags enforce good coding practice by ensuring that
\env{CFLAGS} and \env{CXXFLAGS} are set to \code{-Wall -pedantic}.
These tests are run by cran and are generally considered to be good practice.
}
\details{
By default \code{\link[=compile_dll]{compile_dll()}} is run with \code{compiler_flags(TRUE)},
and check with \code{compiler_flags(FALSE)}.  If you want to avoid the
possible performance penalty from the debug flags, install the package.
}
\examples{
compiler_flags()
compiler_flags(TRUE)
}
\seealso{
Other debugging flags: 
\code{\link{with_debug}()}
}
\concept{debugging flags}
