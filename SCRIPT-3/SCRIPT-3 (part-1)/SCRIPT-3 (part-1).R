#-------------------------------------------------------------------------------------------
#                  IMPORTAZIONE DELLA TABELLA CON I DATI DA ELABORARE (GSC)
#-------------------------------------------------------------------------------------------

#IMPORTAZIONE DEL CSV
TBL.GSC <- read.csv( "_INPUT/_GSC_body_TABLE_(WORDS).csv", header=TRUE , sep = "," )

#Rinomino intestazione colonne
row.names(TBL.GSC) <- TBL.GSC$WORDS

#Pulisco la tabella 
TBL.GSC <- TBL.GSC[,3:8]
head(TBL.GSC)

#-------------------------------------------------------------------------------------------
#                  IMPORTAZIONE DELLA TABELLA CON I DATI DA ELABORARE (GSE)
#-------------------------------------------------------------------------------------------

#IMPORTAZIONE DEL CSV
TBL.GSE <- read.csv( "_INPUT/_GSE_body_TABLE_(WORDS).csv", header=TRUE , sep = "," )

#Rinomino intestazione colonne
row.names(TBL.GSE) <- TBL.GSE$WORDS

#Pulisco la tabella 
TBL.GSE <- TBL.GSE[,3:13]
head(TBL.GSE)

#-------------------------------------------------------------------------------------------
#                  IMPORTAZIONE DELLA TABELLA CON I DATI DA ELABORARE (LN)
#-------------------------------------------------------------------------------------------

#IMPORTAZIONE DEL CSV
TBL.LN <- read.csv( "_INPUT/_LN_body_TABLE_(WORDS).csv", header=TRUE , sep = "," )

#Rinomino intestazione colonne
row.names(TBL.LN) <- TBL.LN$WORDS

#Pulisco la tabella 
TBL.LN <- TBL.LN[,3:13]
head(TBL.LN)

#-------------------------------------------------------------------------------------------
#             IMPORTAZIONE DELLA TABELLA NUMERO DI ARTICOLI UTILIZZATI PER ANNO
#-------------------------------------------------------------------------------------------

#IMPORTAZIONE DEL CSV
ArticlesByYear <- read.csv( "_INPUT/articoli utilizzati per anno.csv", header=TRUE , sep = ";" )

#Rinomino intestazione colonne
row.names(ArticlesByYear) <- ArticlesByYear$X

#Pulisco la tabella 
ArticlesByYear <- ArticlesByYear[,2:4]
head(ArticlesByYear)


#-------------------------------------------------------------------------------------------
# CREAZIONE DELLA FUNZIONE CHE CONFRONTA L'USO DELLE PAROLE PRIMA E DOPO UN PERIODO DATO
#-------------------------------------------------------------------------------------------

# X ?? la tabella con i dati con numero di volte in cui ?? usata la parola per ciascun anno
# Y ?? la posizione in cui vuoi mettere l'asticella (deve essere compreso tra il numero di anni e il numero di anni meno uno)
# Z ?? la tabella con il numero totale di articoli usati per ogni anno

analisi <- function(x,y,z)
{
  #creo la variabile per il numero di anni calcolando il numero di colonne
  k <- ncol(x) 
  
  #Pulisco la X dagli NA trasformandoli in 0
  x[is.na(x)] <- 0
  
  x.after <- (rowSums(x[,1:y]))/((sum(z[1:y])))
  x.before <- (rowSums(x[,(y+1):k]))/((sum(z[(y+1):k])))
  
  w <- cbind(x.after,x.before)
  
  plot(w, 
        main = paste("Come cambia l'uso delle parole dopo il", (2016-y), "e prima del", (2015-y)), 
        xlab = paste("uso medio parola nel periodo", (2016-y), "-", (2015)), 
        ylab = paste("uso medio parola nel periodo", (2016-k), "-", (2015-y))
       )
  
  
  abline( -0.1, 1, lty=3, col=2)
  abline( -0.075, 1, lty=3, col=2)
  abline( -0.05, 1, lty=3, col=2)
  abline( -0.025, 1, lty=3, col=2)
  abline( 0, 1, lty=3, col=2)
  abline( 0.1, 1, lty=3, col=2)
  abline( 0.075, 1, lty=3, col=2)
  abline( 0.05, 1, lty=3, col=2)
  abline( 0.025, 1, lty=3, col=2)
  
  
  text(w[,1], w[,2], labels=rownames(w), cex= 0.5, pos=3)
  print(paste("Sono presenti nella tabella", k, "colonne"))
  
  head(w)
  
  f <- x.after / x.before
  head(f)
}


#analisi(TBL.LN, 2, ArticlesByYear$LN)
#analisi(TBL.GSE, 9, ArticlesByYear$GSE)
analisi(TBL.GSC, 5, ArticlesByYear$GSC)

#-------------------------------------------------------------------------------------------
# cose temporanee usate per aggiustare la formula
#-------------------------------------------------------------------------------------------

TBL[is.na(TBL)] <- 0

(rowSums(TBL[,1:6]))
(sum(ArticlesByYear$LN.Utilizzati[(6+1):11]))

plot((rowSums(TBL[,1:6]))/(sum(ArticlesByYear$LN.Utilizzati[(6+1):11])))

ArticlesByYear$LN.Utilizzati
sum(ArticlesByYear$LN.Utilizzati[(6+1):11])

?plot

plot(1:10, main = paste("come cambia l'uso tra il", (2015-2), "e il", (2014-2)))



