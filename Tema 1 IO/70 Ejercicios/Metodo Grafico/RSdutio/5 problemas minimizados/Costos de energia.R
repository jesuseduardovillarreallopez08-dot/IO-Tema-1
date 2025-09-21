# Instalar librerías si no las tienes
# install.packages("lpSolve")
# install.packages("ggplot2")

library(lpSolve)
library(ggplot2)

# Definición del problema
f.obj <- c(30, 20)

f.con <- matrix(c(1, 0,
                  0, 1,
                  1, 1),
                nrow = 3, byrow = TRUE)

f.dir <- c(">=", ">=", ">=")
f.rhs <- c(8, 10, 25)

# Resolver
res <- lp("min", f.obj, f.con, f.dir, f.rhs)

cat("Solución:", res$solution, "\n")
cat("Valor mínimo:", res$objval, "\n")

# Crear datos para graficar restricciones
x <- seq(0, 30, 0.1)

# Restricciones: x1 >= 8, x2 >= 10, x1 + x2 >= 25
df <- data.frame(
  x = x,
  y1 = 10,            # x2 >= 10
  y2 = 25 - x         # x1 + x2 >= 25
)

# Graficar
ggplot() +
  # Restricciones
  geom_vline(xintercept = 8, color = "red", linetype = "dashed", size = 1) +
  geom_hline(yintercept = 10, color = "green", linetype = "dashed", size = 1) +
  geom_line(data = df, aes(x = x, y = y2), color = "blue", size = 1) +
  
  # Región factible sombreada
  geom_ribbon(data = df, aes(x = x, ymin = pmax(10, 25 - x), ymax = 30),
              fill = "gray", alpha = 0.3) +
  
  # Punto óptimo
  geom_point(aes(x = res$solution[1], y = res$solution[2]),
             color = "red", size = 4) +
  annotate("text", x = res$solution[1] + 1, y = res$solution[2],
           label = paste0("Óptimo (", res$solution[1], ", ", res$solution[2], ")"),
           hjust = 0, color = "red") +
  
  labs(title = "Región factible y solución óptima (Minimización)",
       x = "x1", y = "x2") +
  xlim(0, 30) + ylim(0, 30) +
  theme_minimal()
