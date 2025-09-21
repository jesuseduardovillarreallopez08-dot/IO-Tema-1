objetivo <- c(200, 300)
restricciones <- matrix(c(1, 1,
                          1, 3),
                        nrow = 2, byrow = TRUE)
direcciones <- c("<=", "<=")
rhs <- c(100, 240)

sol <- lp("max", objetivo, restricciones, direcciones, rhs)

cat("Ganancia máxima =", sol$objval, "\n")
cat("Hectáreas Trigo (x1) y Maíz (x2):", sol$solution, "\n")
