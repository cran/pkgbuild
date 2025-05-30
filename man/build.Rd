% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/build.R
\name{build}
\alias{build}
\title{Build package}
\usage{
build(
  path = ".",
  dest_path = NULL,
  binary = FALSE,
  vignettes = TRUE,
  manual = FALSE,
  clean_doc = NULL,
  args = NULL,
  quiet = FALSE,
  needs_compilation = pkg_has_src(path),
  compile_attributes = FALSE,
  register_routines = FALSE
)
}
\arguments{
\item{path}{Path to a package, or within a package.}

\item{dest_path}{path in which to produce package. If it is an existing
directory, then the output file is placed in \code{dest_path} and named
according to the current R conversions (e.g. \code{.zip} for Windows binary
packages, \code{.tgz} for macOS binary packages, etc).
If it is an existing file, then it will be overwritten.
If \code{dest_path} does not exist, then it is used as a file name.
If \code{NULL}, it defaults to the parent directory of the package.}

\item{binary}{Produce a binary (\code{--binary}) or source (
\code{--no-manual --no-resave-data}) version of the package.}

\item{vignettes, manual}{For source packages: if \code{FALSE}, don't build PDF
vignettes (\code{--no-build-vignettes}) or manual (\code{--no-manual}).}

\item{clean_doc}{If \code{TRUE}, clean the files in \code{inst/doc} before building
the package. If \code{NULL} and the \code{Config/build/clean-inst-doc} entry is
present in \code{DESCRIPTION}, then that is used. Otherwise, if \code{NULL},
and interactive, ask to remove the files prior to cleaning. In most
cases cleaning the files is the correct behavior to avoid stale
vignette outputs in the built package.}

\item{args}{An optional character vector of additional command
line arguments to be passed to \verb{R CMD build} if \code{binary = FALSE},
or \verb{R CMD install} if \code{binary = TRUE}.}

\item{quiet}{if \code{TRUE} suppresses output from this function.}

\item{needs_compilation}{Usually only needed if the packages has
C/C++/Fortran code. By default this is autodetected.}

\item{compile_attributes}{if \code{TRUE} and the package uses Rcpp, call
\code{\link[Rcpp:compileAttributes]{Rcpp::compileAttributes()}} before building the package. It is ignored
if package does not need compilation.}

\item{register_routines}{if \code{TRUE} and the package does not use Rcpp, call
register routines with
\code{tools::package_native_routine_registration_skeleton()} before building
the package. It is ignored if package does not need compilation.}
}
\value{
a string giving the location (including file name) of the built
package
}
\description{
Building converts a package source directory into a single bundled file.
If \code{binary = FALSE} this creates a \code{tar.gz} package that can
be installed on any platform, provided they have a full development
environment (although packages without source code can typically be
installed out of the box). If \code{binary = TRUE}, the package will have
a platform specific extension (e.g. \code{.zip} for windows), and will
only be installable on the current platform, but no development
environment is needed.
}
\details{
\subsection{Configuration}{
\subsection{\code{DESCRIPTION} entries}{
\itemize{
\item \code{Config/build/clean-inst-doc} can be set to \code{FALSE} to avoid cleaning up
\code{inst/doc} when building a source package. Set it to \code{TRUE} to force a
cleanup. See the \code{clean_doc} argument.
\item \code{Config/build/copy-method} can be used to avoid copying large
directories in \verb{R CMD build}. It works by copying (or linking) the
files of the package to a temporary directory, leaving out the
(possibly large) files that are not part of the package. Possible
values:
\itemize{
\item \code{none}: pkgbuild does not copy the package tree. This is the default.
\item \code{copy}: the package files are copied to a temporary directory before
\verb{ R CMD build}.
\item \code{link}: the package files are symbolic linked to a temporary
directory before \verb{R CMD build}. Windows does not have symbolic
links, so on Windows this is equivalent to \code{copy}.
}

You can also use the \code{pkg.build_copy_method} option or the
\code{PKG_BUILD_COPY_METHOD} environment variable to set the copy method.
The option is consulted first, then the \code{DESCRIPTION} entry, then the
environment variable.
\item \code{Config/build/extra-sources} can be used to define extra source files
for pkgbuild to decide whether a package DLL needs to be recompiled in
\code{needs_compile()}. The syntax is a comma separated list of file names,
or globs. (See \code{\link[utils:glob2rx]{utils::glob2rx()}}.) E.g. \verb{src/rust/src/*.rs} or
\verb{configure*}.
\item \code{Config/build/bootstrap} can be set to \code{TRUE} to run
\verb{Rscript bootstrap.R} in the source directory prior to running subsequent
build steps.
\item \code{Config/build/never-clean} can be set to \code{TRUE} to never add \code{--preclean}
to \verb{R CMD INSTALL}, e.g., when header files have changed.
This helps avoiding rebuilds that can take long for very large C/C++ codebases
and can lead to build failures if object files are out of sync with header files.
Control the dependencies between object files and header files
by adding \verb{include file.d} to \code{Makevars} for each \code{file.c} or \code{file.cpp} source file.
}
}

\subsection{Options}{
\itemize{
\item \code{pkg.build_copy_method}: use this option to avoid copying large
directories when building a package. See possible values above, at the
\code{Config/build/copy-method} \code{DESCRIPTION} entry.
\item \code{pkg.build_stop_for_warnings}: if it is set to \code{TRUE}, then pkgbuild
will stop for \verb{R CMD build} errors. It takes precedence over the
\code{PKG_BUILD_STOP_FOR_WARNINGS} environment variable.
}
}

\subsection{Environment variables}{
\itemize{
\item \code{PKG_BUILD_COLOR_DIAGNOSTICS}: set it to \code{false} to opt out of colored
compiler diagnostics. Set it to \code{true} to force colored compiler
diagnostics.
\item \code{PKG_BUILD_COPY_METHOD}: use this environment variable to avoid copying
large directories when building a package. See possible values above,
at the \code{Config/build/copy-method} \code{DESCRIPTION} entry.
}

will stop for \verb{R CMD build} errors. The \code{pkg.build_stop_for_warnings}
option takes precedence over this environment variable.
}

}
}
