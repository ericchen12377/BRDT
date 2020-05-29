#' @title Cost Function for Warranty Services
#'
#' @description Define the cost function of warranty services (WS) after the decision of the test (for binomial RDT)
#'
#' @param Cw Average cost per warranty claim
#' @param N Sales volume
#' @param n RDT sample size
#' @param c Maximum allowable failures
#' @param pi Failure probability
#' @return The result is a vector with two values. The first value is the expected failure probability in warranty period.
#' The second value is the expected warranty services cost.
#' @examples
#' pi <- pi_MCSim_beta(M = 5000, seed = 10, a = 1, b = 1)
#' result <- bcost_WS(Cw = 10, N = 1, n = 10, c = 1, pi = pi);
#' print(result[1]) #expected failure probability
#' print(result[2]) #expected warranty services cost
#' @seealso \code{\link{bcost_RDT}}, \code{\link{bcost_RG}}, \code{\link{bcost_expected}}
#' @export
#' @importFrom stats pbinom

bcost_WS <- function(Cw, N, n, c, pi){
  expected <- sum(pbinom(c, n, pi) * pi) / sum(pbinom(c, n, pi))
  return(c(expected, Cw * N * expected))
}
