library(lpSolve)

# Función objetivo (costo por insumo X y Y)
f.obj <- c(12, 20)

# Matriz de restricciones
f.con <- matrix(c(-1, -1,  # x1 + x2 >= 50 → -x1 - x2 <= -50
                  1, 0,    # x1 <= 30
                  0, 1),   # x2 <= 25
                nrow = 3, byrow = TRUE)

# Tipos de restricción
f.dir <- c("<=", "<=", "<=")

# Lado derecho de las restricciones
f.rhs <- c(-50, 30, 25)

# Resolver problema de minimización
sol <- lp("min", f.obj, f.con, f.dir, f.rhs)

# Resultados
cat("Cantidad de insumos X y Y a comprar:\n")
print(sol$solution)
cat("Costo mínimo:\n")
print(sol$objval)
