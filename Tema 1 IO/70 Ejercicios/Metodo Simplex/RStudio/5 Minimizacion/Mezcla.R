library(lpSolve)

# Función objetivo (costo por material A y B)
f.obj <- c(5, 8)

# Matriz de restricciones
f.con <- matrix(c(-1, -1,  # x1 + x2 >= 40 → -x1 - x2 <= -40
                  1, 0,    # x1 <= 30
                  0, 1),   # x2 <= 20
                nrow = 3, byrow = TRUE)

# Tipos de restricción
f.dir <- c("<=", "<=", "<=")

# Lado derecho de las restricciones
f.rhs <- c(-40, 30, 20)

# Resolver problema de minimización
sol <- lp("min", f.obj, f.con, f.dir, f.rhs)

# Resultados
cat("Cantidad de materiales A y B a usar:\n")
print(sol$solution)
cat("Costo mínimo:\n")
print(sol$objval)
