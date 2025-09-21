library(lpSolve)

objetivo <- c(5, 7)
restricciones <- matrix(c(2, 3,
                          1, 4), nrow=2, byrow=TRUE)
direcciones <- c(">=", ">=")
rhs <- c(12, 8)

sol <- lp("min", objetivo, restricciones, direcciones, rhs)
cat("Ejercicio 1 - Z:", sol$objval, " x:", sol$solution, "\n")
