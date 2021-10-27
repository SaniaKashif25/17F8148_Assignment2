# Lapply returns a list
x <- list(a = 1:7, b = rnorm(10))
lapply(x, mean)

x <- list(a = 1:5, b = rnorm(10))
lapply(x, mean)

x <- list(a = 1:4, b = rnorm(10), c = rnorm(20, 1), d = rnorm(100, 5))
lapply(x, mean)

x <- 1:4
lapply(x, runif)

x <- 1:4
lapply(x, runif, min = 0, max = 10)

x <- list(a = matrix(1:4, 2, 2), b = matrix(1:6, 3, 2)) 
x

lapply(x, function(elt) elt[,1])

#sapply

x <- list(a = 1:4, b = rnorm(10), c = rnorm(20, 1), d = rnorm(100, 5))
lapply(x, mean)

sapply(x, mean) 

#tapply

x <- c(rnorm(10), runif(10), rnorm(10, 1))
f <- gl(3, 10)
f
tapply(x, f, mean)
tapply(x, f, mean, simplify = FALSE)

tapply(x, f, range)

#repeat Next Break

x0 <- 1
tol <- 1e-8
repeat {
  x1 <- computeEstimate()
  if(abs(x1 - x0) < tol) {
    break
  } else {
    x0 <- x1
  } 
}

for(i in 1:100) {
  if(i <= 20) {
    ## Skip the first 20 iterations
    next
  }
  ## Do something here
}

#While

count <- 0
while(count < 10) {
  print(count)
  count <- count + 1
}


z <- 5
while(z >= 3 && z <= 10) {
  print(z)
  coin <- rbinom(1, 1, 0.5)
  if(coin == 1) { ## random walk
    z <- z + 1
  } else {
    z <- z - 1
  } 
}

#FOR

for(i in 1:10) {
  print(i)
}

x <- c("a", "b", "c", "d")
for(i in 1:4) {
  print(x[i])
}
for(i in seq_along(x)) {
  print(x[i])
}
for(letter in x) {
  print(letter)
}
for(i in 1:4) print(x[i])

x <- matrix(1:6, 2, 3)
for(i in seq_len(nrow(x))) {
  for(j in seq_len(ncol(x))) {
    print(x[i, j])
  } 
}

#IF

if(x > 3) {
  y <- 10
} else {
  y <- 0
}

y <- if(x > 3) {
  10
} else { 
  0
}

x <- 1:4; y <- 6:9
x + y
x > 2
x >= 2
x == 8
x * y
x / y
x <- matrix(1:4, 2, 2); y <- matrix(rep(10, 4), 2, 2)
x * y
x / y
x %*% y

#Removing Missing values

x <- c(1, 2, NA, 4, NA, 5)
bad <- is.na(x)
x[!bad]

#Vectorized

x <- c(1, 2, NA, 4, NA, 5)
y <- c("a", "b", NA, "d", NA, "f")
good <- complete.cases(x, y)
good
x[good]
y[good]

airquality[1:6, ]
good <- complete.cases(airquality)
airquality[good, ][1:6, ]


#Subsetting Partial Matching

x <- list(aardvark = 1:5)
x$a
x[["a"]]
x[["a", exact = FALSE]]

#Subsetting a Matrix

x <- matrix(1:6, 2, 3)
x[1, 2]
x[2, 1]

x[1, ]
x[, 2]

x <- matrix(1:6, 2, 3)
x[1, 2]
x[1, 2, drop = FALSE]

x <- matrix(1:6, 2, 3)
x[1, ]
x[1, , drop = FALSE]

#Subsetting Lists


x <- list(foo = 1:4, bar = 0.6)
x[1]
x[[1]]
x$bar
x[["bar"]]
x["bar"]


x <- list(foo = 1:4, bar = 0.6, baz = "hello")
x[c(1, 3)]

x <- list(foo = 1:4, bar = 0.6, baz = "hello")
name <- "foo"
x[[name]] ## computed index for ‘foo’

x$name ## element ‘name’ doesn’t exist!
x$foo

