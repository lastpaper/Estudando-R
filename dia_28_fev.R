x <- 9

sqrt(x) # raiz
factorial(x)
y <- -6


abs(y) # valor absoluto
log(x) #logaritmo
z <- log(x, base = 2)

round(z, digits = 2) #arredondar (2 casas decimais)
signif(z, digits = 2) #arrendondar (2 casas)

floor(z) # baixo
ceiling(z) #cima
trunc(z) # corta a casa decimal


x.x <- 10 # double
x <- 10L #integer
num_complexo <- 3 +4i #complex

h <- T
j <- F
typeof(h) # logical

h & j # false
h | j # true


var <- readline(prompt = "Digite o valor: ")
typeof(var)
ola <- "Olá, "
paste(ola, var, sep="o")

vetor <- 2:8 
# int [1:7] 2 3 4 5 6 7 8

vetor <- seq(from = 2, to = 18, by = 2)
# num [1:9] 2 4 6 8 10 12 14 16 18

vetor <- seq(2, 18, 3)
#num [1:6] 2 5 8 11 14 17

vetor <- seq(from = 1, to = 20, length.out=40)
vetor
# 30 numeros de 2 a 20, números quebrados
#----------------------------------------------------

vetor1 <- 1:5
vetor2 <- 12:16
vetor3 <- c(vetor1, vetor2)

vetor1 <- c("caio", "maria", "carlos")

is.numeric(vetor1) # TRUE ou False
is.integer(vetor1)
is.character(vetor1)

str(vetor1)
# chr [1:3] "caio" "maria" "carlos"

length(vetor) # mostra o tamanho

#------ Matriz --------------

A <- matrix(
  seq(from=3, to=666, length.out=36), 
  nrow = 6,
  ncol = 6
)

A[1,1]
A[2,]
A[,2]
A

# ---- criar matriz com rbind ----
v1 <- c('SP', 'RJ', 'MG')
v2 <- c('RN', 'MT', 'AM')
v3 <- c('PE', 'RS', 'SC')

B <- rbind(v1,v2,v3)
B
#    [,1] [,2] [,3]
# v1 "SP" "RJ" "MG"
# v2 "RN" "MT" "AM"
# v3 "PE" "RS" "SC"

# Mesma coisa, mas transposta
C <- cbind(v1, v2, v3)
C
#       v1   v2   v3  
# [1,] "SP" "RN" "PE"
# [2,] "RJ" "MT" "RS"
# [3,] "MG" "AM" "SC"

# ---------------

