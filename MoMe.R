data = read.csv("dataset_modmed.csv")
#查看数据结构#
str(data)
#查看数据的集中趋势和离散趋势#
library("psych")
describe(data)
#把中心化后的数据加入原数据集#
data$cen.x <- scale(data$x, center = TRUE, scale = FALSE)[,]
data$cen.m <- scale(data$m, center = TRUE, scale = FALSE)[,]
data$cen.w <- scale(data$w, center = TRUE, scale = FALSE)[,]
data$cen.y <- scale(data$y, center = TRUE, scale = FALSE)[,]
自变量 = data$cen.x
中介变量 = data$cen.m
调节变量 = data$cen.w
因变量 = data$cen.y
model1 = lm(中介变量 ~ 自变量+调节变量+自变量:调节变量)
summary(model1)
model2 = lm(因变量~自变量 + 调节变量 + 中介变量 + 自变量:调节变量 + 中介变量:调节变量)
summary(model2)
library(rockchalk)
plotSlopes(model2, plotx = 自变量, modx = 调节变量, xlab = 
             "横轴标签", ylab = "纵轴标签",modxVals="std.dev",interval = "confidence", 
           lty = c(1, 2,3),legendArgs = list(x = "topright", title = "调节效应图"),plotPoints 
           = FALSE) 
