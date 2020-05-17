#install.packages("R6")

library("R6")

Maturity <- R6Class("Maturity",
  public = list(
    maturity_at_age = NULL
  )
)

SimpleLogisticMaturity <- R6Class("SimpleLogisticMaturity",
  inherit = Maturity,
  public = list(
    slope = NULL,
    age_50 = NULL,
    simple_logistic_function = logistic,

    initialize = function(slope, age_50, age_vector, nyears) {
      self$slope <- slope
      self$age_50 <- age_50
      self$maturity_at_age <- matrix(
        rep(self$simple_logistic_function(age_vector, slope, age_50), times=nyears),
        nrow=nyears,
        byrow=TRUE)
    }
  )
)

MaturityFactory <- R6Class("MaturityFactory",
  public = list(
    SimpleLogisticMaturity = function(slope, age_50, age_vector, nyears) {
      SimpleLogisticMaturity$new(slope, age_50, age_vector, nyears)
    }
  )
)

