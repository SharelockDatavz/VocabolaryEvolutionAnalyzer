#---------------------------------------------------------------------------------------------
#              CONTATORE DI FREQUENZA DI PAROLE NEL TESTO CON CREAZIONE DI WORDCLOUD
#---------------------------------------------------------------------------------------------

# REMEMBER TO install.packages('tm')
# REMEMBER TO install.packages('SnowballC')

library(tm)
library(SnowballC)

#-----------------------------------------------------------------------
# VECCHIO MODO DI IMPORTAZIONE DEL TESTO (ERA DA TRASFORMARE IN CSV)
#-----------------------------------------------------------------------
# text <- read.csv( "2014_GS_pulito.csv", header=FALSE , sep = ";" )
# text_combined <- paste(text$V1, collapse = " ")
# text_source <- VectorSource(text_combined)
# corpus <- Corpus(text_source)
#-----------------------------------------------------------------------

corpus <- Corpus(DirSource("magic-folder/"))

corpus <- tm_map(corpus, content_transformer(tolower))
corpus <- tm_map(corpus, removePunctuation)
corpus <- tm_map(corpus, stripWhitespace)
corpus <- tm_map(corpus, removeWords, stopwords("english"))
# Stemming disattivato (operazione che elimina la terminazione della parola per aiutare la comparazione)
#corpus <- tm_map(corpus, stemDocument)


dtm <- DocumentTermMatrix(corpus)
dtm2 <- as.matrix(dtm)

frequency <- colSums(dtm2)
frequency <- sort(frequency, decreasing = TRUE)

head(frequency)

#-----------------------------------------------------------------------
#       CREAZAIONE DELLA WORDCLOUD
#-----------------------------------------------------------------------
# REMEMBER TO install.packages("wordcloud")
# library(wordcloud)
# words <- names(frequency)
# wordcloud(words[1:100], frequency[1:100])
#-----------------------------------------------------------------------


#-----------------------------------------------------------------------
# TRASFORMAZIONE DEL DATASET IN UNA TABELLA A DUE COLONNE CON PAROLA E FREQUENZA
#-----------------------------------------------------------------------
y <- data.frame(frequency)
z <- data.frame( "Word" = row.names(y), "Frequency" = y$frequency, "Absolute Percentage" = ((frequency)*100)/(sum(frequency)))


#------------------------------------------------------------------------------------
#                     CONTATORE DI NOMI DI AZIENDE NEL TESTO
#------------------------------------------------------------------------------------

# ELENCO DELLE AZIENDE DA CERCARE NEL TESTO (E AGGIUNTA CODICE PER RENDERE LA RICERCA UNIVOCA)

CompanyToMatch <- read.csv( "elenco-aziende.csv", header=FALSE , sep = ";" )
CompanyToMatch <- tolower(CompanyToMatch$V1)
CompanyToMatch <- sub("^", "^", CompanyToMatch )
CompanyToMatch <- sub("$", "$", CompanyToMatch )


# CREAZIONE DEL DATASET CON I RISULTATI

CompanyMatched <-  data.frame(
  "Company" = z$Word[grep((paste(CompanyToMatch,collapse="|")), z$Word)],
  "Frequency" = z$Frequency[grep((paste(CompanyToMatch,collapse="|")), z$Word)]
)

CompanyMatched <-  data.frame(
  "Company" = z$Word[grep((paste(CompanyToMatch,collapse="|")), z$Word)],
  "Frequency" = z$Frequency[grep((paste(CompanyToMatch,collapse="|")), z$Word)],
  "Percentage" = ((CompanyMatched$Frequency)*100)/(sum(CompanyMatched$Frequency))
)

#------------------------------------------------------------------------------------
#                     CONTATORE DI AUTORI NEL TESTO
#------------------------------------------------------------------------------------

# ELENCO DELLE AZIENDE DA CERCARE NEL TESTO (E AGGIUNTA CODICE PER RENDERE LA RICERCA UNIVOCA)

InfluencerToMatch <- read.csv( "elenco-influencer.csv", header=FALSE , sep = ";" )
InfluencerToMatch <- tolower(InfluencerToMatch$V1)
InfluencerToMatch <- sub("^", "^", InfluencerToMatch )
InfluencerToMatch <- sub("$", "$", InfluencerToMatch )


# CREAZIONE DEL DATASET CON I RISULTATI

InfluencerMatched <-  data.frame(
  "Influencer" = z$Word[grep((paste(InfluencerToMatch,collapse="|")), z$Word)],
  "Frequency" = z$Frequency[grep((paste(InfluencerToMatch,collapse="|")), z$Word)]
)

InfluencerMatched <-  data.frame(
  "Influencer" = z$Word[grep((paste(InfluencerToMatch,collapse="|")), z$Word)],
  "Frequency" = z$Frequency[grep((paste(InfluencerToMatch,collapse="|")), z$Word)],
  "Percentage" = ((InfluencerMatched$Frequency)*100)/(sum(InfluencerMatched$Frequency))
)

#------------------------------------------------------------------------------------
#                     ESPORTARE I RISULTATI IN CSV
#------------------------------------------------------------------------------------

# ESPORTAZIONE DEI PRIMI 500 CARATTERI 
x <- data.frame("Word" = z$Word[1:500], "Frequency" = z$Frequency[1:500], "Percentage" =z$Absolute.Percentage[1:500])
write.csv( x, "1_Words/LN_TotalBody_(WORDS).csv")

# ESPORTAZIONE DEL DATASET IN CSV (NOMI AZIENDE TROVATE NEL TESTO CON PERCENTUALE)
write.csv(CompanyMatched, "2_Company/LN_TotalBody_(COMPANY).csv")

# ESPORTAZIONE DEL DATASET IN CSV (NOMI INFLUENCER TROVATI NEL TESTO CON PERCENTUALE)
write.csv(InfluencerMatched, "3_Influencer/LN_TotalBody_(INFLUENCER).csv")
