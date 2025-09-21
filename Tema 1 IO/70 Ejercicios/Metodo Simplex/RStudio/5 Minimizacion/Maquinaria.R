library(lpSolve)

# Función objetivo (costo por máquina A y B)
f.obj <- c(200, 300)

# Matriz de restricciones
f.con <- matrix(c(-1, -1,  # x1 + x2 >= 50 → -x1 - x2 <= -50
                  2, 3),  # 2x1 + 3x2 <= 120
                nrow = 2, byrow = TRUE)

# Tipos de restricción
f.dir <- c("<=", "<=")

# Lado derecho de las restricciones
f.rhs <- c(-50, 120)

# Resolver problema de minimización
sol <- lp("min", f.obj, f.con, f.dir, f.rhs)

# Resultados
cat("Cantidad de máquinas A y B a producir:\n")
print(sol$solution)
cat("Costo mínimo:\n")
print(sol$objval)
