
# === LIBRERÍAS === (((
library(lmtest)
# )))

# === DATOS === (((
datos = read.table('datos.txt', header = TRUE) 
# )))

# === REGRESIÓN === (((
regresion = lm(Long_Onda~Tiempo,data=datos)
regresion$coefficients
# )))

# === ERROR ESTÁNDAR === (((
sprintf(" --- ERROR ESTÁNDAR DEL MÉTODO DE MÍNIMOS CUADRADOS --- ")
summary(regresion)$coefficients
# )))
