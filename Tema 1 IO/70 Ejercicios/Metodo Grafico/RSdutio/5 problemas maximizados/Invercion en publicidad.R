# Ejercicio 3
library(lpSolve)

f.obj <- c(500, 300)
f.con <- matrix(c(1, 1,
                  2, 1,
                  -0.25, 1), # y >= 0.25x -> -0.25x + y >= 0
                nrow = 3, byrow = TRUE)
f.dir <- c("<=", "<=", ">=")
f.rhs <- c(50, 60, 0)

sol <- lp("max", f.obj, f.con, f.dir, f.rhs)
print(sol$solution)
print(sol$objval)

x <- seq(0, 60, 0.5)
r1 <- 50 - x
r2 <- 60 - 2*x
r3 <- 0.25*x

plot(x, r1, type="l", col="blue", lwd=2,
     xlab="TV (x)", ylab="Redes (y)",
     ylim=c(0, max(r1,r2,r3, na.rm=T)), xlim=c(0, max(x)),
     main="Ejercicio 3: Región factible")
lines(x, r2, col="red", lwd=2)
lines(x, r3, col="purple", lwd=2)

# Nota: zona factible aproximada (puedes ajustar los vértices reales)
polygon(c(0,0,20,30), c(0,50,20,0),
        col=rgb(0.9,0.9,0.9,0.5), border=NA)

points(sol$solution[1], sol$solution[2],
       pch=19, col="darkgreen", cex=1.5)
text(sol$solution[1], sol$solution[2]+2,
     labels=paste0("Óptimo (", sol$solution[1], ",", sol$solution[2], ")"),
     col="darkgreen")
