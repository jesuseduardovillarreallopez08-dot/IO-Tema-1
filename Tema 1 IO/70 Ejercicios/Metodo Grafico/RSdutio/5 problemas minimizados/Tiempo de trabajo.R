# Instalar si no tienes estas librerías
# install.packages("lpSolve")
# install.packages("ggplot2")

library(lpSolve)
library(ggplot2)

# Definición del problema
f.obj <- c(4, 6)

f.con <- matrix(c(1, 0,
                  0, 1,
                  1, 1),
                nrow = 3, byrow = TRUE)

f.dir <- c(">=", ">=", ">=")
f.rhs <- c(12, 8, 25)

# Resolver
res <- lp("min", f.obj, f.con, f.dir, f.rhs)

cat("Solución:", res$solution, "\n")
cat("Valor mínimo:", res$objval, "\n")

# Crear datos para restricciones
x <- seq(0, 40, 0.1)
df <- data.frame(
  x = x,
  y_line = 25 - x # frontera x1 + x2 >= 25
)

# Gráfico
ggplot() +
  # Restricciones
  geom_vline(xintercept = 12, color = "red", linetype = "dashed", size = 1) +
  geom_hline(yintercept = 8, color = "green", linetype = "dashed", size = 1) +
  geom_line(data = df, aes(x = x, y = y_line), color = "blue", size = 1) +
  
  # Región factible
  geom_ribbon(data = df, aes(x = x, ymin = pmax(8, 25 - x), ymax = 40),
              fill = "gray", alpha = 0.3) +
  
  # Punto óptimo
  geom_point(aes(x = res$solution[1], y = res$solution[2]),
             color = "red", size = 4) +
  annotate("text", x = res$solution[1] + 1, y = res$solution[2],
           label = paste0("Óptimo (", res$solution[1], ", ", res$solution[2], ")"),
           hjust = 0, color = "red") +
  
  labs(title = "Región factible y solución óptima (Minimización)",
       x = "x1", y = "x2") +
  xlim(0, 40) + ylim(0, 40) +
  theme_minimal()
