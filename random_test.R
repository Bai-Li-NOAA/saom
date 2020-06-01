mat1 <- Maturity$new()
mat1$maturity_at_age <- matrix(rep(1:12, times=3),
                               nrow=3,
                               byrow=TRUE)
mat <- MaturityFactory$new()
mat2 <- mat$SimpleLogisticMaturity(3, 2.25, 1:12, 1)

growth1 <- Growth$new()
growth1$length_at_age <- matrix(rep(1:12, times=3),
                             nrow=3,
                             byrow=TRUE)
growth1$weight_at_age <- power(growth1$length_at_age, coefficient = 0.000000025, exponent = 3)

growth <- GrowthFactory$new()
growth2 <- growth$vonBertalanffy(800, 0.18, -1.36, 1:12, 5)
growth2$length_at_age

waa <- GrowthFactory$new()
growth2$weight_at_age <- waa$PowerWeight(0.000000025, 3, growth2$length_at_age)$weight_at_age

waa1 <- Growth$new()
waa1$weight_at_age <- matrix(rep(1:12, times=3),
                             nrow=3,
                             byrow=TRUE)

