library(xts)

# 导入数据
airdata = read.csv("assets/data/Yantian_air_2022d.csv", na.strings = '--')
head(airdata)

# 确认数据类型
class(airdata)

# 确认/更改列名称
names(airdata)
names(airdata)[4] <- "Time"
names(airdata)
class(airdata$Time)

# 将 Time 的数据类型从 Character 改为 Date 类型
airdata$Time = as.Date(airdata$Time)
class(airdata$Time)

# 将除去 Time 和 ID 的列转为 xts 类型
airdata1 = as.xts(airdata[,c(-4,-8)], order.by = airdata$Time)

# 绘图
plot(airdata1$AQI) # plot AQI
plot(airdata1, legend.loc = 'topleft') # plot 所有变量（太乱看不清）
plot(cbind(airdata1$AQI, airdata1$NO2), legend.loc = 'topleft') # plot AQI 和 NO2（有一定相似性，但较弱）
plot(cbind(airdata1$AQI, airdata1$O3), legend.loc = 'topleft') # plot AQI 和 O3（有很强的相似性）
plot(cbind(airdata1$AQI, airdata1$PM25), legend.loc = 'topleft') # plot AQI 和 PM2.5（有较强的相似性）
plot(cbind(airdata1$AQI, airdata1$PM10), legend.loc = 'topleft') # plot AQI 和 PM10（有较强的相似性）
plot(cbind(airdata1$AQI, airdata1$SO2), legend.loc = 'topleft') # plot AQI 和 SO2（基本没有相似性）
plot(cbind(airdata1$AQI, airdata1$CO), legend.loc = 'topleft') # plot AQI 和 CO（基本没有相似性）

