#------------------------------------------------------------------------------------------------------------------------------------
# IMPORTARE LE TABELLE PER CIASCUN AMBITO (GSE,GSC,LN) PER CIASCUN ANNO
#------------------------------------------------------------------------------------------------------------------------------------

#--------------------------------------------
# IMPORTAZIONE DELLE TABELLE
#--------------------------------------------

# Google Scolar
for(i in 2012:2015) {
  assign(paste("GSC.", i, sep=""), read.csv( paste("_INPUT/GSC", "- ", i ," .csv", sep=""), header=TRUE , sep = "," ))
}

# Google Search
for(i in 2007:2015) {
  assign(paste("GSE.", i, sep=""), read.csv( paste("_INPUT/GSE", "- ", i ," .csv", sep=""), header=TRUE , sep = "," ))
}

# Lexis Nexis
for(i in 2007:2015) {
  assign(paste("LN.", i, sep=""), read.csv( paste("_INPUT/LN", "- ", i ," .csv", sep=""), header=TRUE , sep = "," ))
}

#--------------------------------------------
# COMBINAZIONE DELLE TABELLE IN UNICO FILE
#--------------------------------------------

#install.packages("plyr")
require(plyr)

#---------
#   GSC
#---------

names(GSC.2012) <- c("WORDS", "GSC.2012.X","GSC.2012.Y")
head(GSC.2012)

names(GSC.2013) <- c("WORDS", "GSC.2013.X","GSC.2013.Y")
head(GSC.2013)

names(GSC.2014) <- c("WORDS", "GSC.2014.X","GSC.2014.Y")
head(GSC.2014)

names(GSC.2015) <- c("WORDS", "GSC.2015.X","GSC.2015.Y")
head(GSC.2015)

GSC <- join_all(list(GSC.2012, GSC.2013, GSC.2014, GSC.2015), by="WORDS", type = 'full')
GSC <- data.frame(row.names = GSC$WORDS, GSC[2:(ncol(GSC))])
write.csv(GSC, "_OUTPUT/GSC_AbsoluteWordsFrequency(2012-2015).csv") 

#trovare il massimo di tutte le colonne
apply(GSC,2,max)

MAX.2012 <- apply(GSC,2,max)[2]
GSC$GSC.2012.X <- (GSC$GSC.2012.X*100)/MAX.2012
GSC$GSC.2012.Y <- (GSC$GSC.2012.Y*100)/MAX.2012

MAX.2013 <- apply(GSC,2,max)[3]
GSC$GSC.2013.X <- (GSC$GSC.2013.X*100)/MAX.2013
GSC$GSC.2013.Y <- (GSC$GSC.2013.Y*100)/MAX.2013

MAX.2014 <- apply(GSC,2,max)[6]
GSC$GSC.2014.X <- (GSC$GSC.2014.X*100)/MAX.2014
GSC$GSC.2014.Y <- (GSC$GSC.2014.Y*100)/MAX.2014

MAX.2015 <- apply(GSC,2,max)[8]
GSC$GSC.2015.X <- (GSC$GSC.2015.X*100)/MAX.2015
GSC$GSC.2015.Y <- (GSC$GSC.2015.Y*100)/MAX.2015

head(GSC)

write.csv(GSE, "_OUTPUT/GSC_PercentageWordsFrequency(2012-2015).csv") 

#---------
#   GSE
#---------


names(GSE.2007) <- c("WORDS", "GSE.2007.X","GSE.2007.Y")
head(GSE.2007)

names(GSE.2008) <- c("WORDS", "GSE.2008.X","GSE.2008.Y")
head(GSE.2008)

names(GSE.2009) <- c("WORDS", "GSE.2009.X","GSE.2009.Y")
head(GSE.2009)

names(GSE.2010) <- c("WORDS", "GSE.2010.X","GSE.2010.Y")
head(GSE.2010)

names(GSE.2011) <- c("WORDS", "GSE.2011.X","GSE.2011.Y")
head(GSE.2011)

