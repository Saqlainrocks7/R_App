mvrnormR <- function(n, p, rho) {

  # covariance between Z_i and Z_j being rho^|i-j|
  times <- 1:p # used for creating covariance matrix
  H <- abs(outer(times, times, "-"))
  sigma <- rho^H

  mu <- rep(0, p)
  ncols <- ncol(sigma)
  mu <- rep(mu, each = n) ## not obliged to use a matrix (recycling)
  mu + matrix(stats::rnorm(n * ncols), ncol = ncols) %*% chol(sigma)
}
