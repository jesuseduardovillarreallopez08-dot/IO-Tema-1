library(lpSolve)

# Función objetivo (ganancia por galleta y pastel)
f.obj <- c(1, 5)

# Matriz de restricciones
f.con <- matrix(c(1, 5,
                  2, 4), 
                nrow = 2, byrow = TRUE)

# Tipos de restricción
f.dir <- c("<=", "<=")

# Lado derecho (recursos disponibles)
f.rhs <- c(200, 150)

# Resolver problema de maximización
sol <- lp("max", f.obj, f.con, f.dir, f.rhs)

# Resultados
cat("Cantidad de galletas y pasteles a producir:\n")
print(sol$solution)
cat("Ganancia máxima:\n")
print(sol$objval)
