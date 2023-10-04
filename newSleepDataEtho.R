newSleepDataEtho <- function(data, sleep.def = 5, bin = 60, t.cycle = 24) {
  
  pre.raw <- data[,-c(1)]
  raw <- pre.raw[,colSums(is.na(pre.raw)) != nrow(pre.raw)]
  
  raw[,1:length(raw[1,])][raw[,1:length(raw[1,])] < 1] <- -1
  raw[,1:length(raw[1,])][raw[,1:length(raw[1,])] >= 1] <- 1
  raw[,1:length(raw[1,])][raw[,1:length(raw[1,])] == -1] <- 0
  
  for (i in 1:length(raw[1,])) {
    x <- raw[,i]
    y <- rle(x)
    d_y <- as.data.frame(unclass(y))
    d_y$end <- cumsum(d_y$lengths)
    d_y$start <- d_y$end - d_y$lengths + 1
    
    dd_y <- subset(d_y, d_y$values == 0 & d_y$lengths >= (sleep.def * 6))
    
    if(length(dd_y[,1]) == 0) {
      x = 0
    } else {
      for (j in 1:length(dd_y[,1])) {
        x[dd_y[j,"start"]:dd_y[j,"end"]] = -1
      }
    }
    
    x[x > -1] = 0
    x[x == -1] = 1
    raw[,i] <- x
  }
  
  s_per_day <- (60/bin)*t.cycle
  
  binned_full_run.sleep <- (length(raw[,1])/(1440*6))*s_per_day
  sleep <- matrix(NA, nrow = binned_full_run.sleep, ncol = 100)
  index.sleep <- seq(1, length(raw[,1]), by = bin*6)
  
  for (i in 1:length(index.sleep)) {
    for (j in 1:length(raw[1,])) {
      x <- raw[index.sleep[i]:(index.sleep[i]+((bin*6)-1)),j]
      sleep[i,j] <- (sum(x)*10)/60
    }
  }
  
  column.names <- c()
  for (ii in 1:length(sleep[1,])) {
    column.names[ii] <- paste("I",ii, sep = "")
  }
  colnames(sleep) <- column.names
  
  t <- seq((bin/60), t.cycle, by = (bin/60))
  zt <- as.data.frame(rep(t, length(sleep[,1])/(t.cycle*(60/bin))))
  colnames(zt) <- c("ZT")
  
  output <- cbind(zt,sleep)
  return(output)
}