x <- list(a = list(10, 12, 14), b = c(3.14, 2.81))
x[[c(1, 3)]]
x[[1]][[3]]
x[[c(2, 1)]]

#Subsetting

x <- c("a", "b", "c", "c", "d", "a")
x[1]
x[2]
x[1:4]
x[x > "a"]
u <- x > "a"
u
x[u]

#Interfaces

#str(file)

#function (description = "", open = "", blocking = TRUE, encoding = getOption("encoding"))
#con <- file("foo.txt", "r")
#data <- read.csv(con)
#close(con) 

#data <- read.csv("foo.txt")

#con <- gzfile("words.gz") 
#x <- readLines(con, 10) 
#x

#This might take time
#con <- url("http://www.jhsph.edu", "r")
#x <- readLines(con)
#head(x)

#Textual

y <- data.frame(a = 1, b = "a")
dput(y)
structure(list(a = 1,
               b = structure(1L, .Label = "a",
                             class = "factor")),
          .Names = c("a", "b"), row.names = c(NA, -1L),
          class = "data.frame")
dput(y, file = "y.R")
new.y <- dget("y.R")
new.y

x <- "foo"
y <- data.frame(a = 1, b = "a")
dump(c("x", "y"), file = "data.R") 
rm(x, y)
source("data.R")
y
x

#Large Tables

#initial <- read.table("datatable.txt", nrows = 100)
#classes <- sapply(initial, class)
#tabAll <- read.table("datatable.txt", colClasses = classes)

#Reading Tables
#data <- read.table("foo.txt")

#Names

x <- 1:3
names(x)
names(x) <- c("foo", "bar", "norf") 
x
names(x)
x <- list(a = 1, b = 2, c = 3) 
x
m <- matrix(1:4, nrow = 2, ncol = 2)
dimnames(m) <- list(c("a", "b"), c("c", "d")) 
m

#Data Frames

x <- data.frame(foo = 1:4, bar = c(T, T, F, F)) 
x
nrow(x)
ncol(x)

#Missing values

x <- c(1, 2, NA, 10, 3)
is.na(x)
is.nan(x)
x <- c(1, 2, NaN, NA, 4)
is.na(x)
is.nan(x)


#Factors

x <- factor(c("yes", "yes", "no", "yes", "no")) 
x
table(x) 
x

unclass(x)
x <- factor(c("yes", "yes", "no", "yes", "no"), levels = c("yes", "no"))
x

#Matrices

m <- matrix(nrow = 2, ncol = 3) 
m
dim(m)
attributes(m)
m <- matrix(1:6, nrow = 2, ncol = 3) 
m
m <- 1:10
m
dim(m) <- c(2, 5)
m
x <- 1:3
y <- 10:12
cbind(x, y)
rbind(x, y) 

#Vectors and Lists

x <- c(0.5, 0.6) ## numeric
x <- c(TRUE, FALSE) ## logical
x <- c(T, F) ## logical
x <- c("a", "b", "c") ## character
x <- 9:29 ## integer
x <- c(1+0i, 2+4i) ## complex


x <- vector("numeric", length = 10) 
x

y <- c(1.7, "a") ## character
y <- c(TRUE, 2) ## numeric
y <- c("a", TRUE) ## character

x <- 0:6
class(x)
as.numeric(x)
as.logical(x)
as.character(x)

x <- c("a", "b", "c")
as.numeric(x)
as.logical(x)
as.complex(x)


m <- matrix(nrow = 2, ncol = 3) 
m

dim(m)
attributes(m)

m <- matrix(1:6, nrow = 2, ncol = 3) 
m

m <- 1:10
m
dim(m) <- c(2, 5)
m


x <- 1:3
y <- 10:12
cbind(x, y)
rbind(x, y)

x <- list(1, "a", TRUE, 1 + 4i) 
x

#Input Evaluations

x <- 1
print(x)
x
msg <- "hello"

x <- 5 ## nothing printed
x ## auto-printing occurs
print(x)   

x <- 1:20
x


#Help

library(datasets) 
data(airquality) 
cor(airquality)

