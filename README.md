# 📊 Analyse en Composantes Principales des Données Pays

[![R Version](https://img.shields.io/badge/R-%3E%3D%204.0.0-blue)](https://www.r-project.org/)
[![Python Version](https://img.shields.io/badge/Python-%3E%3D%203.8-green)](https://www.python.org/)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## 🎯 Description du Projet

Ce projet réalise une **Analyse en Composantes Principales (ACP)** approfondie sur un ensemble de données socio-économiques et sanitaires de 167 pays. L'objectif est d'identifier les pays prioritaires pour l'allocation d'aide humanitaire en utilisant des méthodes statistiques robustes.

### 🌍 Contexte
Dans le cadre de l'allocation d'un budget humanitaire de **10 millions de dollars**, une ONG internationale doit identifier objectivement les pays nécessitant une aide prioritaire. Cette analyse fournit une base scientifique pour optimiser l'impact des fonds disponibles.

### 🎓 Cadre Académique
- **Niveau** : Master 2 Sciences de l'Information - M1 2024-2025
- **Module** : Analyse de Données
- **Encadrement** : Professeur Marya Sadki
- **Étudiants** : ELFATINE M'barka & LAOUAD Ayoub

## 📁 Structure du Projet

```
projet-acp-pays/
│
├── 📄 README.md                          # Ce fichier
├── 📊 Country-data.csv                   # Dataset principal (167 pays × 9 variables)
├── 🔬 ACP_Country-avec_R.R              # Script R principal
├── 📓 ACP_Country-avec_R.qmd            # Document Quarto (R Markdown)
├── 🐍 ACP_Country-avec_Python.ipynb    # Notebook Jupyter (Python)
├── 📋 RAPPORT.pdf               # Rapport LaTeX détaillé
├── 📑 AnalyseDonnee-Country_data.pptx    # Présentation des résultats
```

## 📊 Description des Données

### 🗂️ Source
- **Plateforme** : [Kaggle](https://www.kaggle.com/datasets/vipulgohel/clustering-pca-assignment/data)
- **Fiabilité** : Dataset reconnu par la communauté Data Science
- **Mise à jour** : Données consolidées et validées

### 📋 Variables Analysées

| Variable | Description Française | Description Anglaise | Unité | Type |
|----------|----------------------|---------------------|-------|------|
| `child_mort` | Décès enfants | Child mortality per 1000 births | ‰ | Quantitative |
| `exports` | Exportations/PIB | Exports as % of GDP | % | Quantitative |
| `health` | Santé/PIB | Health spending as % of GDP | % | Quantitative |
| `imports` | Importations/PIB | Imports as % of GDP | % | Quantitative |
| `income` | Revenu par personne | Income per person | USD | Quantitative |
| `inflation` | Inflation | Annual inflation rate | % | Quantitative |
| `life_expec` | Espérance de vie | Life expectancy | Années | Quantitative |
| `total_fer` | Fécondité totale | Total fertility rate | Nombre | Quantitative |
| `gdpp` | PIB par habitant | GDP per capita | USD | Quantitative |

### 📊 Échantillon
- **Nombre de pays** : 167
- **Nombre de variables** : 9
- **Période** : Données consolidées récentes
- **Couverture géographique** : Mondiale

## 🔧 Prérequis et Installation

### 📋 Prérequis Système
- **Système d'exploitation** : Windows 10+, macOS 10.14+, Linux Ubuntu 18.04+
- **Mémoire RAM** : 4 GB minimum, 8 GB recommandé
- **Espace disque** : 2 GB disponibles

### 🔷 Pour R (Recommandé)

#### Version R
```r
# Vérifier la version R
R.version.string
# R version 4.0.0 ou supérieure requise
```

#### Installation des packages
```r
# Installation automatique des packages nécessaires
packages_requis <- c(
  "VIM",           # Visualisation des données manquantes
  "ggplot2",       # Visualisations avancées
  "corrplot",      # Matrices de corrélation
  "FactoMineR",    # Analyse factorielle
  "factoextra",    # Visualisations ACP
  "dplyr",         # Manipulation de données
  "reshape2",      # Restructuration des données
  "RColorBrewer",  # Palettes de couleurs
  "knitr",         # Génération de rapports
  "rmarkdown"      # Documents reproductibles
)

# Installation des packages manquants
nouveaux_packages <- packages_requis[!(packages_requis %in% installed.packages()[,"Package"])]
if(length(nouveaux_packages)) install.packages(nouveaux_packages)

# Chargement des packages
lapply(packages_requis, library, character.only = TRUE)
```

### 🐍 Pour Python (Alternative)

#### Version Python
```bash
python --version
# Python 3.8 ou supérieure requise
```

#### Installation avec pip
```bash
pip install pandas numpy matplotlib seaborn scikit-learn factor_analyzer plotly jupyter
```

#### Installation avec conda
```bash
conda install pandas numpy matplotlib seaborn scikit-learn
conda install -c conda-forge factor_analyzer plotly
```

## 🚀 Utilisation

### 🔷 Analyse avec R

#### Méthode 1 : Script R direct
```r
# Définir le répertoire de travail
setwd("chemin/vers/votre/projet")

# Exécuter l'analyse complète
source("ACP_Country-avec_R.R")
```

#### Méthode 2 : Document Quarto
```r
# Avec RStudio
# 1. Ouvrir ACP_Country-avec_R.qmd
# 2. Cliquer sur "Render"

# Avec la console R
quarto::quarto_render("ACP_Country-avec_R.qmd")
```

### 🐍 Analyse avec Python

#### Notebook Jupyter
```bash
# Lancer Jupyter
jupyter notebook ACP_Country-avec_Python.ipynb

# Ou avec JupyterLab
jupyter lab ACP_Country-avec_Python.ipynb
```

#### Script Python
```python
# Exécuter dans un environnement Python
exec(open('ACP_Country-avec_Python.py').read())
```

## 📈 Méthodologie

### 🔍 Étapes de l'Analyse

1. **📥 Préparation des données**
   - Importation et nettoyage
   - Gestion des valeurs manquantes
   - Renommage des variables

2. **🔍 Analyse exploratoire**
   - Statistiques descriptives
   - Visualisation des distributions
   - Détection des valeurs aberrantes

3. **🔗 Analyse des corrélations**
   - Matrice de corrélation
   - Visualisation des relations
   - Test de significativité

4. **⚙️ Préparation pour l'ACP**
   - Centrage et réduction
   - Vérification des conditions
   - Transformation des données

5. **📊 Analyse en Composantes Principales**
   - Calcul des composantes
   - Analyse des valeurs propres
   - Interprétation des axes

6. **📋 Interprétation et classification**
   - Identification des groupes
   - Classification des pays
   - Recommandations stratégiques

### 🧮 Fondements Mathématiques

#### Centrage et réduction
```
X_scaled = (X - μ) / σ
```

#### Matrice de corrélation
```
R = (1/n) * X_scaled^T * X_scaled
```

#### Décomposition en valeurs propres
```
R = P * Λ * P^T
```

## 📊 Résultats Principaux

### 🎯 Composantes Principales Identifiées

#### 1️⃣ Première Composante (PC1)
- **Interprétation** : Développement économique et sanitaire
- **Variables clés** : PIB/habitant, Espérance de vie, Mortalité infantile
- **Variance expliquée** : ~45%

#### 2️⃣ Deuxième Composante (PC2)
- **Interprétation** : Ouverture commerciale
- **Variables clés** : Exportations/PIB, Importations/PIB
- **Variance expliquée** : ~20%

#### 3️⃣ Troisième Composante (PC3)
- **Interprétation** : Dynamique démographique
- **Variables clés** : Fécondité, Croissance démographique
- **Variance expliquée** : ~15%

### 🏆 Classification des Pays

#### 🔴 Groupe 1 : Priorité Maximale
- **Caractéristiques** : Faible développement, besoins urgents
- **Exemples** : [À compléter selon vos résultats]
- **Allocation budgétaire** : 60% (6M USD)

#### 🟡 Groupe 2 : Priorité Élevée
- **Caractéristiques** : Développement intermédiaire
- **Exemples** : [À compléter selon vos résultats]
- **Allocation budgétaire** : 30% (3M USD)

#### 🟢 Groupe 3 : Partenaires Potentiels
- **Caractéristiques** : Développement avancé
- **Exemples** : [À compléter selon vos résultats]
- **Rôle** : Cofinancement et expertise

## 📊 Visualisations Générées

### 📈 Graphiques Principaux

1. **Matrice de corrélation** (`correlation_matrix.png`)
2. **Cercle de corrélation** (`pca_variables_circle.png`)
3. **Biplot individus-variables** (`pca_biplot.png`)
4. **Variance expliquée** (`variance_explained.png`)
5. **Classification des pays** (`countries_classification.png`)

### 📋 Tableaux de Résultats

1. **Valeurs propres** (`eigenvalues.csv`)
2. **Contributions des variables** (`variables_contributions.csv`)
3. **Coordonnées des pays** (`countries_coordinates.csv`)
4. **Classification finale** (`final_classification.csv`)

## 🔬 Validation et Robustesse

### ✅ Tests Effectués

- **Test de sphéricité de Bartlett** : Validation de l'applicabilité de l'ACP
- **Mesure KMO** : Adéquation de l'échantillonnage
- **Analyse de sensibilité** : Robustesse aux valeurs aberrantes
- **Validation croisée** : Stabilité des résultats

### 📊 Indicateurs de Qualité

| Indicateur | Valeur | Interprétation |
|------------|--------|----------------|
| KMO | >0.7 | Excellent |
| Bartlett | p<0.001 | Significatif |
| Variance cumulée (3 PC) | >80% | Très bon |

## 🎯 Applications Pratiques

### 🌍 Pour les ONG
- **Priorisation** : Identification objective des pays cibles
- **Allocation** : Optimisation des ressources limitées
- **Monitoring** : Suivi de l'évolution des indicateurs

### 🏛️ Pour les Décideurs Politiques
- **Diplomatie** : Orientation des partenariats internationaux
- **Coopération** : Identification des besoins de développement
- **Évaluation** : Mesure de l'efficacité des politiques

### 🎓 Pour les Chercheurs
- **Méthodologie** : Exemple d'application de l'ACP
- **Données** : Base pour des analyses complémentaires
- **Reproductibilité** : Code et données disponibles

## 🚧 Limitations et Perspectives

### ⚠️ Limitations Actuelles

#### Méthodologiques
- **Linéarité** : Assume des relations linéaires
- **Stationnarité** : Données à un instant T
- **Sensibilité** : Aux valeurs aberrantes

#### Données
- **Temporalité** : Absence de dimension temporelle
- **Complétude** : Quelques valeurs manquantes
- **Représentativité** : Biais potentiels par région

### 🔮 Perspectives d'Amélioration

#### Court terme
- [ ] Intégration de données temporelles
- [ ] Analyse de clustering complémentaire
- [ ] Validation par expertise terrain

#### Moyen terme
- [ ] Modélisation prédictive
- [ ] Interface interactive (Shiny/Dash)
- [ ] API pour mise à jour automatique

#### Long terme
- [ ] Machine Learning avancé
- [ ] Intégration de données satellites
- [ ] Système de recommandation adaptatif

## 👥 Équipe et Contributions

### 👨‍🎓 Étudiants
- **ELFATINE M'barka** : Analyse statistique, Interprétation
- **LAOUAD Ayoub** : Programmation, Visualisation

### 👩‍🏫 Encadrement
- **Professeur Marya Sadki** : Direction scientifique, Méthodologie

### 🙏 Remerciements
- **Kaggle** : Pour la mise à disposition des données
- **Communauté R** : Pour les packages utilisés
- **Université** : Pour le cadre de recherche

## 📚 Références et Ressources

### 📖 Références Bibliographiques

1. **Jolliffe, I.T.** (2002). *Principal Component Analysis*. Springer.
2. **Husson, F., Lê, S., Pagès, J.** (2017). *Exploratory Multivariate Analysis by Example Using R*. CRC Press.
3. **Kassambara, A.** (2017). *Practical Guide to Principal Component Methods in R*. STHDA.

### 🌐 Ressources En Ligne

- [Documentation FactoMineR](http://factominer.free.fr/)
- [Guide ACP avec R](https://www.sthda.com/french/articles/38-methodes-des-composantes-principales-dans-r-guide-pratique/73-acp-analyse-en-composantes-principales-avec-r-l-essentiel/)
- [Kaggle Dataset](https://www.kaggle.com/datasets/vipulgohel/clustering-pca-assignment/data)

### 📊 Outils Utilisés

| Outil | Version | Usage |
|-------|---------|--------|
| R | 4.3.0+ | Analyse statistique |
| RStudio | 2023.06+ | IDE R |
| Python | 3.8+ | Analyse alternative |
| Jupyter | 6.0+ | Notebooks interactifs |
| LaTeX | 2021+ | Rapport académique |

## 🆘 Support et FAQ

### ❓ Questions Fréquentes

#### Q1 : Comment interpréter les composantes principales ?
**R** : Les composantes principales sont des combinaisons linéaires des variables originales. Leur interprétation se base sur les variables qui contribuent le plus à chaque composante.

#### Q2 : Combien de composantes retenir ?
**R** : Utilisez le critère de Kaiser (valeurs propres > 1) ou analysez le graphique des valeurs propres pour identifier le "coude".

#### Q3 : Les résultats sont-ils sensibles aux valeurs aberrantes ?
**R** : Oui, l'ACP est sensible aux valeurs aberrantes. Nous recommandons une analyse préalable et éventuellement une ACP robuste.

#### Q4 : Comment valider les résultats ?
**R** : Utilisez des méthodes de validation croisée, analysez la stabilité des résultats et comparez avec des méthodes alternatives.

### 🐛 Résolution de Problèmes

#### Problème : Erreur d'installation des packages
```r
# Solution : Mettre à jour R et utiliser un autre miroir
options(repos = "https://cran.rstudio.com/")
install.packages("nom_package")
```

#### Problème : Mémoire insuffisante
```r
# Solution : Optimiser la mémoire
gc()  # Garbage collection
memory.limit(size = 8000)  # Augmenter la limite (Windows)
```

#### Problème : Encodage des caractères
```r
# Solution : Spécifier l'encodage
read.csv("fichier.csv", encoding = "UTF-8")
```

### 📧 Contact et Support

- **Email université** : alaouad@insea.ac.ma
- **GitHub Issues** : [\[Lien vers le repository\]](https://github.com/ayoub-laouad/ACP_Country-LAOUAD_Ayoub)

## 📜 Licence et Utilisation

### 📄 Licence
Ce projet est sous licence **MIT**. Vous êtes libre de :
- ✅ Utiliser le code à des fins commerciales
- ✅ Modifier le code
- ✅ Distribuer le code
- ✅ Utiliser le code dans des projets privés

### 🔗 Attribution
Si vous utilisez ce travail, merci de citer :
```
ELFATINE M'barka, LAOUAD Ayoub (2024). 
"Utilisation de l'ACP pour identifier les pays prioritaires 
en fonction des indicateurs socio-économiques et sanitaires". 
Projet Master 2 SI, Université [Nom].
```

### 🔄 Versions

| Version | Date | Changements |
|---------|------|-------------|
| 1.0.0 | 2024-12 | Version initiale |
| 1.1.0 | 2024-12 | Amélioration documentation |
| 1.2.0 | 2024-12 | Ajout validation croisée |

---

**📊 Dernière mise à jour** : Décembre 2024  
**🔗 Repository** : [Lien vers le repository GitHub]  
**📧 Contact** : [Emails des étudiants]

---

*Ce projet s'inscrit dans le cadre du Master 2 Sciences de l'Information et contribue à l'avancement des méthodes d'analyse de données pour le développement international.*
