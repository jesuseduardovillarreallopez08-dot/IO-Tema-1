# Instalar lpSolve si no está instalado
# install.packages("lpSolve")

library(lpSolve)

# -----------------------------
# PROBLEMA PRIMAL (Minimización)
# -----------------------------

# Coeficientes de la función objetivo
objetivo <- c(4, 6)

# Restricciones
restricciones <- matrix(c(3, 1,
                          1, 2), 
                        nrow = 2, byrow = TRUE)

# Direcciones de las restricciones
direcciones <- c(">=", ">=")

# Lado derecho de las restricciones
rhs <- c(8, 6)

# Resolver el problema
sol_primal <- lp("min", objetivo, restricciones, direcciones, rhs)

# Mostrar resultados
cat("Valor óptimo Z =", sol_primal$objval, "\n")
cat("Valores de x1 y x2:", sol_primal$solution, "\n")


# -----------------------------
# PROBLEMA DUAL (Maximización)
# -----------------------------

# Coeficientes de la función objetivo dual
objetivo_dual <- c(8, 6)

# Restricciones del dual
restricciones_dual <- matrix(c(3, 1,
                               1, 2), 
                             nrow = 2, byrow = FALSE)

# Direcciones
direcciones_dual <- c("<=", "<=")

# Lado derecho
rhs_dual <- c(4, 6)

# Resolver dual
sol_dual <- lp("max", objetivo_dual, restricciones_dual, direcciones_dual, rhs_dual)

# Mostrar resultados
cat("Valor óptimo W =", sol_dual$objval, "\n")
cat("Valores de y1 y y2:", sol_dual$solution, "\n")
