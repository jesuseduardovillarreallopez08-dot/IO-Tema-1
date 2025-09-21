library(lpSolve)

# Función objetivo (costo por trabajador turno 1 y 2)
f.obj <- c(50, 60)

# Matriz de restricciones
f.con <- matrix(c(-1, -1,  # x1 + x2 >= 70 → -x1 - x2 <= -70
                  1, 0,    # x1 <= 40
                  0, 1),   # x2 <= 35
                nrow = 3, byrow = TRUE)

# Tipos de restricción
f.dir <- c("<=", "<=", "<=")

# Lado derecho de las restricciones
f.rhs <- c(-70, 40, 35)

# Resolver problema de minimización
sol <- lp("min", f.obj, f.con, f.dir, f.rhs)

# Resultados
cat("Cantidad de trabajadores asignados a cada turno:\n")
print(sol$solution)
cat("Costo mínimo:\n")
print(sol$objval)
