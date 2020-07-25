recur_vec <- function(x,n) {
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
