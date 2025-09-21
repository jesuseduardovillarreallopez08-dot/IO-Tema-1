objetivo <- c(8, 5)
restricciones <- matrix(c(2, 1,
                          1, 3), nrow=2, byrow=TRUE)
direcciones <- c(">=", ">=")
rhs <- c(6, 9)

sol <- lp("min", objetivo, restricciones, direcciones, rhs)
cat("Ejercicio 3 - Z:", sol$objval, " x:", sol$solution, "\n")
