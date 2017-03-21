# 2.1
# 2.1.1

#gender<-c("M","M","M","M","M","M","M","M",
#          "F","F","F","F","F","F","F","F","F","F")

gender<-factor(c("M","M","M","M","M","M","M","M",
          "F","F","F","F","F","F","F","F","F","F"))

score<-c(98,90,96,54,43,87,88,90,94,92,
         81,79,85,91,79,88,89,83)

gender
score

table(gender)


# 2.1.2

hist(score)

hist(score, freq=F)

hist(score, breaks=10)
hist(score, freq=F, breaks=20)

help(hist)


# 2.1.3

stem(score)

stem(score, scale=1)
stem(score, scale=2)
stem(score, scale=3)

# http://datascience.stackexchange.com/q/8122
# With the default scale, you see that numbers left of the bar go up by two
# - hence anything after the 4 is forty-something or fifty-something:
# Stem plots do not always guarantee you can reproduce the data
# by reversing the process, and that's not what they're for.

# 2.1.4

boxplot(score)


# 2.2
# 2.2.1

table(gender)


# 2.2.2

fivenum(score)
summary(score)

median(score)
mean(score)
sd(score)
round(sd(score), digit=4)
var(score)
quantile(score)
sum(score)
min(score)
max(score)


# 2.3
# 2.3.1

math<-c(66,64,48,46,78,60,90,50,66,70)
phy<-c(70,68,46,48,84,64,92,52,68,72)

plot(math, phy, col=1)
# col argument means 'color'

plot(math, phy, main="Math Score and Physics Score",
     xlim=c(40,100), ylim=c(40,100), xlab="Math", ylab="Physics", type="p", col=6)

plot(math, phy, main="Math Score and Physics Score",
     xlim=c(0,100), ylim=c(0,100), xlab="Math", ylab="Physics", cex=2, col=3)


# 2.3.2

cor(math, phy)
cov(math, phy)


# 2.4

cdc<-read.table("cdc.txt", header=T)

h<-cdc$height
summary(h)


# Examples

# 1
table(cdc$genhlth)

# 2
summary(cdc$weight)
mean(cdc$weight)

# 3
plot(cdc$weight, cdc$wtdesire)
cor(cdc$weight, cdc$wtdesire)

# 4
wdiff = cdc$wtdesire - cdc$weight
summary(wdiff)
boxplot(wdiff)
hist(wdiff, breaks=50)

# 5
hist(cdc$age)
hist(cdc$age, breaks=50)
hist(cdc$age, breaks=100)
