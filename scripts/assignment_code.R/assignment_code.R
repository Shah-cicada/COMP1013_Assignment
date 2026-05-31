library(tidyverse)
library(knitr)
library(kableExtra)

players <- read.csv("data/players.csv")
games <- read.csv("data/games.csv")
sessions <- read.csv("data/sessions.csv")

head(players)
head(games)
head(sessions)
