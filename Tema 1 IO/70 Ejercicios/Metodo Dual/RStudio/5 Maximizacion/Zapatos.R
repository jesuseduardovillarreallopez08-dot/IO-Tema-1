objetivo <- c(40, 25)
restricciones <- matrix(c(2, 1,
                          1, 1),
                        nrow = 2, byrow = TRUE)
direcciones <- c("<=", "<=")
rhs <- c(100, 80)

sol <- lp("max", objetivo, restricciones, direcciones, rhs)

cat("Ganancia máxima =", sol$objval, "\n")
cat("Zapatos Cuero (x1) y Tela (x2):", sol$solution, "\n")
