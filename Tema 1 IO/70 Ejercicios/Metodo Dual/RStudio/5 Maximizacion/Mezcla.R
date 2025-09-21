objetivo <- c(3, 2)
restricciones <- matrix(c(2, 1), nrow = 1, byrow = TRUE)
direcciones <- c("<=")
rhs <- c(100)

sol <- lp("max", objetivo, restricciones, direcciones, rhs)

cat("Ganancia máxima =", sol$objval, "\n")
cat("Litros Naranja (x1) y Manzana (x2):", sol$solution, "\n")
