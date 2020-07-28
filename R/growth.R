# library("R6")
#
# Growth <- R6Class("Growth",
#   public = list(
#     length_at_age = NULL,
#     weight_at_age = NULL
#   )
# )
#
# vonBertalanffy <- R6Class("vonBertalanffy",
#   inherit = Growth,
#   public = list(
#     linf = NULL,
#     k = NULL,
#     a0 = NULL,
#
#     initialize = function(linf, k, a0, age_vector, nyears) {
#       self$linf <- linf
#       self$k <- k
#       self$a0 <- a0
#       self$length_at_age <- matrix(
#         rep(linf*(1-exp(-k*(age_vector-a0))), times=nyears),
#         nrow=nyears,
#         byrow=TRUE)
#     }
#   )
# )
#
# PowerWeight <- R6Class("PowerWeight",
#   inherit = Growth,
#   public = list(
#     coefficient = NULL,
#     exponent = NULL,
#     power_function = power,
#
#     initialize = function(coefficient, exponent, length_at_age) {
#       self$coefficient <- coefficient
#       self$exponent <- exponent
#       self$weight_at_age <- self$power_function(length_at_age, coefficient, exponent)
#     }
#   )
# )
#
# GrowthFactory <- R6Class("GrowthFactory",
#   public = list(
#     vonBertalanffy = function(linf, k, a0, age_vector, nyears) {
#       vonBertalanffy$new(linf, k, a0, age_vector, nyears)
#     },
#     PowerWeight = function(coefficient, exponent, length_at_age) {
#       PowerWeight$new(coefficient, exponent, length_at_age)
#     }
#   )
# )
#
