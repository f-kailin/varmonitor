parametricVaR <- function (confidence, position, sigma, horizon = 1) {
  # Reorganize the input
  confidence <- sort(confidence)
  horizon    <- sort(horizon)
  
  # Initializing the output setup
  VaR        <- c()
  data       <- matrix(0, nrow = 3, ncol = length(confidence)*length(horizon))
  data[1, ]  <- sort(rep(confidence, length(horizon)))
  data[2, ]  <- rep(horizon, length(confidence))
  
  # Main
  if (is.matrix(sigma) || is.array(position)) {
    # Portfolio with N securities
    for (i in 1:length(confidence)) {
      for (j in 1:length(horizon)) {
        VaR[length(VaR) + 1]    <- abs(as.numeric(sqrt(position%*%sigma%*%position) * qnorm(confidence[i]) * sqrt(horizon[j])))
      }
    }
  } else {
    # Portfolio with one security
    for (i in 1:length(confidence)) {
      for (j in 1:length(horizon)) {
        VaR[length(VaR) + 1]    <- as.numeric(abs(position)*sigma * qnorm(confidence[i]) * sqrt(horizon[j]))
      }
    }
  }
  data[3, ]  <- round(VaR, 2)
  
  # Output
  return(data.frame(cbind(c("Confidence level", "Time horizon", "Value-at-Risk"), data)))
}
