# Ejercicio extra: Panes (x) y Pasteles (y)
# install.packages("lpSolve")  # ejecutar si no lo tienes
library(lpSolve)

# --- Modelo ---
f.obj <- c(20, 50)
f.con <- matrix(c(2, 4,
                  1, 2),
                nrow = 2, byrow = TRUE)
f.dir <- c("<=", "<=")
f.rhs <- c(200, 90)

sol <- lp("max", f.obj, f.con, f.dir, f.rhs)

cat("Solución óptima (x = panes, y = pasteles):\n")
print(sol$solution)
cat("Ganancia máxima:\n")
print(sol$objval)

# --- Cálculo de vértices para la región factible ---
# Representar las restricciones como a*x + b*y = c
lines <- list(
  list(a=2, b=4, c=200),
  list(a=1, b=2, c=90)
)

# función para intersectar dos rectas a1 x + b1 y = c1  y a2 x + b2 y = c2
intersect_lines <- function(a1,b1,c1, a2,b2,c2){
  mat <- matrix(c(a1, b1, a2, b2), nrow=2, byrow=TRUE)
  vec <- c(c1, c2)
  if (abs(det(mat)) < 1e-9) return(NULL)
  sol <- solve(mat, vec)
  return(c(x = sol[1], y = sol[2]))
}

candidates <- list(c(0,0))  # origen
# Intersecciones línea-ejes y línea-línea
for(L in lines){
  a <- L$a; b <- L$b; c <- L$c
  # con y = 0 -> x = c/a (si a>0)
  if (a != 0) candidates <- append(candidates, list(c(c/a, 0)))
  # con x = 0 -> y = c/b (si b>0)
  if (b != 0) candidates <- append(candidates, list(c(0, c/b)))
}
# intersección entre cada par de líneas
for(i in 1:(length(lines)-1)){
  for(j in (i+1):length(lines)){
    P <- intersect_lines(lines[[i]]$a, lines[[i]]$b, lines[[i]]$c,
                         lines[[j]]$a, lines[[j]]$b, lines[[j]]$c)
    if (!is.null(P)) candidates <- append(candidates, list(P))
  }
}

# Filtrar puntos que cumplen todas las restricciones (<=) y x,y >= 0
feasible <- do.call(rbind, candidates)
# eliminar NA o negativos con tolerancia
tol <- 1e-7
feasible <- feasible[apply(feasible, 1, function(p){
  x <- p[1]; y <- p[2]
  if (is.na(x) || is.na(y)) return(FALSE)
  if (x < -tol || y < -tol) return(FALSE)
  # verificar todas las restricciones
  all( 2*x + 4*y <= 200 + 1e-6,
       1*x + 2*y <= 90  + 1e-6 )
}), , drop=FALSE]

# Remover duplicados y ordenar por envolvente convexa
feasible <- unique(round(feasible, 8))
if (nrow(feasible) < 3) {
  # por seguridad, agregar algunos puntos del eje si faltan
  feasible <- unique(rbind(feasible, c(0,0)))
}
ch <- chull(feasible)
poly_pts <- feasible[c(ch, ch[1]), ]  # cerrar el polígono

# --- Graficar ---
# Líneas (igualdades) para trazar
xmax <- max(poly_pts[,1], sol$solution[1]) + 5
xseq <- seq(0, xmax, length.out = 300)
r1 <- (200 - 2*xseq)/4   # 2x + 4y = 200 -> y = (200 - 2x)/4
r2 <- (90 - 1*xseq)/2    # x + 2y = 90  -> y = (90 - x)/2

plot(0,0, type="n", xlim=c(0, xmax), ylim=c(0, max(r1, r2, na.rm=TRUE)+5),
     xlab="Panes (x)", ylab="Pasteles (y)", main="Región factible y punto óptimo (Panadería)")
lines(xseq, r1, lwd=2, lty=1)
lines(xseq, r2, lwd=2, lty=1)
# sombrear región factible
polygon(poly_pts, col=rgb(0.8,0.9,1,0.5), border=NA)
# dibujar frontera del polígono
lines(poly_pts, lwd=1.5)

# punto óptimo
points(sol$solution[1], sol$solution[2], pch=19, cex=1.6, col="darkgreen")
text(sol$solution[1], sol$solution[2] + 2,
     labels=paste0("Óptimo (", sol$solution[1], ", ", sol$solution[2], ")\nZ=", sol$objval),
     col="darkgreen", cex=0.9)

# agregar leyenda
legend("topright", legend=c("2x+4y=200", "x+2y=90", "Región factible", "Óptimo"),
       lty=c(1,1,NA,NA), pch=c(NA,NA,15,19), pt.cex=c(NA,NA,2,1.2),
       col=c("black","black", rgb(0.8,0.9,1,0.5), "darkgreen"), bty="n")
