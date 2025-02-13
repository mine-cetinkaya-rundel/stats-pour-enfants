# load packages ----------------------------------------------------------------

library(tidyverse)
library(waffle)

# colors: create data ----------------------------------------------------------

colors <- tribble(
  ~color,   ~n,
  "Bleu",   1,
  "Jaune",  2,
  "Orange", 3,
  "Rose",   4,
  "Rouge",  5,
  "Vert",   6,
  "Violet", 7
)

# colors: bar plot -------------------------------------------------------------

ggplot(colors, aes(x = color, y = n, fill = color)) +
  geom_col(show.legend = FALSE) +
  scale_fill_manual(
    values = c(
      "Bleu"   = "#4791bc", 
      "Jaune"  = "#efe061",
      "Orange" = "#f3ac5b", 
      "Rose"   = "#ec81ba", 
      "Rouge"  = "#a62b2e", 
      "Vert"   = "#9fce72",
      "Violet" = "#57367d"
    )
  ) +
  theme_minimal() +
  labs(
    x = "Couleur",
    y = "Fréquence",
    title = "Couleurs préférées des étudiants IMS",
    subtitle = "Graphique à barres"
  )

# colors: pie chart ------------------------------------------------------------

ggplot(colors, aes(x = "", y = n, fill = color)) +
  geom_bar(stat="identity", width = 1, show.legend = FALSE, color = "white") +
  coord_polar("y", start = 0) +
  scale_y_continuous(breaks = seq(0, 26, 2)) +
  scale_fill_manual(
    values = c(
      "Bleu"   = "#4791bc", 
      "Jaune"  = "#efe061",
      "Orange" = "#f3ac5b", 
      "Rose"   = "#ec81ba", 
      "Rouge"  = "#a62b2e", 
      "Vert"   = "#9fce72",
      "Violet" = "#57367d"
    )
  ) +
  theme_minimal() +
  labs(
    title = "Couleurs préférées des étudiants IMS",
    subtitle = "______" # Camembert
  )

# animals: create data ---------------------------------------------------------

animals <- tribble(
  ~color,    ~n, ~emoji,
  "Baleine", 1,  "🐋",
  "Chat",    2,  "🐈",
  "Chien",   3,  "🐕",
  "Requin",  4,  "🦈",
  "Serpent", 5,  "🐍"
)

# animals: bar plot ------------------------------------------------------------

ggplot(animals, aes(x = color, y = n)) +
  geom_col() +
  labs(
    x = "Animal",
    y = "Fréquence",
    title = "Animaux préférées des étudiants IMS",
    subtitle = "Graphique à barres"
  ) +
  geom_text(
    aes(y = n + 0.5 , label = emoji), size = 14
  ) +
  theme_minimal() +
  coord_cartesian(clip = "off")

# animals: waffle chart --------------------------------------------------------

ggplot(animals, aes(fill = color, values = n)) +
  geom_waffle(
    n_rows = 5,
    size = 0.33, 
    colour = "white",
    flip = TRUE,
    show.legend = FALSE
  ) +
  geom_pictogram(
    n_rows = 5, 
    aes(label = emoji),
    flip = TRUE,
    show.legend = FALSE,
    size = 15
  ) +
  scale_fill_manual(values = rep("lightgray", nrow(animals))) +
  coord_equal() +
  theme_void() +
  labs(
    title = "Animaux préférées des étudiants IMS",
    subtitle = "____" # Tableau de gaufres
  )
