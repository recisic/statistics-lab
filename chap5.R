# 5.4
ames<-read.csv("ames.csv", header=T)
ppl<-ames$Gr.Liv.Area

# ex1
mu<-mean(ppl)
var<-var(ppl)

# ex2
n<-60
s<-sample(ppl, n)
est_mean<-mean(s)

# ex3
alpha<-0.05
sigma<-sqrt(var(ppl))
upper<-est_mean-qnorm(alpha/2)*(sigma/sqrt(n))
lower<-est_mean+qnorm(alpha/2)*(sigma/sqrt(n))
if ((lower<mu)&(mu<upper)) print("includes")
  
# ex4

for (i in 1:50){
  s<-sample(ppl, n)
  upper[i]<-mean(s)+qnorm(alpha/2)*(sigma/sqrt(n))
  lower[i]<-mean(s)-qnorm(alpha/2)*(sigma/sqrt(n))
}

pop.mean<-mu
  
plot_ci <- function(lo, hi, m) {
  par(mar=c(2, 1, 1, 1), mgp=c(2.7, 0.7, 0))
  k <- length(lo)
  ci.max <- max(rowSums(matrix(c(-1 * lo, hi), ncol=2)))
  xR <- m + ci.max * c(-1, 1)
  yR <- c(0, 41 * k / 40)
  plot(xR, yR, type='n', xlab='', ylab='', axes=FALSE)
  abline(v=m, lty=2, col='#00000088')
  axis(1, at=m, paste("mu = ", round(m, 4)), cex.axis=1.15)
  
  for(i in 1:k) {
    x <- mean(c(hi[i], lo[i]))
    ci <- c(lo[i], hi[i])
    if (lo[i]>m | m>hi[i]) {
      col <- "#F05133"
      points(x, i, cex=1.4, col=col)
      lines(ci, rep(i, 2), col=col, lwd=5)
    }
    col <- 1
    points(x, i, pch=20, cex=1.2, col=col)
    lines(ci, rep(i, 2), col=col)
  }
}

plot_ci(lower, upper, pop.mean)

# 50개 중 2개가 포함되지 않으므로 96%가 포함된다.
# 이는 95%와 비교적 유사한 값이다.
