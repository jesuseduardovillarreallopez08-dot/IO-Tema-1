objetivo <- c(6, 4)
restricciones <- matrix(c(1, 2,
                          3, 1), nrow=2, byrow=TRUE)
direcciones <- c(">=", ">=")
rhs <- c(5, 9)

sol <- lp("min", objetivo, restricciones, direcciones, rhs)
cat("Ejercicio 4 - Z:", sol$objval, " x:", sol$solution, "\n")
