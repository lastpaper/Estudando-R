# Código que coleta o maior e menos valor de uma lista
high_and_low <- function(numbers){
  conv = as.numeric(unlist(strsplit(numbers, " "))) # transforma a String em Numero
  min_value = min(conv) # busca o menor numero
  max_value = max(conv) # busca o maior numero
  
  return(paste(max_value, min_value)) # retorna uma string o maior e menor
}


high_and_low("8 3 -5 42 -1 0 0 -9 4 7 4 -4") # "42 -9"
high_and_low("1 2 3") # 3 1"
