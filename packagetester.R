# Set the folder of this file as the current working directory
install.packages("varmonitor.gz", repos = NULL, type = "source")
# or
devtools::install_github("f-kailin/varmonitor@main")
# or
remotes::install_github("f-kailin/varmonitor@main")

# Loading the package
library(varmonitor)

# Loading the inputs
conf    <- c(.95, .975, .99, .995, .9975, .999)
time    <- c(1, 5, 22)
weights <- as.numeric(c(18602216.35, -1515226.77, -31936755.16, 0, 60976866.97))
varcov  <- rbind(c(3.97600652655323E-09, 8.46915037686481E-09, 1.46292456350899E-08, 2.16334896000542E-08, 3.0021321934755E-08),
                 c(8.46915037686481E-09, 2.44448235304125E-08, 4.44368837028242E-08, 6.82497052130311E-08, 9.71054208370087E-08),
                 c(1.46292456350899E-08, 4.44368837028242E-08, 8.63255510480989E-08, 1.36108603370206E-07, 1.98095470883103E-07),
                 c(2.16334896000542E-08, 6.82497052130311E-08, 1.36108603370206E-07, 2.31292232834053E-07, 3.44023806117867E-07),
                 c(3.0021321934755E-08, 9.71054208370087E-08, 1.98095470883103E-07, 3.44023806117867E-07, 5.24255477910439E-07))

# Testing the functions
test1_0 <- parametricVaR(.99, weights, varcov)                # [V] PTF with 5 assets
test1_1 <- parametricVaR(.99, -1000000, .01)                  # [V] One short sell position
test1_2 <- parametricVaR(conf, weights, varcov)               # [V] PTF with 5 assets w/ multiple confidence level
test1_3 <- parametricVaR(conf, -1000000, .01)                 # [V] One short sell position w/ multiple confidence level

test1_4 <- parametricVaR(.99, weights, varcov, time)          # [V] PTF with 5 assets w/ multiple horizon time
test1_5 <- parametricVaR(.99, -1000000, .01, time)            # [V] One short sell position w/ multiple horizon time
test1_6 <- parametricVaR(conf, weights, varcov, time)         # [V] PTF with 5 assets w/ multiple confidence level and horizon time
test1_7 <- parametricVaR(conf, -1000000, .01, time)           # [V] One short sell position w/ multiple confidence level and horizon time


test2_0 <- parametricES(.99, weights, varcov)                 # [V] PTF with 5 assets
test2_1 <- parametricES(.99, -1000000, .01)                   # [V] One short sell position
test2_2 <- parametricES(conf, weights, varcov)                # [V] PTF with 5 assets w/ multiple confidence level
test2_3 <- parametricES(conf, -1000000, .01)                  # [V] One short sell position w/ multiple confidence level

test2_4 <- parametricES(.99, weights, varcov, time)           # [V] PTF with 5 assets w/ multiple horizon time
test2_5 <- parametricES(.99, -1000000, .01, time)             # [V] One short sell position w/ multiple horizon time
test2_6 <- parametricES(conf, weights, varcov, time)          # [V] PTF with 5 assets w/ multiple confidence level and horizon time
test2_7 <- parametricES(conf, -1000000, .01, time)            # [V] One short sell position w/ multiple confidence level and horizon time


test3_0 <- analyticVaR(.99, weights, varcov)                  # [V] PTF with 5 assets
test3_1 <- analyticVaR(conf, weights, varcov)                 # [V] PTF with 5 assets w/ multiple confidence level


test4_0 <- analyticES(.99, weights, varcov)                   # [V] PTF with 5 assets
test4_1 <- analyticES(conf, weights, varcov)                  # [V] PTF with 5 assets w/ multiple confidence level


# Uninstalling the package
remove.packages("varmonitor")
