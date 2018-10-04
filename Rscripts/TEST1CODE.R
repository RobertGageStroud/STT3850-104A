# todays class

library(readxl)
library(ggplot2)
library(dplyr)

# OTE1 --- Starter Code

# 11
library(ggplot2)
library(dplyr)

set.seed(113)
X <- rnorm(1000, 10, 3) + runif(1000, 7, 13)
DF <- data.frame(x = X)

ggplot(DF,aes(x = x) ) + geom_density()
summarize(DF, mean = mean(DF$x), std_dev = sd(DF$x)) %>% round(4, )

# 12
library(dplyr)
library(resampledata)
glimpse(Verizon)
  group_by(Group) %>% 
TBL <- Verizon %>% 
  summarize(Mean = mean(Time), n())
TBL
obs_diff <- TBL$Mean[1] - TBL$Mean[2]
obs_diff
Times <- Verizon$Time
set.seed(413)
sims <- 10^4 - 1
ans <- numeric(sims)
for(i in 1:sims){
  index <- sample(1664 + 23, Times)
  ans[i] <- mean(Times[index]) - mean(Times[-index])
}
pvalue <- (sum(ans * obs_diff) + 1)/(sims + 1)
pvalue
