library(lpSolve)

objetivo <- c(50, 30)
restricciones <- matrix(c(4, 3,
                          2, 1),
                        nrow = 2, byrow = TRUE)
direcciones <- c("<=", "<=")
rhs <- c(40, 18)

sol <- lp("max", objetivo, restricciones, direcciones, rhs)

cat("Ganancia máxima =", sol$objval, "\n")
cat("Mesas (x1) y Sillas (x2):", sol$solution, "\n")
