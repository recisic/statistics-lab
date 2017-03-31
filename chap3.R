
# 3.1

x<-c(1,3,5,7)
y<-c(2,4,6)

z<-x+y

x[1]

x2<-x[2]
x2

x[c(1,3,4)]
x[-2]

seq(from=1, to=10, by=1)
seq(from=1, to=15, length=10)
seq(from=1, by=2, length=10)

3:10
10:3
rep(3,5)
rep(c(1,2,3),2)


# 3.2

a1<-c(1,2,3,4)
a2<-c(5,6,7,8)
a3<-c(9,10,11,12)

mat<-rbind(a1,a2,a3)
mat
mat[1,3]
mat[3,2]
mat[1:3,3]
mat[,3]


# 3.3

x<--2.53
y<-3.45
z<-8

abs(x)
sqrt(z)
round(x, digit=1)
round(y)
log(z)
round(log(z), digit=3)

choose(5,3)
factorial(5)

paste("a", "b", "c")
paste("z=", z, "and log(z)=", round(log(z),digit=2))


# 3.4
x<-7; y<-2

x^y
x%%y
x%/%y

x>y; x<y
(x%%y)==1
(x%/%y)!=3


# 3.5
for (i in 1:3) {x<-i+1; print(x)}
for (j in 5:1) {print(j)}

if (3<5) {print("yes")}
if (3>5) {print("yes")}
if (3>5) {print("yes")} else {print("no")}

for (i in 1:10){
  if (i%%2==0) {print(i)}
}


# 3.6

# Example 1

v<-sample(1:100,40)

# 1-1
m_1<-matrix(v,5,8)

# 1-2
m_2<-m_1[2:3,]

# 1-3
m_3<-m_1[,c(1,4,7,8)]

# 1-4
m_4_avg = mean(m_1[,7])
m_4_var = var(m_1[,7])


# Example 2

n<-sample(1:20,1)
if (n>=10) {print("P")} else {print("NP")}


# Example 3

v_n<-sample(1:20,8)
for (i in v_n){
  if (i>=10) {print("P")} else {print("NP")}
}
