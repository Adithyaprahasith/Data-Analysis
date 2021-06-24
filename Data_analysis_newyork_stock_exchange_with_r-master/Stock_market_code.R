##data extraction
df<-read.csv("AAL_data.csv")
df
##basic operations 
sum(df$open)
mean(df$open)
median(df$open)
sd(df$open)

sum(df$high)
mean(df$high)
median(df$high)
sd(df$high)

sum(df$low)
mean(df$low)
median(df$low)
sd(df$low)

sum(df$close)
mean(df$close)
median(df$close)
sd(df$close)

sum(df$volume)
mean(df$volume)
median(df$volume)
sd(df$volume)

##Sorting the elements of all the columns of the dataframe 
attach(df)
df[order(open),]
df[order(open,decreasing=TRUE),]
df[order(open,high),]

df[order(high),]
df[order(high,decreasing=TRUE),]
df[order(high,close),]

df[order(low),]
df[order(low,decreasing=TRUE),]
df[order(low,close),]

df[order(close),]
df[order(close,decreasing=TRUE),]
df[order(close,volume),]

df[order(volume),]
df[order(volume,decreasing=TRUE),]
df[order(volume,open),]

##finding the duplicate elements of all the columns and deleting them 
unique(open)
duplicated(open)
df[duplicated(open),]
df[!duplicated(open),]
is.na(open)
which(is.na(open))
sum(is.na(open))

unique(high)
duplicated(high)
df[duplicated(high),]
df[!duplicated(high),]
is.na(high)
which(is.na(high))
sum(is.na(high))

unique(low)
duplicated(low)
df[duplicated(low),]
df[!duplicated(low),]
is.na(low)
which(is.na(low))
sum(is.na(low))

unique(close)
duplicated(close)
df[duplicated(close),]
df[!duplicated(close),]
is.na(close)
which(is.na(close))
sum(is.na(close))

unique(volume)
duplicated(volume)
df[duplicated(volume),]
df[!duplicated(volume),]
is.na(volume)
which(is.na(volume))
sum(is.na(volume))

## Data Recoding
df3<-df
df3
df3$low[df3$low<14]<-NA
df3
is.na(df3$low)
which(is.na(df3$low))
sum(is.na(df3$low))

## Data Manipulation with dplyr package

install.packages("dplyr")
library("dplyr")
data<-read.csv("AAL_data.csv")
dim(data)
sample_n(data,10)
sample_frac(data,0.5)
x1=distinct(data)
x1
x2=distinct(data,3,.keep_all=TRUE)
x2
d1=select(df,volume)
d1
d2=rename(df,NEW=Name)
d2
d3=arrange(df,volume)
d3
d4=filter(df,grepl("AA",Name))
d4
d5=mutate(df,new_var=Name)
d5
dat1=filter(data,grepl("2013",date))
dat1
data1=dat1[1:10,]
data1
dat2=filter(data,grepl("2014",date))
dat2
data2=dat2[1:10,]
data2
dat3=filter(data,grepl("2015",date))
dat3
data3=dat3[1:10,]
data3
dat4=filter(data,grepl("2016",date))
dat4
data4=dat4[1:10,]
data4
dat5=filter(data,grepl("2017",date))
dat5
data8=dat5[1:10,]
data8
dat5=filter(data,grepl("2018",date))
dat5
data6=dat5[1:10,]
data6
x=data6$high
x
x9=data6$volume
x9
y=data6$low
x1=data5$high
x1
x7=data5$volume
x7
x2=data4$high
x3=data3$high
x4=data2$high
x5=data$high

barplot(names.arg=x,y,main="high vs low 2018",xlab="high",ylab="low",col="blue",border="red")

#piechart
pie(x, main = "Comparison of high 2018",col =rainbow(length(x)))
legend("topright",c("2018-01-17","2018-01-16","2018-01-15","2018-01-13","2018-01-11","2018-01-10","2018-01-08","2018-01-06","2018-01-03","2018-01-01"), cex = 0.8,fill = rainbow(length(x)))

pie(x9, main = "Comparison of volume 2018",col =rainbow(length(x9)))
legend("topright",c("2018-01-17","2018-01-16","2018-01-15","2018-01-13","2018-01-11","2018-01-10","2018-01-08","2018-01-06","2018-01-03","2018-01-01"), cex = 0.8,fill = rainbow(length(x9)))


x6=data8$volume
x6

x8=data8$high
x8
pie(x8, main = "Comparison of high 2017",col =rainbow(length(x8)))
legend("topright",c("2017-01-17","2017-01-13","2017-01-12","2017-01-11","2017-01-10","2017-01-09","2017-01-06","2017-01-05","2017-01-04","2017-01-03"), cex = 0.8,fill = rainbow(length(x8)))


pie(x6, main = "Comparison of volume 2017",col =rainbow(length(x6)))
legend("topright",c("2017-01-17","2017-01-13","2017-01-12","2017-01-11","2017-01-10","2017-01-09","2017-01-06","2017-01-05","2017-01-04","2017-01-03"), cex = 0.8,fill = rainbow(length(x6)))
plot(data8$high,xlab="Years",ylab="High Sales")
plot(data8$low,xlab="Years",ylab="Low Sales")
x<-c("2017-01-17","2017-01-13","2017-01-12","2017-01-11","2017-01-10","2017-01-09","2017-01-06","2017-01-05","2017-01-04","2017-01-03")
barplot(data8$high, names.arg = x,main = "Stock Market Sales",xlab = "Years",ylab = "High",col = "blue",border = "red")
boxplot(data8$low, names.arg = x,main = "Stock Market Sales",xlab = "Years",ylab = "Low",col = "blue")
boxplot(data8$high, names.arg = x,main = "Stock Market Sales",xlab = "Years",ylab = "High",col = "blue")
