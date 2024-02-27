# Função que inverte caracteres de uma string (de trás para frente)
solution <- function(s){
  stringi::stri_reverse(s)
}
solution("world")
#-----------------------------------------------------

# Função que multiplica por vetores por 2
maps <- function(v) {
  v*2
}
maps(c(1,2,3))
#-----------------------------------------------------

# Função que converte numero para string
number_to_string <- function(n) {
  as.character(n)
}
number_to_string(932)
#-----------------------------------------------------

# Função que encontra Impar ou Par
even_or_odd <- function(n) {
  if(n%%2 == 0){
    return("even")
  } else {
    return("odd")
  }
}
even_or_odd(9)
#-----------------------------------------------------

# Converte Booleano em String
boolean_to_string <- function(b){
  as.character(b)
  toString(b)
}
boolean_to_string(TRUE)
boolean_to_string(FALSE)
#-----------------------------------------------------

# Converte Km/hora por Cm/segundo e desconsidera casas decimais
cockroach_speed <- function(s){
  round(s/0.036, 0)
}
cockroach_speed(1.08)
cockroach_speed(1.09)
cockroach_speed(0)
#-----------------------------------------------------

# Verifica se a primeia letra começa com R
are_you_playing_banjo <- function(name){
  if(substr(name, 1, 1) == 'R'){
    paste(name," plays banjo")
  } else if (substr(name, 1, 1) == 'r'){
    paste(name," plays banjo")
  } else {
    paste(name," does not play banjo")
  }
}
are_you_playing_banjo('Renato')
are_you_playing_banjo('rodrigo')
are_you_playing_banjo('Luiz')
#-----------------------------------------------------

# Soma somente os numeros positivos do array
positive_sum <- function(vec){
  resultado_da_soma = 0
  for(item in vec){
    if(item > 0){
      resultado_da_soma <- resultado_da_soma + item
    }
  }
  return(resultado_da_soma)
}
positive_sum(c(-1,2,3,4,-5))
#-----------------------------------------------------

# Remove os pontos de exclamação
remove_exclamation_marks <- function(s){
  gsub('!', '', s)
}
remove_exclamation_marks("Hello World!!!!")
#-----------------------------------------------------

# Trasformar palavras de um vetor numa string
smash <- function(words){
  paste0(words, collapse=' ')
}
smash(c("hello", "world"))
