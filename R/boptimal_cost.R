#' @title Optimal Expected Overall Costs in Binomial RDT Design
#'
#' @description Define the optimal function to find the optimal test plan with optimal expected overall costs (for binomial RDT).
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
#' @seealso \code{\link{boptimal_n}}
#' @export
#' @examples
#' nvec <- seq(0, 10, 1)
#' Rvec <- seq(0.8, 0.85, 0.01)
#' cvec <- seq(0, 2, 1)
#' pi <- pi_MCSim_beta(M = 5000, seed = 10, a = 1, b = 1)
#' boptimal_cost(Cf = 10, Cv = 10, nvec = nvec, G = 100, Cw = 10,
#' N = 100, Rvec = Rvec, cvec = cvec, pi = pi, thres_CR = 0.5);



boptimal_cost <- function(Cf, Cv, nvec, G, Cw, N, Rvec, cvec, pi, thres_CR){
  #exapnd all possible combinations of n, c, R
  n_R_c_vecs <- expand.grid(nvec, Rvec, cvec)
  #Generate expected overall cost
  costvec <- mapply(bcost_expected, n = n_R_c_vecs[,1], c = n_R_c_vecs[,3],
                    MoreArgs = list(Cf = Cf, Cv = Cv, G = G, Cw = Cw, N = N, pi = pi))
  #Generate consumer's risk
  CRvec <- mapply(bconsumerrisk, n = n_R_c_vecs[,1], c = n_R_c_vecs[,3], R = n_R_c_vecs[,2],
                  MoreArgs = list(pi = pi))
  #Generate optimal test plans
  optimal_index <- which(costvec == min(costvec[which(CRvec <= thres_CR)]))
  n_optimal <- n_R_c_vecs[optimal_index, 1]
  R_optimal <- n_R_c_vecs[optimal_index, 2]
  c_optimal <- n_R_c_vecs[optimal_index, 3]
  n_c_optimal <- n_R_c_vecs[optimal_index,c(1, 3)]

  #Generate acceptable probabilities for optimal test plans
  AP_optimal <- mapply(bacceptprob, n = n_c_optimal[, 1], c = n_c_optimal[, 2],
                       MoreArgs = list(pi = pi))
  #
  CR_optimal <- CRvec[optimal_index]
  cost_optimal <- costvec[optimal_index]
  #
  results <- cbind(n_optimal, R_optimal, c_optimal, AP_optimal, CR_optimal, cost_optimal)
  #colnames(results) <- c('n', 'R', 'c', 'AP', 'CR', 'Optimal Cost')
  return(results)
}
