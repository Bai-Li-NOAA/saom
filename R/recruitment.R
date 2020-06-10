library("R6")

Recruitment <- R6Class("Recruitment",
  public = list(
    recruit = NA,
    unit = "10^3"
  )
)

BevertonHoltRecruitment <- R6Class("BevertonHolt",
  inherit = Recruitment,
  public = list(
    R0 = NA,
    h = NA,
    spr_F0 = NA,
    SSB = NA,

    initialize = function(R0, h, spr_F0, SSB) {
      self$R0 <- R0
      self$h <- h
      self$spr_F0 <- spr_F0
      self$SSB <- SSB
      self$recruit <- ((0.8*self$R0*self$h*self$SSB)/(0.2*self$R0*self$spr_F0*(1.0-self$h)+(self$h-0.2)*self$SSB))
    }
  )
)

RickerRecruitment <- R6Class("Ricker",
  inherit = Recruitment,
  public = list(
    R0 = NA,
    h = NA,
    spr_F0 = NA,
    SSB = NA,
    recruit = NA,

    initialize = function(R0, h, spr_F0, SSB) {
      self$R0 <- R0
      self$h <- h
      self$spr_F0 <- spr_F0
      self$SSB <- SSB
      self$recruit <- ((self$SSB/self$spr_F0)*exp(self$h*(1-self$SSB/(self$R0*self$spr_F0))))
    }
  )
)

RecruitmentFactory <- R6Class("RecruitmentFactory",
  public = list(
    BevertonHoltRecruitment = function(R0, h, spr_F0, SSB) {
      BevertonHoltRecruitment$new(R0, h, spr_F0, SSB)
    },
    RickerRecruitment = function(R0, h, spr_F0, SSB) {
      RickerRecruitment$new(R0, h, spr_F0, SSB)
    }
  )
)
