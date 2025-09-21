library(lpSolve)

# Función objetivo (ganancia por producto A y B)
f.obj <- c(20, 30)

# Matriz de restricciones
f.con <- matrix(c(2, 4,
                  3, 2), 
                nrow = 2, byrow = TRUE)

# Tipos de restricción
f.dir <- c("<=", "<=")

# Lado derecho (recursos disponibles)
f.rhs <- c(100, 90)

# Resolver problema de maximización
sol <- lp("max", f.obj, f.con, f.dir, f.rhs)

# Resultados
cat("Cantidad de productos A y B a producir:\n")
print(sol$solution)
cat("Ganancia máxima:\n")
print(sol$objval)
