library(lpSolve)

f.obj <- c(15, 10)

f.con <- matrix(c(1, 0,
                  0, 1,
                  1, 1),
                nrow = 3, byrow = TRUE)

f.dir <- c(">=", ">=", ">=")
f.rhs <- c(5, 12, 20)

res <- lp("min", f.obj, f.con, f.dir, f.rhs)
res$solution
res$objval
