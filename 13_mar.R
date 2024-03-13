library(dplyr)

# Criando um conjunto de dados exemplo
dados <- data.frame(
  id = 1:10,
  valor1 = 11:20,
  valor2 = rnorm(10)
)

# Usando o operador de pipe para encadear três operações
resultado <- dados %>%
  mutate(soma_valores = valor1 * valor2) %>%   # Adiciona uma nova coluna com a soma dos valores
  filter(soma_valores > 0) %>%                 # Filtra as linhas onde a soma dos valores é maior que zero
  select(id, soma_valores)                     # Seleciona apenas as colunas 'id' e 'soma_valores'

# Exibindo o resultado
print(resultado)
