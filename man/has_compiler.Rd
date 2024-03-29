% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/compiler.R
\name{has_compiler}
\alias{has_compiler}
\alias{check_compiler}
\alias{has_devel}
\title{Is a compiler available?}
\usage{
has_compiler(debug = FALSE)

check_compiler(debug = FALSE)
}
\arguments{
\item{debug}{If \code{TRUE}, will print out extra information useful for
debugging. If \code{FALSE}, it will use result cached from a previous run.}
}
\description{
These functions check if a small C file can be compiled, linked, loaded
and executed.

\code{has_compiler()} and \code{has_devel()} return \code{TRUE} or \code{FALSE}.
\code{check_compiler()} and \code{check_devel()}
throw an error if you don't have developer tools installed.
If the \code{"pkgbuild.has_compiler"} option is set to \code{TRUE} or \code{FALSE},
no check is carried out, and the value of the option is used.

The implementation is  based on a suggestion by Simon Urbanek.
End-users (particularly those on Windows) should generally run
\code{\link[=check_build_tools]{check_build_tools()}} rather than \code{\link[=check_compiler]{check_compiler()}}.
}
\examples{
has_compiler()
check_compiler()

with_build_tools(has_compiler())
}
\seealso{
\code{\link[=check_build_tools]{check_build_tools()}}
}
