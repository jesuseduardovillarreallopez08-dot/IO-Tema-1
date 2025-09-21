# Ejercicio 1
library(lpSolve)

# Función objetivo y restricciones
f.obj <- c(120, 45)
f.con <- matrix(c(3, 1,
                  2, 1),
                nrow = 2, byrow = TRUE)
f.dir <- c("<=", "<=")
f.rhs <- c(120, 80)

# Resolver
sol <- lp("max", f.obj, f.con, f.dir, f.rhs)
print(sol$solution)
print(sol$objval)

# Graficar
x <- seq(0, 60, 0.5)
r1 <- 120 - 3*x
r2 <- 80 - 2*x

plot(x, r1, type="l", col="blue", lwd=2,
     xlab="Mesas (x)", ylab="Sillas (y)",
     ylim=c(0, max(r1,r2, na.rm=T)), xlim=c(0, max(x)),
     main="Ejercicio 1: Región factible")
lines(x, r2, col="red", lwd=2)

polygon(c(0,0,20,40), c(0,80,40,0),
        col=rgb(0.9,0.9,0.9,0.5), border=NA)

points(sol$solution[1], sol$solution[2],
       pch=19, col="darkgreen", cex=1.5)
text(sol$solution[1], sol$solution[2]+2,
     labels=paste0("Óptimo (", sol$solution[1], ",", sol$solution[2], ")"),
     col="darkgreen")
