#' @title Cost Function for Binomial RDT
#'
#' @description Define the cost function of RDT, mainly determined by the test sample size (for binomial RDT)
#'
#' @param Cf Fixed costs
#' @param Cv Variable costs.
#' @param n Optimal test sample size
#' @return Binomial RDT cost
#' @examples
#' bcost_RDT(Cf = 0, Cv = 10, n = 10);
#' @seealso \code{\link{bcost_RG}}, \code{\link{bcost_WS}}, \code{\link{bcost_expected}}
#' @export

bcost_RDT <- function(Cf, Cv, n){
  return(Cf + Cv * n)
}
