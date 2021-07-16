library(readxl)
library(tidyverse)

path = "D:/S2/projet_tutore/notebook/"
df_candidat = read_excel(paste(path, "df2017.xlsx", sep=""), sheet = "candidat")
df_note = read_excel(paste(path, "df2017.xlsx", sep=""), sheet = "note")
df_choix = read_excel(paste(path, "df2017.xlsx", sep=""), sheet = "choix")
df_test = read_excel(paste(path, "df2017.xlsx", sep=""), sheet = "test")

selection_serie_filiere = function(df, serie_voulu, filiere_voulu) {
  # df: doit être le jointure entre la liste des candidats(il doit y avoir la colonne "filiere accueil") et leurs choix
  # il te retourne ton dataframe avec ceux de la série C(si passé en paramètre) ayant dans leur choix CAE(si CAE est passé en paramètre)
  # et on ajoute une colonne "admis_CAE" avec 0 pour echec et 1 pour succès dans la filière
  df = df%>%filter(serie == serie_voulu)
  collage = paste(
    df$codeFiliere_1, 
    df$codeFiliere_2, 
    df$codeFiliere_3, 
    df$codeFiliere_4, 
    df$codeFiliere_5, 
    df$codeFiliere_6, 
    df$codeFiliere_7, 
    df$codeFiliere_8, 
    df$codeFiliere_9, 
    sep="_"
  )
  
  df = (df[which(str_detect(collage, regex(filiere_voulu, ignore_case = T))), ])
  
  admis_filiere_voulu = data.frame("cool" = rep(NA, nrow(df)))
  colnames(admis_filiere_voulu) = c(paste("admis", filiere_voulu, sep="_"))
  admis_filiere_voulu[which(df$FiliereAccueil == filiere_voulu), paste("admis", filiere_voulu, sep="_")] = 1
  admis_filiere_voulu[-which(df$FiliereAccueil == filiere_voulu), paste("admis", filiere_voulu, sep="_")] = 0
  
  df = cbind(df, admis_filiere_voulu)
  return (df)
}

df = df_candidat
df = na.omit(df)
df = df%>%left_join(df_choix, by=c("identifiantCandidat","annee"))
df = df[,apply(df, 2, function(x) !all(is.na(x)))]

# permet d'obtenir toutes les filières du dataframe df
filiere = df$codeFiliere_1
filiere = append(filiere, df$codeFiliere_2)
filiere = append(filiere, df$codeFiliere_3)
filiere = append(filiere, df$codeFiliere_4)
filiere = append(filiere, df$codeFiliere_5)
filiere = append(filiere, df$codeFiliere_6)
filiere = append(filiere, df$codeFiliere_7)
filiere = append(filiere, df$codeFiliere_8)
filiere = append(filiere, df$codeFiliere_9)
filiere = unique(filiere)

View(selection_serie_filiere(df, "C", "CAE"))

