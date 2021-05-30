\name{parametricVaR}
\alias{parametricVaR}
\title{parametricVaR}
\description{The function calculate the Value-at-Risk for a portfolio of one or more securities with a parametric approach.}
\usage{parametricVaR(confidence, position, sigma, horizon = 1)}
\arguments{
  \item{confidence}{
        Quantile of the normal distirbution.\cr 
        (e.g. "0.95" or a vector with different confidence interval)
        }
  \item{position}{
        Vector of positions in monetary terms.
        }
  \item{sigma}{
        Volatility of a single secutiry or variance-covariance matrix of the whole portfolio.
        }
  \item{horizon}{
        Time horizon.\cr 
        (e.g. "daily: 1", "weekly: 5", "monthly: 22")
        }
}
\details{
The function automatically recognises if the input values are in scalar or multidimensional form.\cr
It is also scalable with vectors containing multiple confidence intervals and/or time horizons.
}
\value{Value-at-Risk of a portfolio of "N" assets in monetary terms.}
\references{
Hull J.C. (2015): "Value-at-Risk and Expected Shortfall" in "Risk Management and Financial Institutions", Wiley.\cr
Jorion P. (2007): "Portfolio Risk: Analytical Methods" in "Value at Risk", McGraw-Hill.
}
\author{Gatti Riccardo, Lin Francesco}
\note{
Reminder: the central assumption under this function states that underlying market variables is normally distributed. This involves assuming a model for the joint distribution of changes in the market variables and using historical data to estimate the model parameters.
}
\seealso{
\code{\link{parametricES}}
\code{\link{analyticVaR}}
\code{\link{analyticES}}
}
\examples{
##
parametricVaR(.99, -1000000, .01)
##
parametricVaR(c(0.95, 0.975, 0.99), 1000000, 0.01, c(1, 5, 22))
##
c <- c(0.95, 0.99)
t <- c(1, 5)
weights <- c(100000, -100000, 100000)
varcov <- matrix(c(0.05, 0.03, 0.01, 0.03, 0.04, 0.02, 0.01, 0.02, 0.03), nrow = 3)
parametricVaR(c, weights, varcov, t)
}