names(GSE.2012) <- c("WORDS", "GSE.2012.X","GSE.2012.Y")
head(GSE.2012)

names(GSE.2013) <- c("WORDS", "GSE.2013.X","GSE.2013.Y")
head(GSE.2013)

names(GSE.2014) <- c("WORDS", "GSE.2014.X","GSE.2014.Y")
head(GSE.2014)

names(GSE.2015) <- c("WORDS", "GSE.2015.X","GSE.2015.Y")
head(GSE.2015)

GSE <- join_all(list(GSE.2007, GSE.2008, GSE.2009, GSE.2010, GSE.2011, GSE.2012, GSE.2013, GSE.2014, GSE.2015), by="WORDS", type = 'full')
GSE <- data.frame(row.names = GSE$WORDS, GSE[2:(ncol(GSE))])
write.csv(GSE, "_OUTPUT/GSE_AbsoluteWordsFrequency(2007-2015).csv") 

#trovare il massimo di tutte le colonne
apply(GSE,2,max)

MAX.2007 <- apply(GSE,2,max)[2]
GSE$GSE.2007.X <- (GSE$GSE.2007.X*100)/MAX.2007
GSE$GSE.2007.Y <- (GSE$GSE.2007.Y*100)/MAX.2007

MAX.2008 <- apply(GSE,2,max)[4]
GSE$GSE.2008.X <- (GSE$GSE.2008.X*100)/MAX.2008
GSE$GSE.2008.Y <- (GSE$GSE.2008.Y*100)/MAX.2008

MAX.2009 <- apply(GSE,2,max)[6]
GSE$GSE.2009.X <- (GSE$GSE.2009.X*100)/MAX.2009
GSE$GSE.2009.Y <- (GSE$GSE.2009.Y*100)/MAX.2009

MAX.2010 <- apply(GSE,2,max)[8]
GSE$GSE.2010.X <- (GSE$GSE.2010.X*100)/MAX.2010
GSE$GSE.2010.Y <- (GSE$GSE.2010.Y*100)/MAX.2010


MAX.2011 <- apply(GSE,2,max)[10]
GSE$GSE.2011.X <- (GSE$GSE.2011.X*100)/MAX.2011
GSE$GSE.2011.Y <- (GSE$GSE.2011.Y*100)/MAX.2011

MAX.2012 <- apply(GSE,2,max)[12]
GSE$GSE.2012.X <- (GSE$GSE.2012.X*100)/MAX.2012
GSE$GSE.2012.Y <- (GSE$GSE.2012.Y*100)/MAX.2012

MAX.2013 <- apply(GSE,2,max)[14]
GSE$GSE.2013.X <- (GSE$GSE.2013.X*100)/MAX.2013
GSE$GSE.2013.Y <- (GSE$GSE.2013.Y*100)/MAX.2013

MAX.2014 <- apply(GSE,2,max)[16]
GSE$GSE.2014.X <- (GSE$GSE.2014.X*100)/MAX.2014
GSE$GSE.2014.Y <- (GSE$GSE.2014.Y*100)/MAX.2014

MAX.2015 <- apply(GSE,2,max)[18]
GSE$GSE.2015.X <- (GSE$GSE.2015.X*100)/MAX.2015
GSE$GSE.2015.Y <- (GSE$GSE.2015.Y*100)/MAX.2015

head(GSE)

write.csv(GSE, "_OUTPUT/GSE_PercentageWordsFrequency(2007-2015).csv") 


#---------
#   LN
#---------


names(LN.2007) <- c("WORDS", "LN.2007.X","LN.2007.Y")
head(LN.2007)

names(LN.2008) <- c("WORDS", "LN.2008.X","LN.2008.Y")
head(LN.2008)

names(LN.2009) <- c("WORDS", "LN.2009.X","LN.2009.Y")
head(LN.2009)

names(LN.2010) <- c("WORDS", "LN.2010.X","LN.2010.Y")
head(LN.2010)

names(LN.2011) <- c("WORDS", "LN.2011.X","LN.2011.Y")
head(LN.2011)

