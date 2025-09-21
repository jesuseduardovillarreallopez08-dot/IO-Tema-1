objetivo <- c(40, 30)
restricciones <- matrix(c(2, 1), nrow = 1, byrow = TRUE)
direcciones <- c("<=")
rhs <- c(60)

sol <- lp("max", objetivo, restricciones, direcciones, rhs)

cat("Ganancia máxima =", sol$objval, "\n")
cat("Pasteles Chocolate (x1) y Vainilla (x2):", sol$solution, "\n")
