# Ejercicio 2
library(lpSolve)

f.obj <- c(200, 180)
f.con <- matrix(c(1, 2,
                  2, 1),
                nrow = 2, byrow = TRUE)
f.dir <- c("<=", "<=")
f.rhs <- c(100, 90)

sol <- lp("max", f.obj, f.con, f.dir, f.rhs)
print(sol$solution)
print(sol$objval)

x <- seq(0, 100, 0.5)
r1 <- (100 - x)/2
r2 <- 90 - 2*x

plot(x, r1, type="l", col="blue", lwd=2,
     xlab="Mezcla 1 (x)", ylab="Mezcla 2 (y)",
     ylim=c(0, max(r1,r2, na.rm=T)), xlim=c(0, max(x)),
     main="Ejercicio 2: Región factible")
lines(x, r2, col="red", lwd=2)

polygon(c(0,0,30,45), c(0,50,30,0),
        col=rgb(0.9,0.9,0.9,0.5), border=NA)

points(sol$solution[1], sol$solution[2],
       pch=19, col="darkgreen", cex=1.5)
text(sol$solution[1], sol$solution[2]+2,
     labels=paste0("Óptimo (", sol$solution[1], ",", sol$solution[2], ")"),
     col="darkgreen")
