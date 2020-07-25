#' function for dataset and graph
#' Recurpackage recur_dataset package
#' The input data set should be 4 columns,
#' The first three columns are the values of the three
#' numbers to be input in order to calculate the recursive sequence define by
#'  X_n = X_(n-1) + |X_(n-2) -X(n-3)|/2  and the fourth column
#' is the positive integer n for the sequence to be generated.
#' The output is expected to be a line plot with X axis as n and Y axis as sequence numbers
#' @param x
#' 4 columns wide dataset with the first three columns are the values of the three
#' numbers to be input
#' @return
#' return a line plot with x axis as the sequence length n and Y axis as the sequence number
#' vector output
#' @export
#' recur_dataset
#'
#' @examples
#' my_data <- tibble::tribble(
#' ~x, ~y, ~z, ~n,
#' 2,4,3,3,
#' 2,4,3,5,
#' 2,4,3,7,
#' 2,4,3,10,
#' 2,4,3,15,
#' 2,4,3,20,
#' 2,4,3,25
#' )
#'
#' recur_dataset(my_data)
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
