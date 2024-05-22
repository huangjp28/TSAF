library(astsa)
library(dynlm)

# 1. 习题2.11
w500 <- rnorm(500) # white noise (n=500)
par(mfrow = c(2,1))
tsplot(w500, main = "White noise (n=500)")
acf1(w500, 20)

w50 <- rnorm(50) # white noise (n=50)
par(mfrow = c(2,1))
tsplot(w50, main = "White noise (n=50)")
acf1(w50, 20)

# 从样本 ACF 无法看出 n 的影响


# 2. 习题2.12
ma500 <- filter(rnorm(500), side = 2, filter = rep(1/3, 3)) # moving average (n=500)
par(mfrow = c(2,1))
tsplot(ma500, main = "Moving average (n=500)")
acf1(ma500, 20)

ma50 <- filter(rnorm(50), side = 2, filter = rep(1/3, 3)) # moving average (n=50)
par(mfrow = c(2,1))
tsplot(ma50, main = "Moving average (n=50)")
acf1(ma50, 20)

# 通过多次重复运行，可以发现 n 较小时，样本 ACF 的估计误差较大


# 3. 习题2.13
ar2 <- filter(rnorm(500), filter=c(1.5,-0.75), method="recursive") # AR2 (n=500)
par(mfrow = c(2,1))
tsplot(ar2, main = "AR2 (n=500)")
acf1(ar2, 50)

# 循环周期大概是 12 期


# 例 3.5 中模型 (3.17) 的估计
temp = tempr - mean(tempr) # center temperature
temp2 = temp^2
tr = time(cmort) # time is tr
fit = lm(cmort ~ tr + temp + temp2 + part, na.action=NULL) 
summary(fit) # regression results
num = length(cmort)  # sample size
AIC(fit)/num - log(2*pi)  # AIC
BIC(fit)/num - log(2*pi)  # BIC

# 4. 习题3.2
fit2 <- dynlm(cmort ~ tr + temp + temp2 + part + L(part, 4), na.action=NULL) 
summary(fit2)
AIC(fit2)/num - log(2*pi)  # AIC
BIC(fit2)/num - log(2*pi)  # BIC

# P_{t-4} 的系数估计值约为 0.103，标准误差为 0.02485，在 0.1% 水平下显著
# AIC 和 BIC 都变小了，说明比原模型 (3.17) 有改善

