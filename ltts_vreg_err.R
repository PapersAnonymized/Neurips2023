install.packages("ggplot2")
#install.packages("readtext")
install.packages("psych")
install.packages("reshape2")

#library(readtext)
library(ggplot2)
library(psych)
library(reshape2)

# Set working directory
fpath <- "~/Documents/LTTS"
setwd(fpath)

#Model prefix
#mpref <- "lstm"
#mpref <- "tanh"
#mpref <- "rbf"
#mpref <- "trans"
#mpref <- "gmdh"
#mpref <- "relu"
mpref <- "kgate"
#mpref <- "cnnc"
#mpref <- "cnn"
#mpref <- "ann"
#mpref <- "sig"

#
fname1 <- paste("wsg_cl_mape_dj0704_dj_1_3_05-1_28_22.csv.", mpref,".00.txt", sep='')

in_test1 <- read.delim(fname1, sep = "", header = T, na.strings = " ", fill = T)
mr <- nrow(in_test1)
t21 <- in_test1[,2:3]


fname2 <- paste("wsg_cl_mape_dj0704_dj_1_3_05-1_28_22.csv.", mpref,"V.txt", sep='')

in_test2 <- read.delim(fname2, sep = "", header = T, na.strings = " ", fill = T)
mr2 <- nrow(in_test2)
t22 <- in_test2[,2:3]

#reg
mean(t21$MeanPE)
sd(t21$MeanPE)

#vReg
mean(t22$MeanPE)
sd(t22$MeanPE)

wilcox.test(t21$MeanPE, t22$MeanPE, paired = TRUE, alternative = "two.sided")


#reg
mean(t21$MaxPE)
sd(t21$MaxPE)

#vReg
mean(t22$MaxPE)
sd(t22$MaxPE)

wilcox.test(t21$MaxPE, t22$MaxPE, paired = TRUE, alternative = "two.sided")



