# Instalar y cargar lpSolve
install.packages("lpSolve")
library(lpSolve)

# Función objetivo (ganancia por lápiz y bolígrafo)
f.obj <- c(2, 3)

# Matriz de restricciones
f.con <- matrix(c(1, 2,
                  1, 1), 
                nrow = 2, byrow = TRUE)

# Tipos de restricción
f.dir <- c("<=", "<=")

# Lado derecho (recursos disponibles)
f.rhs <- c(100, 80)

# Resolver problema de maximización
sol <- lp("max", f.obj, f.con, f.dir, f.rhs)

# Resultados
cat("Cantidad de lápices y bolígrafos a producir:\n")
print(sol$solution)
cat("Ganancia máxima:\n")
print(sol$objval)
