analyticES <- function (confidence, position, sigma, horizon = 1) {
  # Reorganize the input
  confidence    <- sort(confidence)
  horizon       <- sort(horizon)
  
  # Initializing the output setup
  parametricES  <- c()
  deltaES       <- matrix(0, nrow = length(confidence)*length(horizon), ncol = length(position))
  componentES   <- matrix(0, nrow = length(confidence)*length(horizon), ncol = length(position))
  rcES          <- matrix(0, nrow = length(confidence)*length(horizon), ncol = length(position))
  
  # Main
  for (i in 1:length(confidence)) {
    for (j in 1:length(horizon)) {
      parametricES_i    <- abs(as.numeric(sqrt(position%*%sigma%*%position) * exp(-qnorm(1-confidence[i])^2/2)/(sqrt(2*pi)*(1-confidence[i])) * sqrt(horizon[j])))
      deltaES_i         <- as.numeric(parametricES_i * position%*%sigma) / as.numeric(position%*%sigma%*%position)
      componentES_i     <- deltaES_i * position
      rcES_i            <- componentES_i / parametricES_i
      
      parametricES[i]   <- parametricES_i
      deltaES[i, ]      <- round(deltaES_i, 6)
      componentES[i, ]  <- round(componentES_i, 2)
      rcES[i, ]         <- round(rcES_i, 4)
    }
  }
  
  # Output
  return(list("Delta ES" = cbind(confidence, deltaES), 
              "Component ES" = cbind(confidence, componentES), 
              "Relative ES" = cbind(confidence, rcES)))
}
