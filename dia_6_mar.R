library(fdth)

var_quant <- c(1,2,2,2,3,3,4,4,5,5,5,5,5,5,6,6,6,7,7,7,8,8,
               9,10,10,10,10,10,11,11,13,15,15,15,15,15,
               16,17,17,17,18,19,19,19,19,19,20)

tab=fdt(var_quant, 
        start=2,
        h=1,
        end=20
       )

plot(tab,type='fh', xlab="tempo de espera (min)",ylab="nº pacientes", col = "black")
plot(tab,type='fp', xlab="tempo de espera (min)",ylab="nº pacientes", col = "blue")
plot(tab,type='rfh', xlab="tempo de espera (min)",ylab="nº pacientes", col = "green")
plot(tab,type='rfp', xlab="tempo de espera (min)",ylab="nº pacientes", col = "red")
plot(tab,type='rfph', xlab="tempo de espera (min)",ylab="nº pacientes", col = "orange")
plot(tab,type='rfpp', xlab="tempo de espera (min)",ylab="nº pacientes", col = "black")
plot(tab,type='d', xlab="tempo de espera (min)",ylab="nº pacientes", col = "green")
#---
plot(tab,type='cdh', xlab="tempo de espera (min)",ylab="nº pacientes", col = "red")
plot(tab,type='cdp', xlab="tempo de espera (min)",ylab="nº pacientes", col = "blue")
plot(tab,type='cfh', xlab="tempo de espera (min)",ylab="nº pacientes", col = "green")
plot(tab,type='cfp', xlab="tempo de espera (min)",ylab="nº pacientes", col = "black")
plot(tab,type='cfph', xlab="tempo de espera (min)",ylab="nº pacientes", col = "black")
plot(tab,type='cfpp', xlab="tempo de espera (min)",ylab="nº pacientes", col = "blue")
