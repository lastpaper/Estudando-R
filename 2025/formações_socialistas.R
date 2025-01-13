library(ggplot2)
library(dplyr)
library(ggthemes)

# Dados de 10 revoluções comunistas fictícias
dados <- data.frame(
  Evento = c(
    "URSS", 
    "China", 
    "Albânia"

  ),
  guerra = c(1917, 1927, 1939),
  fim_guerra = c(1922, 1949, 1946),
  Democracia_popular = c(1922, 1949, 1946),
  fim_democracia_popular = c(1930, 1956, 1967),
  Socialismo = c(1930, 1956, 1967), 
  FimSocialismo = c(1956, 1976, 1985) 
)

ggplot() +
  geom_point(data = dados, aes(x = guerra, y = reorder(Evento, guerra)),
             shape = 19, size = 9, fill = "black", color = "black") +
  
  geom_point(data = dados, aes(x = fim_guerra, y = reorder(Evento, fim_guerra)),
             shape = 23, size = 10, fill = "black", color = "black") +
  
  geom_point(data = dados, aes(x = Socialismo, y = reorder(Evento, Socialismo)),
             shape = 23, size = 10, fill = "darkred", color = "darkred") +
  geom_point(data = dados, aes(x = FimSocialismo, y = reorder(Evento, FimSocialismo)),
             shape = 19, size = 9, fill = "darkred", color = "darkred") +
  
  
  # Adicionar segmento azul laranja guerra civil
  geom_segment(data = dados,
               aes(
                 x = guerra,
                 xend = fim_guerra,
                 y = reorder(Evento, -guerra),
                 yend = reorder(Evento, -fim_guerra),
                 color = "Guerra"
               ),
               size = 10) +
  # Adicionar segmento azul claro democracia popular
  geom_segment(data = dados,
               aes(
                 x = Democracia_popular,
                 xend = fim_democracia_popular,
                 y = reorder(Evento, -Democracia_popular),
                 yend = reorder(Evento, -fim_democracia_popular),
                 color = "Construindo"
               ),
               size = 10) +
  # Adicionar segmento vermelho (tempo socialista), apenas onde há dados válidos
  geom_segment(data = dados,
               aes(
                 x = Socialismo,
                 xend = FimSocialismo,
                 y = reorder(Evento, -Socialismo),
                 yend = reorder(Evento, -FimSocialismo),
                 color = "Socialista"
               ),
               size = 10) +
  
  # Adicionar texto para o ano no início das barras
  geom_text(data = dados %>% filter(!is.na(guerra)),
            aes(
              x = guerra,
              y = reorder(Evento, -guerra),
              label = guerra,
            ),
            size = 3, hjust = - .2, fontface="bold", color="white") +
  
  geom_text(data = dados %>% filter(!is.na(Democracia_popular)),
            aes(
              x = Democracia_popular,
              y = reorder(Evento, -Democracia_popular),
              label = Democracia_popular,
            ),
            size = 3, hjust = -0.2, fontface="bold", color="white") +
  
  geom_text(data = dados %>% filter(!is.na(Socialismo)),
            aes(
              x = Socialismo,
              y = reorder(Evento, -Socialismo),
              label = Socialismo,
            ),
            size = 3, hjust = -0.2, fontface="bold", color="yellow") +
  
  geom_text(data = dados %>% filter(!is.na(FimSocialismo)),
            aes(
              x = FimSocialismo,
              y = reorder(Evento, -FimSocialismo),
              label = FimSocialismo,
            ),
            size = 3, hjust = 1, fontface="bold", color="yellow") +
  # 
  # # Adicionar ponto de losango preenchido
  # # Adicionar ponto de losango preenchido
  # # Adicionar pontos de losango sem legenda
  # geom_point(data = dados, aes(x = guerra, y = reorder(Evento, guerra)),
  #            shape = 19, size = 9, fill = "black", color = "black") +
  # 
  # geom_point(data = dados, aes(x = fim_guerra, y = reorder(Evento, fim_guerra)),
  #            shape = 19, size = 9, fill = "darkgreen", color = "darkgreen") +
  # 
  # geom_point(data = dados, aes(x = Socialismo, y = reorder(Evento, Socialismo)),
  #            shape = 19, size = 9, fill = "darkred", color = "darkred") +
  
  scale_color_manual(
    name = "", # Nome da legenda
    values = c(
      "Guerra" = "black",
      "Construindo" = "darkgreen", 
      "Socialista" = "darkred"
    ),
    labels = c("Democracia Popular", 
               "Guerra Civil Revolucionária", "Socialismo")
  ) +
  scale_x_continuous(
    breaks = seq(1910, 1990, by = 10), 
    labels = seq(1910, 1990, by = 10)
  ) +
  expand_limits(x = c(1915, 1990)) +
  # Títulos e temas
  labs(
    title = "Formações Socialistas do séc XX",
    subtitle = "De acordo com o Marxismo-leninismo-maoismo",
    x = "",
    y = ""
  ) +
  theme_fivethirtyeight() +
  theme(
    legend.position = "bottom", 
    legend.text = element_text(size = 10, face = "bold", color = "black"),
    axis.text.x = element_text(size = 12, face = "bold", color = "black"),
    axis.text.y = element_text(size = 16, face = "bold", color = "black"),  # Eixo Y em negrito e maior
    panel.border = element_rect(color = "black", size = 1.5)
  )

