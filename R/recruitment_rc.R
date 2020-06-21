Recruitment <- setRefClass(
  Class = "Recruitment",
  fields = list(
    recruit = "numeric"
  )
)

BevertonHoltRecruitment <- setRefClass(
  Class = "BevertonHoltRecruitment",
  contains = "Recruitment",

  methods = list(
    initialize = function(R0, h, spr_F0, SSB) {
      .self$calculateRecruit(R0, h, spr_F0, SSB)
    },
    calculateRecruit = function(R0, h, spr_F0, SSB)
    {
      recruit <<- (0.8*R0*h*SSB) / (0.2*R0*spr_F0*(1.0-h)+(h-0.2)*SSB)
    }
  )
)

RickerRecruitment <- setRefClass(
  Class = "RickerRecruitment",
  contains = "Recruitment",

  methods = list(
    initialize = function(R0, h, spr_F0, SSB) {
      .self$calculateRecruit(R0, h, spr_F0, SSB)
    },
    calculateRecruit = function(R0, h, spr_F0, SSB)
    {
      recruit <<- (SSB/spr_F0)*exp(h*(1-SSB/(R0*spr_F0)))
    }
  )
)

RecruitmentFactory <- setRefClass(
  Class = "RecruitmentFactory",
  methods = list(
    BevertonHoltSRR = function(R0, h, spr_F0, SSB) {
      return (BevertonHoltRecruitment$new(R0, h ,spr_F0, SSB))
    },

    RickerSRR = function(R0, h, spr_F0, SSB) {
      return (RickerRecruitment$new(R0, h ,spr_F0, SSB))
    }
  )
)



