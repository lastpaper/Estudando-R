#  --- EXEMPLO DE USO DO PIPE ---

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

# -------------------------------


# --- EXEMPLO DE USO DO RVEST ---
library(rvest)

# URL para fazer a requisição GET
url <- "https://www.github.com"

# Fazendo a requisição GET e parseando o HTML
pagina <- read_html(url)

# Extraindo o título da página
titulo <- html_text(html_node(pagina, "title"))

titulo <- url %>% 
  read_html() %>% 
  html_node("h2") %>% 
  html_text()

# Exibindo o título
cat("Título:", titulo, "\n")

# --- DIAGRAMA NO R ---
library(igraph)

# Criar um grafo direcionado
grafo <- graph(edges=c(
  "Valor", "Salário", 
  "Valor", "Mais-valia", 
  "Mais-valia", "Renda da Terra",
  "Mais-valia", "Juro",
  "Mais-valia", "Lucro"
), directed=TRUE)

# Definir os rótulos dos vértices
V(grafo)$label <- V(grafo)$name

# Lista de layouts disponíveis
layouts <- c("layout.circle", "layout.sphere", "layout.random", "layout.fruchterman.reingold", "layout.graphopt", "layout.kamada.kawai", "layout.drl", "layout.mds", "layout.grid", "layout.star", "layout_as_tree", "layout_with_sugiyama")

# Testar cada layout
for (layout in layouts) {
  plot(grafo, layout=eval(parse(text=layout)), vertex.color="green", vertex.size=95, vertex.label.cex=1.2, edge.arrow.size=0.8,
       edge.curved=0.3, margin=-0.2, vertex.shape="rectangle", main=paste("Layout:", gsub("layout.", "", layout)))
  
  Sys.sleep(1)
}
