library(lmtest)
library(ggplot2)
library(gridExtra)
#EXPERIMENTO 1

#registro de datos
x1<-seq(10,70,10)
x1
y1<-seq(10,70,10)
y1

#mínimos cuadrados
recta1<-lm(y1~x1)
recta1
summary(recta1)$coefficients

#gráfica
graf1<-ggplot(data=NULL,aes(x=x1, y=y1)) + 
  geom_abline(aes(intercept=0,slope=1)) + 
  geom_point()+labs(x=TeX('$\\theta_r$'),y=TeX('$\\theta_i$'))+
  scale_x_continuous(limit = c(0,70),breaks=seq(0, 70, 10))+
  scale_y_continuous(limit = c(0,70),breaks=seq(0, 70, 10)) +
	theme_minimal()+
  annotate(geom = "text",
	 x = 62,
	 y = 54,
	 label = TeX('$\\theta_i=\\theta_r$'),
	 size=6)

graf1



#EXPERIMENTO 2
#registro de datos
yi<-seq(0,60,10)
yt<-c(0,7.5,15,21.5,29,35,41)
yr<-c(0,10,20,30,41,50.5,61)

#cálculos tablas
senyt<-sin(yt*(pi/180))
senyi<-sin(yi*(pi/180))

#incertidumbres
abcosyt<-abs(cos(yt*(pi/180)))
abcosyi<-abs(cos(yi*(pi/180)))

senyt
senyi

0.5*abcosyt
0.5*abcosyi


#minimos cuadrados
recta2<-lm(senyi~senyt)
recta2
summary(recta2)$coefficients


#gráfica
graf2<-ggplot(data=NULL,aes(x=senyt, y=senyi))+ 
  geom_point()+
labs(x=TeX('$\\sen(theta_t)$'),y=TeX('$\\sen(theta_i)$')) + 
  geom_abline(aes(intercept=summary(recta2)$coefficients[1],
	slope=summary(recta2)$coefficients[2]))+
  scale_x_continuous(limit = c(0,0.72),breaks=seq(0, 1, 0.1))+
  scale_y_continuous(limit = c(0,1),breaks=seq(0, 1, 0.25)) +
 	theme_minimal()+
  annotate(geom = "text",
 x = 0.45,
 y = 0.9,
 label = TeX('$sen(\\theta_i)=(1.3265)sen(\\theta_t)+0.0019$'),
 size=5.5)

graf2
