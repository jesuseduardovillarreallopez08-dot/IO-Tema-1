# Instalar paquete si no lo tienes
# install.packages("lpSolve")

library(lpSolve)

# ----- Resolver el problema -----
f.obj <- c(40, 30)
f.con <- matrix(c(2, 1,
                  1, 1),
                nrow = 2, byrow = TRUE)
f.dir <- c("<=", "<=")
f.rhs <- c(40, 20)

sol <- lp("max", f.obj, f.con, f.dir, f.rhs)

# ----- Graficar región factible -----
# Crear una cuadrícula de puntos (A,B)
A <- seq(0, 25, 0.5)
B1 <- 40 - 2*A       # de 2A + B <= 40
B2 <- 20 - 1*A       # de A + B <= 20

# Gráfico
plot(A, B1, type="l", col="blue", lwd=2,
     xlab="Producto A", ylab="Producto B",
     xlim=c(0,25), ylim=c(0,25),
     main="Región factible")
lines(A, B2, col="red", lwd=2)

# Rellenar región factible
polygon(c(0,0,10,20), c(0,20,10,0),
        col=rgb(0.9,0.9,0.9,0.5), border=NA)

# Punto óptimo
points(sol$solution[1], sol$solution[2],
       pch=19, col="darkgreen", cex=1.5)
text(sol$solution[1], sol$solution[2]+1,
     labels=paste0("Óptimo (", sol$solution[1], ", ", sol$solution[2], ")"),
     col="darkgreen")

