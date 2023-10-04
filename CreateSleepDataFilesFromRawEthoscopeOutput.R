rm(list=setdiff(ls(), c("newSleepDataEtho")))

# LD analysis pooled from all runs

run1 <- readRDS("~/Desktop/Yoked_sortedMaxVelocity_10sec.rds")
run2 <- readRDS("~/Desktop/Yoked_sortedMaxVelocity_10sec.rds")
run3 <- readRDS("~/Desktop/Yoked_sortedMaxVelocity_10sec.rds")
run4 <- readRDS("~/Desktop/Yoked_sortedMaxVelocity_10sec.rds")
run5 <- readRDS("~/Desktop/Yoked_sortedMaxVelocity_10sec.rds")

# Sorting flies run-1
focal.run1 <- cbind(
  run1$Eth7[,c(1,(c(1:3)+1))],
  run1$Eth8[,c((c(1:3)+1))],
  run1$Eth14[,c((c(1:4)+1))],
  run1$Eth18[,c((c(1:4)+1))],
  run1$Eth19[,c((c(1:4)+1))],
  run1$Eth20[,c((c(1:4)+1))],
  run1$Eth21[,c((c(1:3)+1))]
)
yoked.run1 <- cbind(
  run1$Eth7[,c(1,(c(4,5,6)+1))],
  run1$Eth8[,c((c(4,5,6)+1))],
  run1$Eth14[,c((c(5,6,7,8)+1))],
  run1$Eth18[,c((c(5,6,7,8)+1))],
  run1$Eth19[,c((c(5,6,7,8)+1))],
  run1$Eth20[,c((c(5,6,7,8)+1))],
  run1$Eth21[,c((c(4,5,6)+1))]
)
mock.run1 <- cbind(
  
)
ctrl.run1 <- cbind(
  run1$Eth3[,c(1,(c(1:7)+1))],
  run1$Eth10[,c((c(1:18)+1))]
)

# Sorting flies run-2
focal.run2 <- cbind(
  run2$Eth7[,c(1,(c(1:2)+1))],
  run2$Eth8[,c((c(1:4)+1))],
  run2$Eth14[,c((c(1:5)+1))],
  run2$Eth19[,c((c(1:4)+1))],
  run2$Eth20[,c((c(1:2)+1))]
)
yoked.run2 <- cbind(
  run2$Eth7[,c(1,(c(3,4)+1))],
  run2$Eth8[,c((c(5,6,7,8)+1))],
  run2$Eth14[,c((c(6,7,8,9,10)+1))],
  run2$Eth19[,c((c(5,6,7,8)+1))],
  run2$Eth20[,c((c(3,4)+1))]
)
mock.run2 <- cbind(
  
)
ctrl.run2 <- cbind(
  run2$Eth3[,c(1,(c(1:7)+1))],
  run2$Eth10[,c((c(1:17)+1))]
)

# Sorting flies run-3
focal.run3 <- cbind(
  run3$Eth7[,c(1,(c(1:5)+1))],
  run3$Eth8[,c((c(1:4)+1))],
  run3$Eth17[,c((c(1:5)+1))],
  run3$Eth18[,c((c(1:4)+1))],
  run3$Eth20[,c((c(1:4)+1))]
)
yoked.run3 <- cbind(
  run3$Eth7[,c(1,(c(6,7,8,9,10)+1))],
  run3$Eth8[,c((c(5,6,7,8)+1))],
  run3$Eth17[,c((c(6,7,8,9,10)+1))],
  run3$Eth18[,c((c(6,8,10,12)+1))],
  run3$Eth20[,c((c(6,8,10,12)+1))]
)
mock.run3 <- cbind(
  run3$Eth18[,c(1,(c(5,7,9,11,13)+1))],
  run3$Eth20[,c((c(5,7,9,11)+1))]
)
ctrl.run3 <- cbind(
  run3$Eth3[,c(1,(c(1:9)+1))]
)

# Sorting flies run-4
focal.run4 <- cbind(
  run4$Eth14[,c(1,(c(1:4)+1))],
  run4$Eth18[,c((c(1:3)+1))],
  run4$Eth20[,c((c(1:5)+1))],
  run4$Eth22[,c((c(1:4)+1))]
)
yoked.run4 <- cbind(
  run4$Eth14[,c(1,(c(6,8,10,12)+1))],
  run4$Eth18[,c((c(4,5,6)+1))],
  run4$Eth20[,c((c(7,9,11,13,15)+1))],
  run4$Eth22[,c((c(6,8,10,12)+1))]
)
mock.run4 <- cbind(
  run4$Eth14[,c(1,(c(5,7,9,11,13)+1))],
  run4$Eth20[,c((c(6,8,10,12,14)+1))],
  run4$Eth22[,c((c(5,7,9,11,13)+1))]
)
ctrl.run4 <- cbind(
  
)

