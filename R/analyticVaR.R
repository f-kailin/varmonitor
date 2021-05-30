analyticVaR <- function (confidence, position, sigma, horizon = 1) {
  # Reorganize the input
  confidence    <- sort(confidence)
  horizon       <- sort(horizon)
  
  # Initializing the output setup
  parametricVaR <- c()
  deltaVaR      <- matrix(0, nrow = length(confidence)*length(horizon), ncol = length(position))
  componentVaR  <- matrix(0, nrow = length(confidence)*length(horizon), ncol = length(position))
  rcVaR         <- matrix(0, nrow = length(confidence)*length(horizon), ncol = length(position))
  
  # Main
  for (i in 1:length(confidence)) {
    for (j in 1:length(horizon)) {
      parametricVaR_i   <- abs(as.numeric(sqrt(position%*%sigma%*%position) * qnorm(confidence[i]) * sqrt(horizon[j])))
      deltaVaR_i        <- as.numeric(parametricVaR_i * position%*%sigma) / as.numeric(position%*%sigma%*%position)
      componentVaR_i    <- deltaVaR_i * position
      rcVaR_i           <- componentVaR_i / parametricVaR_i
      
      parametricVaR[i]  <- parametricVaR_i
      deltaVaR[i, ]     <- round(deltaVaR_i, 6)
      componentVaR[i, ] <- round(componentVaR_i, 2)
      rcVaR[i, ]        <- round(rcVaR_i, 4)
    }
  }
  
  # Output
  return(list("Delta VaR" = cbind(confidence, deltaVaR), 
              "Component VaR" = cbind(confidence, componentVaR), 
              "Relative VaR" = cbind(confidence, rcVaR)))
}
