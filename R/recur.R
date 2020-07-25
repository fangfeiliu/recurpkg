## funciton for vector
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


#function for dataset and graph
recur_dataset <- function(x) {
  position_value = c(seq(1:nrow(x)))
  seq_number = c(seq(1:nrow(x)))
  for (i in 1:nrow(x)) {
    if(length(x[i,]) != 4) return("Incorrect column number in the dataset")
    vec_value <- as.numeric(x[i,][1:3])
    position_value[i]<- as.numeric(x[i,][4])
    seq_number[i] <- recur_vec(vec_value,position_value[i])
  }
  graph_dt = tibble(position_value,seq_number)

  ggplot(graph_dt, aes(x=position_value,y = seq_number)) +
    geom_line()+
    ggtitle(paste("My Sequences: c(",paste(as.character(seq_number),collapse=", "),")",collapse ="")) +
    xlab("n")+
    ylab("output") -> q
  return(q)
}