names(LN.2012) <- c("WORDS", "LN.2012.X","LN.2012.Y")
head(LN.2012)

names(LN.2013) <- c("WORDS", "LN.2013.X","LN.2013.Y")
head(LN.2013)

names(LN.2014) <- c("WORDS", "LN.2014.X","LN.2014.Y")
head(LN.2014)

names(LN.2015) <- c("WORDS", "LN.2015.X","LN.2015.Y")
head(LN.2015)

LN <- join_all(list(LN.2007, LN.2008, LN.2009, LN.2010, LN.2011, LN.2012, LN.2013, LN.2014, LN.2015), by="WORDS", type = 'full')
LN <- data.frame(row.names = LN$WORDS, LN[2:(ncol(LN))])
write.csv(LN, "_OUTPUT/LN_AbsoluteWordsFrequency(2007-2015).csv") 

#trovare il massimo di tutte le colonne
#apply(LN,2,max)

MAX.2007 <- apply(LN,2,max)[1]
LN$LN.2007.X <- (LN$LN.2007.X*100)/MAX.2007
LN$LN.2007.Y <- (LN$LN.2007.Y*100)/MAX.2007

MAX.2008 <- apply(LN,2,max)[3]
LN$LN.2008.X <- (LN$LN.2008.X*100)/MAX.2008
LN$LN.2008.Y <- (LN$LN.2008.Y*100)/MAX.2008

MAX.2009 <- apply(LN,2,max)[5]
LN$LN.2009.X <- (LN$LN.2009.X*100)/MAX.2009
LN$LN.2009.Y <- (LN$LN.2009.Y*100)/MAX.2009
  
MAX.2010 <- apply(LN,2,max)[7]
LN$LN.2010.X <- (LN$LN.2010.X*100)/MAX.2010
LN$LN.2010.Y <- (LN$LN.2010.Y*100)/MAX.2010


MAX.2011 <- apply(LN,2,max)[10]
LN$LN.2011.X <- (LN$LN.2011.X*100)/MAX.2011
LN$LN.2011.Y <- (LN$LN.2011.Y*100)/MAX.2011

MAX.2012 <- apply(LN,2,max)[11]
LN$LN.2012.X <- (LN$LN.2012.X*100)/MAX.2012
LN$LN.2012.Y <- (LN$LN.2012.Y*100)/MAX.2012

MAX.2013 <- apply(LN,2,max)[13]
LN$LN.2013.X <- (LN$LN.2013.X*100)/MAX.2013
LN$LN.2013.Y <- (LN$LN.2013.Y*100)/MAX.2013

MAX.2014 <- apply(LN,2,max)[15]
LN$LN.2014.X <- (LN$LN.2014.X*100)/MAX.2014
LN$LN.2014.Y <- (LN$LN.2014.Y*100)/MAX.2014
  
MAX.2015 <- apply(LN,2,max)[18]
LN$LN.2015.X <- (LN$LN.2015.X*100)/MAX.2015
LN$LN.2015.Y <- (LN$LN.2015.Y*100)/MAX.2015

head(LN)

write.csv(LN, "_OUTPUT/LN_PercentageWordsFrequency(2007-2015).csv") 


LN2 <- name_rows(LN)
GSE2 <- name_rows(GSE)
GSC2 <- name_rows(GSC)

VOCABOLARIO <- join_all(list(GSC2,GSE2,LN2), by=".rownames", type = 'full')

numeri = seq(0, 0,  length.out = 424 )

zeri <- data.frame( row.names = VOCABOLARIO$.rownames,
            "GSC.2011.X" = numeri,
            "GSC.2011.Y" = numeri,
            "GSC.2010.X" = numeri,
            "GSC.2010.Y" = numeri,
            "GSC.2009.X" = numeri,
            "GSC.2009.Y" = numeri,
            "GSC.2008.X" = numeri,
            "GSC.2008.Y" = numeri,
            "GSC.2007.X" = numeri,
            "GSC.2007.Y" = numeri
          )  