# Sorting flies run-5
focal.run5 <- cbind(
  run5$Eth14[,c(1,(c(1:5)+1))],
  run5$Eth15[,c((c(1:2)+1))],
  run5$Eth18[,c((c(1:2)+1))],
  run5$Eth20[,c((c(1:4)+1))],
  run5$Eth22[,c((c(1:5)+1))]
)
yoked.run5 <- cbind(
  run5$Eth14[,c(1,(c(7,9,11,13,15)+1))],
  run5$Eth15[,c((c(6,8)+1))],
  run5$Eth18[,c((c(5,8)+1))],
  run5$Eth20[,c((c(7,9,11,13)+1))],
  run5$Eth22[,c((c(7,9,11,13,15)+1))]
)
mock.run5 <- cbind(
  run5$Eth14[,c(1,(c(6,8,10,12,14)+1))],
  run5$Eth15[,c((c(3,4,5,7,9)+1))],
  run5$Eth18[,c((c(3,4,6,7,9)+1))],
  run5$Eth20[,c((c(5,6,8,10,12)+1))],
  run5$Eth22[,c((c(6,8,10,12,14)+1))]
)
ctrl.run5 <- cbind(
  
)

# compiling all five replicate runs
n.cyc = 6

focal.df <- cbind(
  focal.run1[1:(8640 * n.cyc),],
  focal.run2[1:(8640 * n.cyc),-1],
  focal.run3[1:(8640 * n.cyc),-1],
  focal.run4[1:(8640 * n.cyc),-1],
  focal.run5[1:(8640 * n.cyc),-1]
)
yoked.df <- cbind(
  yoked.run1[1:(8640 * n.cyc),],
  yoked.run2[1:(8640 * n.cyc),-1],
  yoked.run3[1:(8640 * n.cyc),-1],
  yoked.run4[1:(8640 * n.cyc),-1],
  yoked.run5[1:(8640 * n.cyc),-1]
)
mock.df <- cbind(
  mock.run1[1:(8640 * n.cyc),],
  mock.run2[1:(8640 * n.cyc),-1],
  mock.run3[1:(8640 * n.cyc),-1],
  mock.run4[1:(8640 * n.cyc),-1],
  mock.run5[1:(8640 * n.cyc),-1]
)
ctrl.df <- cbind(
  ctrl.run1[1:(8640 * n.cyc),],
  ctrl.run2[1:(8640 * n.cyc),-1],
  ctrl.run3[1:(8640 * n.cyc),-1],
  ctrl.run4[1:(8640 * n.cyc),-1],
  ctrl.run5[1:(8640 * n.cyc),-1]
)



sleep.def <- seq(1, 4, by = 1)
focal.sleep <- list()
mock.sleep <- list()
ctrl.sleep <- list()
yoked.sleep <- list()

for (i in 1:length(sleep.def)) {
  focal.sleep <- newSleepDataEtho(data = focal.df, sleep.def = sleep.def[i], bin = 60, t.cycle = 24)
  mock.sleep <- newSleepDataEtho(data = mock.df, sleep.def = sleep.def[i], bin = 60, t.cycle = 24)
  yoked.sleep <- newSleepDataEtho(data = yoked.df, sleep.def = sleep.def[i], bin = 60, t.cycle = 24)
  ctrl.sleep <- newSleepDataEtho(data = ctrl.df, sleep.def = sleep.def[i], bin = 60, t.cycle = 24)
  
  write.table(focal.sleep,
              paste("~/Desktop/","SleepProfiles_Focal_",sleep.def[i],"min_60minBin.txt", sep = ""), quote = F, row.names = F, sep = "\t")
  write.table(yoked.sleep,
              paste("~/Desktop/","SleepProfiles_Yoked_",sleep.def[i],"min_60minBin.txt", sep = ""), quote = F, row.names = F, sep = "\t")
  write.table(mock.sleep,
              paste("~/Desktop/","SleepProfiles_Mock_",sleep.def[i],"min_60minBin.txt", sep = ""), quote = F, row.names = F, sep = "\t")
  write.table(ctrl.sleep,
              paste("~/Desktop/","SleepProfiles_Control_",sleep.def[i],"min_60minBin.txt", sep = ""), quote = F, row.names = F, sep = "\t")
}


