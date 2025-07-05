
# Chargement des bibliothèques nécessaires
if (!require("VIM")) install.packages("VIM")
if (!require("ggplot2")) install.packages("ggplot2")
if (!require("corrplot")) install.packages("corrplot")
if (!require("FactoMineR")) install.packages("FactoMineR")
if (!require("factoextra")) install.packages("factoextra")

library(VIM)
library(ggplot2)
library(corrplot)
library(FactoMineR)
library(factoextra)

# Importer les données
country_data <- read.csv("~/Country-data.csv", head=TRUE, sep = ",")
rownames(country_data) <- country_data$country
country_data <- country_data[, -1]

# Afficher les premières lignes pour vérifier
print(head(country_data))


# Renommer les colonnes
colnames(country_data) <- c(
  "Décès_enfants",
  "Exportations_PIB",
  "Santé_PIB",
  "Importations_PIB",
  "Revenu_par_personne",
  "Inflation",
  "Espérance_de_vie",
  "Fécondité_totale",
  "PIB_par_habitant"
)

# Afficher les données avec les nouveaux noms de colonnes
head(country_data)


#Structure des données
str(country_data)

#Résumé des données 
summary(country_data)

Analyse des valeurs manquantes


# Étape 2 : Analyse des valeurs manquantes
proportion_valeurs_manquantes <- function(data) {
  nb_valeurs_manquantes <- sapply(data, function(x) sum(is.na(x)))
  proportion_manquantes <- nb_valeurs_manquantes / nrow(data)
  data.frame(Nombre = nb_valeurs_manquantes, Proportion = proportion_manquantes)
}
valeurs_manquantes <- proportion_valeurs_manquantes(country_data)
#Proportion de valeurs manquantes
valeurs_manquantes


# Visualisation des valeurs manquantes
aggr(country_data, col = c('navyblue', 'yellow'), numbers = TRUE, sortVars = TRUE,
     labels = names(country_data), cex.axis = .7, gap = 3,
     ylab = c("Histogramme des données manquantes", "Pattern"))


Description des variables quantitatives


# Description des variables quantitatives
vars_quantitatives <- sapply(country_data, is.numeric)

for (var in names(country_data)[vars_quantitatives]) {
  print(ggplot(country_data, aes_string(x = var)) +
          geom_histogram(bins = 30, fill = "blue", color = "black") +
          theme_minimal() +
          labs(title = paste("Histogramme de", var), x = var, y = "Fréquence"))
}


# Analyse des corrélations
donnees_quantitatives <- country_data[, vars_quantitatives]
matrice_correlation <- cor(donnees_quantitatives, use = "complete.obs")

corrplot(matrice_correlation, method = "color", type = "upper", order = "hclust",
         tl.col = "black", tl.srt = 45, addCoef.col = "black")


# Centrage et réduction des données
donnees_centrees_reduites <- scale(donnees_quantitatives, center = TRUE, scale = TRUE)


# Réalisation d'une ACP
resultat_acp <- PCA(donnees_centrees_reduites, graph = FALSE)
#Résumé des résultats de l'ACP
resultat_acp


print(resultat_acp$eig)
#Visualisation des résultats de l'ACP
valeurspropres <- resultat_acp$eig
barplot(valeurspropres[, 2], names.arg = 1:nrow(valeurspropres),
        main = "Pourcentage de la variance expliquée par chaque composante",
        xlab = "Composantes principales", ylab = "Pourcentage de variance expliquée",
        col = "steelblue")
lines(1:nrow(valeurspropres), valeurspropres[, 2], type = "b", pch = 19, col = "red")

Représentation du cercle de corrélation


# Cercle de corrélation
fviz_pca_var(resultat_acp, col.var = "cos2",
             gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"),
             repel = TRUE)


# Biplot des individus et des variables
# Zoomer sur une portion des données si nécessaire
# Agrandir l'échelle et les labels dans le biplot

fviz_pca_biplot(resultat_acp,
                select.ind = list(cos2 = 0.2),     # Inclure plus d'individus
                select.var = list(cos2 = 0.2),     # Inclure plus de variables
                repel = TRUE,                      # Éviter les chevauchements de labels
                col.ind = "blue", col.var = "red", # Couleurs
                labelsize = 3,                     # Réduire la taille des labels
                pointsize = 1                      # Réduire la taille des points
) +
  theme(
    text = element_text(size = 10),                # Réduction du texte global
    axis.title = element_text(size = 12),         # Taille des titres des axes
    axis.text = element_text(size = 10)           # Taille des labels des axes
  )



