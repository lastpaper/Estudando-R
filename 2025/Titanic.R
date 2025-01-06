# Importando os pacotes necessários
library(titanic)  # Base Titanic
library(dplyr)    # Manipulação de dados
library(ggplot2)  # Visualização de dados
library(ggthemes) # Temas visuais para gráficos
library(stargazer) # Geração de tabelas bonitas (opcional)

# Transformando Titanic para um data.frame para facilitar manipulações
base_titanic <- as.data.frame(Titanic)
print("Estrutura inicial do dataset Titanic:")
print(str(base_titanic))  # Visualizar a estrutura inicial do dataset

# Reorganizando o fator 'Survived' para garantir que "Yes" apareça primeiro
# Isso é útil para garantir que gráficos ou análises considerem a sobrevivência como prioridade.
base_titanic$Survived <- factor(base_titanic$Survived, levels = c("Yes", "No"))

# Adicionando uma nova "classe" chamada "Total", que resume os dados por gênero
total_titanic <- base_titanic %>%
  group_by(Sex, Survived) %>%  # Agrupando por sexo e sobrevivência
  summarise(Freq = sum(Freq)) %>%  # Somando frequências
  mutate(Class = "Total") %>%      # Adicionando uma coluna fixa "Total"
  ungroup()
print("Tabela com totais por gênero e sobrevivência:")
print(total_titanic)

# Combinando o dataset original com os totais criados
base_titanic <- bind_rows(base_titanic, total_titanic)
print("Dataset combinado (com totais):")
print(head(base_titanic))

# Gerando um gráfico para explorar visualmente os dados
ggplot(base_titanic, aes(x = Class, y = Freq, fill = Survived)) +
  geom_bar(stat = "identity", position = "stack") + # Barras empilhadas
  facet_grid(~Sex) +                                # Separando gráficos por gênero
  scale_fill_manual(values = c("Yes" = "cyan4", "No" = "red4")) + # Personalização de cores
  labs(
    title = "Survivor Distribution by Class and Gender",
    subtitle = "Analyzing Titanic data based on survival.",
    caption = "Source: Titanic Dataset - R Datasets",
    y = "Count"
  ) +
  theme_stata()  # Estilo do gráfico

# Transformando 'Class' em um fator (garantindo ordem consistente)
base_titanic$Class <- factor(base_titanic$Class)

# Expandindo os dados: criando um dataset onde cada linha representa um passageiro
# Isso é feito repetindo as linhas pela frequência 'Freq'
expanded_data <- base_titanic[rep(1:nrow(base_titanic), base_titanic$Freq), ]
expanded_data$Freq <- NULL  # Removendo a coluna de frequência, já que agora cada linha é um indivíduo
print("Dados expandidos (cada linha representa um indivíduo):")
print(head(expanded_data))

# Substituindo a variável 'Survived' por valores numéricos (1 = Yes, 0 = No)
# Essa transformação é necessária para a regressão logística
expanded_data$Survived <- ifelse(expanded_data$Survived == "Yes", 1, 0)

# Ajustando um modelo de regressão logística para prever sobrevivência
# Baseado nas variáveis 'Class', 'Sex' e 'Age'
model <- glm(Survived ~ Class + Sex + Age, data = expanded_data, family = binomial)
print("Resumo do modelo de regressão logística:")
print(summary(model))

# Gerando uma tabela formatada para exportação
stargazer(
  model,
  type = "html",
  title = "Titanic Dataset",
  notes = "Note: The class covariates are being predicted relative to the 1st Class.",
  covariate.labels = c("2nd Class", "3rd Class", "Crew Class", "Female", "Adult", "Constant"),
  out = "C:/Users/Titanic_Model_Summary.html"  # Caminho para salvar o relatório
)
