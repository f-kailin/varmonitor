\name{varmonitor-package}
\alias{varmonitor-package}
\alias{varmonitor}
\docType{package}
\title{
\packageTitle{varmonitor}
}
\description{
\packageDescription{varmonitor}
}
\details{
The DESCRIPTION file:
\packageDESCRIPTION{varmonitor}
\packageIndices{varmonitor}
}
\author{
\packageAuthor{varmonitor}

Maintainer: \packageMaintainer{varmonitor}
}
\references{
Artzner P., Delbaen F., Eber J.M., Heath D. (1999): Coherent Measures of Risk in Mathematical Finance, 9th vol, Wiley.\cr
Hull J.C. (2015): "Value-at-Risk and Expected Shortfall" in "Risk Management and Financial Institutions", Wiley.\cr
Hull J.C. (2015): "Model-Building Approach" in "Risk Management and Financial Institutions", Wiley.\cr
Jorion P. (2007): "Portfolio Risk: Analytical Methods" in "Value at Risk", McGraw-Hill.
}
\keyword{ package }
\seealso{
\code{\link{parametricVaR}}
\code{\link{parametricES}}
\code{\link{analyticVaR}}
\code{\link{analyticES}}
}
\examples{
##
parametricVaR(.99, -1000000, .01)
##
parametricES(c(0.95, 0.975, 0.99), 1000000, 0.01, c(1, 5, 22))
##
weights <- c(100000, -100000, 100000)
varcov <- matrix(c(0.05, 0.03, 0.01, 0.03, 0.04, 0.02, 0.01, 0.02, 0.03), nrow = 3)
analyticVaR(c(0.95, 0.99, 0.999), weights, varcov, 5)
##
analyticES(.99, weights, varcov)
}
