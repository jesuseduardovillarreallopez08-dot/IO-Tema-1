library(lpSolve)

f.obj <- c(5, 8)

f.con <- matrix(c(1, 0,  # A >= 10
                  0, 1,  # B >= 6
                  1, 1), # A + B >= 20
                nrow = 3, byrow = TRUE)

f.dir <- c(">=", ">=", ">=")
f.rhs <- c(10, 6, 20)

res <- lp("min", f.obj, f.con, f.dir, f.rhs)
res$solution
res$objval
