library(lpSolve)

# Función objetivo (ganancia por camisa y pantalón)
f.obj <- c(30, 50)

# Matriz de restricciones
f.con <- matrix(c(2, 3,
                  1, 1), 
                nrow = 2, byrow = TRUE)

# Tipos de restricción
f.dir <- c("<=", "<=")

# Lado derecho (recursos disponibles)
f.rhs <- c(120, 60)

# Resolver problema de maximización
sol <- lp("max", f.obj, f.con, f.dir, f.rhs)

# Resultados
cat("Cantidad de camisas y pantalones a producir:\n")
print(sol$solution)
cat("Ganancia máxima:\n")
print(sol$objval)