zeri <- name_rows(zeri)
VOCABOLARIO <- join_all(list(zeri, VOCABOLARIO), by=".rownames", type = 'full')
head(VOCABOLARIO)
head(zeri)

VOCABOLARIO <- name_rows(VOCABOLARIO)
VOCABOLARIO[is.na(VOCABOLARIO)] <- 0

write.csv(VOCABOLARIO, "_OUTPUT/VOCABOLARIO-PercentageWordsFrequency(2007-2015).csv")

paste("GSC.", year,".X", sep="")
paste("GSE.", year,".X", sep="")
paste("LN.", year,".X", sep="")

paste("GSC.", year,".Y", sep="")
paste("GSE.", year,".Y", sep="")
paste("LN.", year,".Y", sep="")

VOCABOLARIO["sharing",q]

#--------------------------------------------
# DISEGNO DEL TRIANGOLO
#--------------------------------------------

plot.triangle <- function (word, year,plotscale) 
  
  {
       x <- c(
            paste("GSE.", year,".X", sep=""),
            paste("GSC.", year,".X", sep=""),
            paste("LN.", year,".X", sep="")
           )

  
        y <- c(
              paste("GSE.", year,".Y", sep=""),
              paste("GSC.", year,".Y", sep=""),
              paste("LN.", year,".Y", sep="")
              )
        
        # x <- c("GSE.2014.X","GSC.2014.X","LN.2014.X")
        # y <- c("GSE.2014.Y","GSC.2014.Y","LN.2014.Y")
        
        x <- c(VOCABOLARIO[word,x[1]], VOCABOLARIO[word,x[2]], VOCABOLARIO[word,x[3]])
        y <- c(VOCABOLARIO[word,y[1]], VOCABOLARIO[word,y[2]], VOCABOLARIO[word,y[3]])
        
        
        
        # x <- c(VOCABOLARIO["uber",x[1]], VOCABOLARIO["uber",x[2]], VOCABOLARIO["uber",x[3]])
        # y <- c(VOCABOLARIO["uber",y[1]], VOCABOLARIO["uber",y[2]], VOCABOLARIO["uber",y[3]])

        nomirighe <- c("GSE","GSC", "LN")
        wordtable <- data.frame( row.names = nomirighe, x = x, y = y )
        
        print(wordtable)
        
       
        plot(wordtable, cex=1, col=2, pch=4, main= paste(word, " in ", year, sep=""), ylim=c(0,plotscale), xlim=c(0,plotscale))
        text(wordtable$x, wordtable$y, row.names(wordtable), pos=1)
        segments(x[1],y[1],x[2],y[2])
        segments(x[2],y[2],x[3],y[3])
        segments(x[3],y[3],x[1],y[1])

}

par(mfrow=c(1,9))

# la variabile "l" decide le scale con cui plottare 
for (l in c(100,90,80,70,60,50,40,30,20,10)){
  #
  for (s in 1:424){
    
    SelectedWord <- row.names(VOCABOLARIO)[s]
    
      for (i in 2007:2015){
        plot.triangle(SelectedWord,i,l)
      }
    
    dev.copy(pdf,paste("_OUTPUT/PDF/", l, "/", s,"_",SelectedWord,"_(",l,"x",l,").pdf", sep=""), width=30, height=3.65)
    dev.off()
    
  }
}

#------------------------------------------------
# SALVARE IL TABELLOZZO CON TUTTI I 100 PER RAW
#------------------------------------------------


PALLOZZODACAZZOLEVARE <- c(seq(100,100, length.out = ncol(VOCABOLARIO)))
VOCABOLARIO.RAW <- rbind(PALLOZZODACAZZOLEVARE,VOCABOLARIO)

# Cambia il nome ma non funziona e non ho molta voglia di capire il perch??
# row.names(VOCABOLARIO.RAW[1,]) <- ("PALLOZZO DA LEVARE")
# row.names(VOCABOLARIO.RAW[1,])

write.csv(VOCABOLARIO.RAW , "_OUTPUT/VOCABOLARIO_RAW-PercentageWordsFrequency(2007-2015).csv")
