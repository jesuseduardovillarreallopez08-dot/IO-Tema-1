# Instalar y cargar el paquete lpSolve
install.packages("lpSolve")
library(lpSolve)

# Coeficientes de la función objetivo
f.obj <- c(40, 50)

# Matriz de restricciones
f.con <- matrix(c(2, 3,
                  1, 1), 
                nrow = 2, byrow = TRUE)

# Lado derecho de las restricciones
f.dir <- c("<=", "<=")
f.rhs <- c(120, 40)

# Resolver el problema de maximización
sol <- lp("max", f.obj, f.con, f.dir, f.rhs)

# Resultados
sol$solution       # Cantidad de sillas y mesas a producir
sol$objval         # Ganancia máxima
