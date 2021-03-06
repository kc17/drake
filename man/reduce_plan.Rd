% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/generate.R
\name{reduce_plan}
\alias{reduce_plan}
\title{Write commands to reduce several targets down to one.}
\usage{
reduce_plan(plan = NULL, target = "target", begin = "", op = " + ",
  end = "", pairwise = TRUE)
}
\arguments{
\item{plan}{workflow plan data frame of prespecified targets}

\item{target}{name of the new reduced target}

\item{begin}{character, code to place at the beginning
of each step in the reduction}

\item{op}{binary operator to apply in the reduction}

\item{end}{character, code to place at the end
of each step in the reduction}

\item{pairwise}{logical, whether to create multiple
new targets, one for each pair/step in the reduction (\code{TRUE}),
or to do the reduction all in one command.}
}
\value{
A workflow plan data frame that aggregates multiple
prespecified targets into one additional target downstream.
}
\description{
Creates a new workflow plan data frame with the
commands to do a reduction (i.e. to repeatedly apply a binary
operator to pairs of targets to produce one target).
}
\examples{
# Workflow plan for datasets:
x_plan <- evaluate_plan(
  drake_plan(x = VALUE),
  wildcard = "VALUE",
  values = 1:8
)
# Create a new target from the sum of the others.
reduce_plan(x_plan, target = "x_sum", pairwise = FALSE)
# For memory efficiency and parallel computing,
# reduce pairwise:
reduce_plan(x_plan, target = "x_sum", pairwise = TRUE)
# Optionally define your own function and use it as the
# binary operator in the reduction.
x_plan <- evaluate_plan(
  drake_plan(x = VALUE),
  wildcard = "VALUE",
  values = 1:9
)
x_plan
reduce_plan(
  x_plan, target = "x_sum", pairwise = TRUE,
  begin = "fun(", op = ", ", end = ")"
)
}
