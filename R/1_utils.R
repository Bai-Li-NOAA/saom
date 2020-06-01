#### Store global functions ####
logistic<-function(x, slope, inflection){
  ## INPUT PARAMETERS:
  ##    x = vector or scalar of indepenent variable
  ##    slope = slope parameter
  ##    inflection = location parameter: x giving 50% probability
  ## OUTPUT PARAMETERS:
  ##    P = values of fcn at x

  P=1/(1+exp(-slope*(x-inflection)))
  return(P)
}

power<-function(x, coefficient, exponent){
  ## INPUT PARAMETERS:
  ##    x = vector or scalar of indepenent variable
  ##    coefficient = a simple scaling factor
  ##    exponent = the power
  ## OUTPUT PARAMETERS:
  ##    y = values of fcn at x

  y=coefficient*x^exponent
  return(y)
}
