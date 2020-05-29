#' @title Optimal Test Plans with Minimum Expected Overall Costs in Binomial RDT Design
#'
#' @description Define the optimal function to find the optimal test plans with minimum expected overall costs (for binomial RDT).
#'
#' @param Cf Fixed costs of RDT
#' @param Cv Variable unit costs of RDT
#' @param nvec Vector of test sample size
#' @param G Reliabilty growth cost
#' @param Cw Average cost per warranty claim
#' @param N Sales volume
#' @param Rvec Vector of lower level reliability requirements
#' @param cvec Vector of maximum allowable failures
#' @param pi Failure probability
#' @param thres_CR Threshold (acceptable level) of consumer's risk
#' @return Vector of optimal test plan parameters, acceptance probabiltiy and cost
#' @export
#' @examples
#' \donttest{
#' nvec <- seq(0, 10, 1)
#' Rvec <- seq(0.8, 0.85, 0.01)
#' cvec <- seq(0, 2, 1)
#' pi <- pi_MCSim_beta(M = 5000, seed = 10, a = 1, b = 1)
#' boptimal_cost(Cf = 10, Cv = 10, nvec = nvec, G = 100, Cw = 10,
#' N = 100, Rvec = Rvec, cvec = cvec, pi = pi, thres_CR = 0.5);
#' }



boptimal_cost <- function(Cf, Cv, nvec, G, Cw, N, Rvec, cvec, pi, thres_CR){
  #generate
  data <- bdata_generator(Cf, Cv, nvec, G, Cw, N, Rvec, cvec, pi,
                          par = all(), option = c('optimal'), thres_CR)

  #Generate optimal test plans
  optimal_index <- which(data[, 'Overall Cost'] == min(data[, 'Overall Cost']))

  return(data[optimal_index, ])
}
