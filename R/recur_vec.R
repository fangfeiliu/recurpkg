#' function for vector recursive sequence calculation
#' Recurpackage recur_vec package
#' The input should have one vector and a sequence number indicator n ,
#' The vector should have more than one elements while the sequence number indicator n
#' should be a positive integar (>n)
#' The output is the final nth element of the sequence to calculate defined as following
#'  X_n = X_(n-1) + |X_(n-2) -X(n-3)|/2
#' @param x
#' x should be a vector with more than one elements. However, the function will only take
#' the first three elements of the vector as the initial value as the recursive sequence
#' initial value input
#' @param n
#' n should be a positive integer number
#' @return
#' The output is the final nth element of the sequence to calculate defined as following
#'  X_n = X_(n-1) + |X_(n-2) -X(n-3)|/2
#' @export
#' recur_vec
#' @examples
#' recur_vec(x = c(2, 4, 3), n = 3)
#' recur_vec(x = c(2, 4, 3), n = 4)
#' recur_vec(x = c(2, 4, 3,5), n = 3)

recur_vec <- function(x,n) {
  if(length(x) > 3) x = x[1:3]
  if(as.integer(n) != n) return ("the sequence number indicator must be an integer")
  if(n <= 0) return(" Position numner must be greater than zero")
  if (length(x) < 3 && n >= length(x)) return ("Please provide a valid vector (length > 3)")
  else if(length(x) <= 3 && n <= length(x)) return (x[n])
  d = c(seq(1:n))
  d[1] = x[1]
  d[2] = x[2]
  d[3] = x[3]
  for (i in 4:n) {
    d[i] = d[i-1]+abs(d[i-2]-d[i-3])/2
  }
  return(d[n])}
