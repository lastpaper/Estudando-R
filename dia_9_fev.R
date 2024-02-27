# confere arquivos do diretório
lista.de.arquivos <- list.files(getwd())
# pergunta se é um vetor: "TRUE"
is.vector(lista.de.arquivos)
# de arquivo em arquivo printa o nome do arquivo
for(i in lista.de.arquivos){
  print(paste('Leia o arquivo: ', i))  
}
#-----------------------------------------------------
# Valores menores que 5 são substituidos por 0 e valores iguais ou maiores são substituidos por 1
fake_bin <- function(x){
  chartr("123456789", "000011111", x) 
}
fake_bin('45385593107843568')

# cumpre a mesma função, mas foi escrita de maneira diferente
fake_bin <- function(x){
  x <-gsub('[0-4]',0,x)
  x <- gsub('[5-9]',1,x)
  print(x) 
}
