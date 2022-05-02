
# === LIBRERÍAS === (((
library(lmtest)
# )))

# === DATOS === (((
datos = read.table('datos.txt', header = TRUE) 
# )))

# === REGRESIÓN === (((
lm(Velocidad~Frecuencia,data=datos)$coefficients
# )))

