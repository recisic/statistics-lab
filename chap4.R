
# 4.1
# 4.1.1
x<-seq(from=-3, to=3, by=0.1)
fx<-dnorm(x, mean=0, sd=1)
plot(x, fx, type="l", main="Normal Distribution PDF")

# 4.1.2
pnorm(2500, mean=2000, sd=200)
1-pnorm(1800, mean=2000, sd=200)
pnorm(1800, mean=2000, sd=200, lower.tail=F)

# 4.1.3
qnorm(0.98, mean=100, sd=15)
qnorm(0.02, mean=100, sd=15, lower.tail=F)

# 4.2
# 4.2.1
x<-0:6
fx<-dbinom(x, 6, 0.5)
plot(x, fx, main="Binomial Distribution PDF", type="h")

# 4.2.2
dbinom(3, size=5, prob=0.1)
pbinom(5, size=20, prob=0.1)

# 4.2.3
p<-0.1
n<-c(10,30,50)

par(mfrow=c(1,3))
for (i in 1:3){
  x<-seq(from=0, to=n[i], by=1)
  fx<-dbinom(x, n[i], p)
  plot(x, fx, pch=16, xlim=c(-3,15), ylab="probability", xlab="",
             main=paste("Binom Apprx. to Norm(p=",p,",n=",n[i],")"))
  lines(x, fx)
  y<-seq(from=-5, to=15, by=0.1)
  mu<-n[i]*p
  sd<-sqrt(n[i]*p*(1-p))
  fy<-dnorm(y, mu, sd)
  lines(y, fy, col="red")
}

dev.off()

# ex
p<-0.5
n<-c(10,30,50)

par(mfrow=c(1,3))
for (i in 1:3){
  x<-seq(from=0, to=n[i], by=1)
  fx<-dbinom(x, n[i], p)
  plot(x, fx, pch=16, xlim=c(-3,50), ylab="probability", xlab="",
       main=paste("Binom Apprx. to Norm(p=",p,",n=",n[i],")"))
  lines(x, fx)
  y<-seq(from=-5, to=50, by=0.1)
  mu<-n[i]*p
  sd<-sqrt(n[i]*p*(1-p))
  fy<-dnorm(y, mu, sd)
  lines(y, fy, col="red")
}

dev.off()


# 4.3
# ex1
n<-10
x.mean<-c()
for (j in 1:200){
  x<-runif(n, min=0, max=1)
  x.mean[j]<-mean(x)
}
hist(x.mean, xlim=c(0,1), probability=T, main=paste("Sample Average Distribution n=",n))

dev.off()

# ex2
n<-c(10,30,50,100)
par(mfrow=c(2,2))
for (i in 1:4){
  x.mean<-c()
  for (j in 1:1000){
    x<-runif(n[i], 0, 1)
    x.mean[j]<-mean(x)
  }
  hist(x.mean, xlim=c(0,1), probability=T, main=paste("Sample Avg. Dist. n=",n[i]))
  y<-seq(0, 1, 0.01)
  mu<-0.5
  sigma<-sqrt(1/12)
  fy<-dnorm(y, mu, sigma/sqrt(n[i]))
  lines(y, fy)
}

dev.off()

# 4.4
n=1
xsquare.sum=c()
for (i in 1:1000){
  x<-rnorm(n, 0.1)
  xsquare.sum[i]<-sum(x*x)
}
hist(xsquare.sum, probability=T, main=paste("Chi Square Dist. DF=",n))
y<-seq(0, 15, 0.1)
fy<-dchisq(y, n)
lines(y, fy)

dev.off()

# ex
n<-c(1,5,10,30)
par(mfrow=c(2,2))
for (i in 1:4){
  xsquare.sum<-c()
  for (j in 1:1000){
    x<-rnorm(n[i], 0.1)
    xsquare.sum[j]<-sum(x*x)
  }
  hist(xsquare.sum, probability=T, main=paste("Chi Square Dist. DF=",n[i]))
  y<-seq(0, 100, 0.1)
  fy<-dchisq(y, n[i])
  lines(y, fy)
}

dev.off()

# 4.5
# ex1
bodydims<-read.csv("bodydims.csv", header=T)
bodydims.m<-bodydims[bodydims$sex==1,]
bodydims.f<-bodydims[bodydims$sex==0,]

par(mfrow=c(1,2))
hist(bodydims.f$bii.di)
qqnorm(bodydims.f$bii.di)
qqline(bodydims.f$bii.di, col=2)
dev.off()
# �뷫������ ���Ժ����� �����ٰ� �� �� �ִ�.

# ex2
par(mfrow=c(1,2))
hist(bodydims.f$elb.di)
qqnorm(bodydims.f$elb.di)
qqline(bodydims.f$elb.di, col=2)
dev.off()

par(mfrow=c(1,2))
hist(bodydims.f$che.de)
qqnorm(bodydims.f$che.de)
qqline(bodydims.f$che.de, col=2)
dev.off()
# �뷫������ ���Ժ����� �����ٰ� �� �� �ִ�.

# 4.6
ames<-read.csv("ames.csv", header=T)

# ex1
hist(ames$SalePrice)
summary(ames$SalePrice)
# ���Ժ������� �񱳸� ���� ���Ժ��� ������ �������� �׷� ����.
qqnorm(ames$SalePrice)
qqline(ames$SalePrice, col=2)
# ������ ���� �ణ �Ʒ��� ������ ������ �׷����� ��´�.
# ���Ժ����� ��� ���� ���������� ���̰� �ִٰ� �� �� �ִ�.

# ex2
s<-sample(ames$SalePrice, 50)
mean(s) # ������� ����

# ex3
sample_mean50<-c()
for (i in 1:5000){
  sample_mean50[i]<-mean(sample(ames$SalePrice, 50))
}
hist(sample_mean50)
# ���Ժ������� �񱳸� ���� ���Ժ��� ������ �������� �׷� ����.
qqnorm(sample_mean50)
qqline(sample_mean50, col=2)
# ǥ������� ������ ���Ժ����� �뷫������ �����ٰ� �� �� �ִ�.

# ex4
mean(sample_mean50)
# ��հ��� �������� ��հ� ������ ���� ������.
var(sample_mean50)
# ��л꿡 ���� �� 1/50 ������ ���� ������.

# ex5
sample_mean150<-c()
for (i in 1:5000){
  sample_mean150[i]<-mean(sample(ames$SalePrice, 150))
}
hist(sample_mean150)
# ���Ժ������� �񱳸� ���� ���Ժ��� ������ �������� �׷� ����.
qqnorm(sample_mean150)
qqline(sample_mean150, col=2)
# ǥ������� ������ ���Ժ����� �뷫������ �����ٰ� �� �� �ִ�.

mean(sample_mean150)
var(sample_mean150)
# ǥ���� ũ�Ⱑ �����Կ� ���� ����� ��������� ������ �پ��� ���°� ��Ÿ����.