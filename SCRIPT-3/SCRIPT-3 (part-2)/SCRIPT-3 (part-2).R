#-------------------------------------------------------------------------------------------
#                  IMPORTAZIONE DELLA TABELLA CON I DATI DA ELABORARE (GSC)
#-------------------------------------------------------------------------------------------

#IMPORTAZIONE DEL CSV
TBL.GSC <- read.csv( "_INPUT/_GSC_body_TABLE_(WORDS)-(2).csv", header=TRUE , sep = ";" )

#Rinomino intestazione colonne
row.names(TBL.GSC) <- TBL.GSC$WORDS

#Pulisco la tabella 
TBL.GSC <- TBL.GSC[,3:8]
head(TBL.GSC)

#-------------------------------------------------------------------------------------------
#                  IMPORTAZIONE DELLA TABELLA CON I DATI DA ELABORARE (GSE)
#-------------------------------------------------------------------------------------------

#IMPORTAZIONE DEL CSV
TBL.GSE <- read.csv( "_INPUT/_GSE_body_TABLE_(WORDS)-(2).csv", header=TRUE , sep = ";" )

#Rinomino intestazione colonne
row.names(TBL.GSE) <- TBL.GSE$WORDS

#Pulisco la tabella 
TBL.GSE <- TBL.GSE[,3:13]
head(TBL.GSE)

#-------------------------------------------------------------------------------------------
#                  IMPORTAZIONE DELLA TABELLA CON I DATI DA ELABORARE (LN)
#-------------------------------------------------------------------------------------------

#IMPORTAZIONE DEL CSV
TBL.LN <- read.csv( "_INPUT/_LN_body_TABLE_(WORDS)-(2).csv", header=TRUE , sep = ";" )

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
# Y ?? Anno che voglio confrontare con il passato
# Z ?? la tabella con il numero totale di articoli usati per ogni anno

analisi <- function(x,y,z) 
  {
  #creo la variabile per il numero di anni calcolando il numero di colonne
  k <- ncol(x) 
  
  #Pulisco la X dagli NA trasformandoli in 0
  x[is.na(x)] <- 0
  
  #individuo il numero di colonna corrispondente all'anno selezionato
  n <- (2016 - y)
  
  if(n > (k -1)){
    
    stop(paste("L'anno che hai scelto non ?? presente nel database selezionato o non ha anni passati con cui essere confrontato. Puoi scegliere anni compresi tra il 2015 e il", (2017 - k)))
    
  } else  if(n == (k - 1)){
    
    x.after <- (x[,n])/(z[n])
    x.before <- (x[,k])/(z[k])
    
  } else if (n < (k -1)) {
    
    x.after <- (x[,n])/((sum(z[n])))
    x.before <- (rowSums(x[,(n+1):k]))/((sum(z[(n+1):k])))
  }
  
  
  w <- cbind(x.before, x.after)
  
  plot(w, 
        main = paste("Come cambia l'uso delle parole nel", y), 
        ylab = paste("uso medio parola nel", y), 
        xlab = paste("uso medio parola nel periodo", (2016-k), "-", (y-1))
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
  
  w
}

#-------------------------------------------------------------------------------------------
# CALCOLO ED ESPORTAZIONE DEI PDF NELLA CARTELLA OUTPUT PER GSC (Lexis Nexis)
#-------------------------------------------------------------------------------------------

#analisi(TBL.LN, 2005, ArticlesByYear$LN)

i = NULL

for (i in 2006:2015)
{
  table <- NULL
  table <- analisi(TBL.LN, i, ArticlesByYear$LN)
  dev.copy(pdf,paste("_OUTPUT/LN-", i,".pdf"), width=16.59, height=11.69)
  dev.off()
  write.csv( table, paste("_OUTPUT/LN-", i,".csv"))
}


#-------------------------------------------------------------------------------------------
# CALCOLO ED ESPORTAZIONE DEI PDF NELLA CARTELLA OUTPUT PER GSE (Google Search)
#-------------------------------------------------------------------------------------------

#analisi(TBL.GSE, 9, ArticlesByYear$GSE)

i = NULL

for (i in 2006:2015)
{
  table <- NULL
  table <- analisi(TBL.GSE, i, ArticlesByYear$GSE)
  dev.copy(pdf,paste("_OUTPUT/GSE-", i,".pdf"), width=16.59, height=11.69)
  dev.off()
  write.csv( table, paste("_OUTPUT/GSE-", i,".csv"))
  
}


#-------------------------------------------------------------------------------------------
# CALCOLO ED ESPORTAZIONE DEI PDF NELLA CARTELLA OUTPUT PER GSC (Google Scolar)
#-------------------------------------------------------------------------------------------

#analisi(TBL.GSC, 2011, ArticlesByYear$GSC)

i = NULL

for (i in 2011:2015)
{
  table <- NULL
  table <- analisi(TBL.GSC, i, ArticlesByYear$GSC)
  dev.copy(pdf,paste("_OUTPUT/GSC-", i,".pdf"), width=16.59, height=11.69)
  dev.off()
  write.csv( table, paste("_OUTPUT/GSC-", i,".csv"))
}


#-------------------------------------------------------------------------------------------
# Cose temporanee usate per aggiustare la formula
#-------------------------------------------------------------------------------------------




TBL[is.na(TBL)] <- 0

(rowSums(TBL[,1:6]))
(sum(ArticlesByYear$LN.Utilizzati[(6+1):11]))

plot((rowSums(TBL[,1:6]))/(sum(ArticlesByYear$LN.Utilizzati[(6+1):11])))

ArticlesByYear$LN.Utilizzati
sum(ArticlesByYear$LN.Utilizzati[(6+1):11])

?plot

plot(1:10, main = paste("come cambia l'uso tra il", (2015-2), "e il", (2014-2)))



