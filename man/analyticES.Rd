\name{analyticES}
\alias{analyticES}
\title{analyticES}
\description{The function calculate the contribution in different scales to the portfolio Expected Shortfall.}
\usage{analyticES(confidence, position, sigma, horizon = 1)}
\arguments{
  \item{confidence}{
        Confidence interval.\cr
        (e.g. "0.95" or a vector with different confidence interval)
        }
  \item{position}{
        Vector of positions in monetary terms.
        }
  \item{sigma}{
        Variance-covariance matrix of the whole portfolio.
        }
  \item{horizon}{
        Time horizon.\cr
        (e.g. "daily: 1", "weekly: 5", "monthly: 22")
        }
}
\details{
Returns the marginal, component and relative component Expected Shortfall.\cr 
It is also scalable with vectors containing multiple confidence intervals.\cr
Due to the multidimensional nature of this metric we would not suggest using multiple time horizon.
}
\value{"Delta ES", "Component ES" in monetary terms and "Relative-Component ES" in decimals.}
\references{
  Hull J.C. (2015): "Value-at-Risk and Expected Shortfall" in "Risk Management and Financial Institutions", Wiley.\cr
  Jorion P. (2007): "Portfolio Risk: Analytical Methods" in "Value at Risk", McGraw-Hill.
}
\author{Gatti Riccardo, Lin Francesco}
\note{
The function can be run for a portfolio with a single exposure, but there will be a single value for "Component ES" and "Relative-Component ES".\cr
Reminder: the central assumption under this function states that underlying market variables is normally distributed.\cr
This involves assuming a model for the joint distribution of changes in the market variables and using historical data to estimate the model parameters.
}
\seealso{
\code{\link{parametricVaR}}
\code{\link{parametricES}}
\code{\link{analyticVaR}}
}
\examples{
##
weights <- c(100000, -100000, 100000)
varcov <- matrix(c(0.05, 0.03, 0.01, 0.03, 0.04, 0.02, 0.01, 0.02, 0.03), nrow = 3)
analyticES(c(0.95, 0.99, 0.999), weights, varcov, 5)
##
analyticES(.99, weights, varcov)
## NOT RUN
analyticES(.99, weights, varcov, c(1, 5))
}
