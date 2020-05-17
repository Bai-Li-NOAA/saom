test_that("customized maturity matrix", {
  mat1 <- Maturity$new()
  mat1$maturity_at_age <- matrix(rep(1:12, times=3),
                                 nrow=3,
                                 byrow=TRUE)
  true_values <- matrix(rep(1:12, times=3),
                                 nrow=3,
                                 byrow=TRUE)
  expect_equal(mat1$maturity_at_age, true_values)
})

test_that("simple logistic maturity", {
  mat <- MaturityFactory$new()
  mat2 <- mat$SimpleLogisticMaturity(3, 2.25, 1:12, 1)

  true_values <- matrix(1/(1+exp(-3*(1:12-2.25))), nrow=1)
  expect_identical(mat2$maturity_at_age, true_values)
})


