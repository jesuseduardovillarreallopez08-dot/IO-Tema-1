library(lpSolve)

f.obj <- c(7, 3)

f.con <- matrix(c(1, 0,
                  0, 1,
                  1, 1),
                nrow = 3, byrow = TRUE)

f.dir <- c(">=", ">=", ">=")
f.rhs <- c(4, 10, 18)

res <- lp("min", f.obj, f.con, f.dir, f.rhs)
res$solution
res$objval
