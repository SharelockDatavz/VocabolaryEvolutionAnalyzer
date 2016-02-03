#-------------------------------------------------------------------------------------------
#                   INSTALLARE E ATTIVARE I PACCHETTI NECESSARI
#-------------------------------------------------------------------------------------------

# install.packages("plyr")
require(plyr)

#//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#                                                     INFLUENCER
#//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


#-------------------------------------------------------------------------------------------
#                       IMPORTAZIONE DEI 15 FILE PER GOOGLE SCOLAR
#-------------------------------------------------------------------------------------------

GSC_2015 <- read.csv( "_INPUT/GSC_body_2015(PYT)_(INFLUENCER).csv", header=TRUE , sep = "," )
GSC_2015 <- data.frame( "influencer" = GSC_2015$Influencer ,"2015" = GSC_2015$Frequency)

GSC_2014 <- read.csv( "_INPUT/GSC_body_2014(PYT)_(INFLUENCER).csv", header=TRUE , sep = "," )
GSC_2014 <- data.frame( "influencer"= GSC_2014$Influencer ,"2014" = GSC_2014$Frequency)

GSC_2013 <- read.csv( "_INPUT/GSC_body_2013(PYT)_(INFLUENCER).csv", header=TRUE , sep = "," )
GSC_2013 <- data.frame( "influencer"= GSC_2013$Influencer ,"2013" = GSC_2013$Frequency)

GSC_2012 <- read.csv( "_INPUT/GSC_body_2012(PYT)_(INFLUENCER).csv", header=TRUE , sep = "," )
GSC_2012 <- data.frame( "influencer"= GSC_2012$Influencer ,"2012" = GSC_2012$Frequency)

GSC_2011 <- read.csv( "_INPUT/GSC_body_2011(PYT)_(INFLUENCER).csv", header=TRUE , sep = "," )
GSC_2011 <- data.frame( "influencer"= GSC_2011$Influencer ,"2011" = GSC_2011$Frequency)

GSC_2010 <- read.csv( "_INPUT/GSC_body_2010(PYT)_(INFLUENCER).csv", header=TRUE , sep = "," )
GSC_2010 <- data.frame( "influencer"= GSC_2010$Influencer ,"2010" = GSC_2010$Frequency)

#GSC_2009 <- read.csv( "_INPUT/GSC_body_2009(PYT)_(INFLUENCER).csv", header=TRUE , sep = "," )
#GSC_2009 <- data.frame( "influencer"= GSC_2009$Influencer ,"2009" = GSC_2009$Frequency)

#GSC_2008 <- read.csv( "_INPUT/GSC_body_2008(PYT)_(INFLUENCER).csv", header=TRUE , sep = "," )
#GSC_2008 <- data.frame( "influencer"= GSC_2008$Influencer ,"2008" = GSC_2008$Frequency)

#GSC_2007 <- read.csv( "_INPUT/GSC_body_2007(PYT)_(INFLUENCER).csv", header=TRUE , sep = "," )
#GSC_2007 <- data.frame( "influencer"= GSC_2007$Influencer ,"2007" = GSC_2007$Frequency)

#GSC_2006 <- read.csv( "_INPUT/GSC_body_2006(PYT)_(INFLUENCER).csv", header=TRUE , sep = "," )
#GSC_2006 <- data.frame( "influencer"= GSC_2006$Influencer ,"2006" = GSC_2006$Frequency)

#GSC_2005 <- read.csv( "_INPUT/GSC_body_2005(PYT)_(INFLUENCER).csv", header=TRUE , sep = "," )
#GSC_2005 <- data.frame( "influencer"= GSC_2005$Influencer ,"2005" = GSC_2005$Frequency)

#-------------------------------------------------------------------------------------------
#                       IMPORTAZIONE DEI 15 FILE PER GOOGLE SEARCH
#-------------------------------------------------------------------------------------------

GSE_2015 <- read.csv( "_INPUT/GSE_body_2015(PYT)_(INFLUENCER).csv", header=TRUE , sep = "," )
GSE_2015 <- data.frame( "influencer" = GSE_2015$Influencer ,"2015" = GSE_2015$Frequency)

GSE_2014 <- read.csv( "_INPUT/GSE_body_2014(PYT)_(INFLUENCER).csv", header=TRUE , sep = "," )
GSE_2014 <- data.frame( "influencer"= GSE_2014$Influencer ,"2014" = GSE_2014$Frequency)

GSE_2013 <- read.csv( "_INPUT/GSE_body_2013(PYT)_(INFLUENCER).csv", header=TRUE , sep = "," )
GSE_2013 <- data.frame( "influencer"= GSE_2013$Influencer ,"2013" = GSE_2013$Frequency)

GSE_2012 <- read.csv( "_INPUT/GSE_body_2012(PYT)_(INFLUENCER).csv", header=TRUE , sep = "," )
GSE_2012 <- data.frame( "influencer"= GSE_2012$Influencer ,"2012" = GSE_2012$Frequency)

GSE_2011 <- read.csv( "_INPUT/GSE_body_2011(PYT)_(INFLUENCER).csv", header=TRUE , sep = "," )
GSE_2011 <- data.frame( "influencer"= GSE_2011$Influencer ,"2011" = GSE_2011$Frequency)

GSE_2010 <- read.csv( "_INPUT/GSE_body_2010(PYT)_(INFLUENCER).csv", header=TRUE , sep = "," )
GSE_2010 <- data.frame( "influencer"= GSE_2010$Influencer ,"2010" = GSE_2010$Frequency)

GSE_2009 <- read.csv( "_INPUT/GSE_body_2009(PYT)_(INFLUENCER).csv", header=TRUE , sep = "," )
GSE_2009 <- data.frame( "influencer"= GSE_2009$Influencer ,"2009" = GSE_2009$Frequency)

GSE_2008 <- read.csv( "_INPUT/GSE_body_2008(PYT)_(INFLUENCER).csv", header=TRUE , sep = "," )
GSE_2008 <- data.frame( "influencer"= GSE_2008$Influencer ,"2008" = GSE_2008$Frequency)

GSE_2007 <- read.csv( "_INPUT/GSE_body_2007(PYT)_(INFLUENCER).csv", header=TRUE , sep = "," )
GSE_2007 <- data.frame( "influencer"= GSE_2007$Influencer ,"2007" = GSE_2007$Frequency)

GSE_2006 <- read.csv( "_INPUT/GSE_body_2006(PYT)_(INFLUENCER).csv", header=TRUE , sep = "," )
GSE_2006 <- data.frame( "influencer"= GSE_2006$Influencer ,"2006" = GSE_2006$Frequency)

GSE_2005 <- read.csv( "_INPUT/GSE_body_2005(PYT)_(INFLUENCER).csv", header=TRUE , sep = "," )
GSE_2005 <- data.frame( "influencer"= GSE_2005$Influencer ,"2005" = GSE_2005$Frequency)

#-------------------------------------------------------------------------------------------
#                       IMPORTAZIONE DEI 15 FILE PER LEXIS NEXIS
#-------------------------------------------------------------------------------------------

LN_2015 <- read.csv( "_INPUT/LN_body_2015(PYT)_(INFLUENCER).csv", header=TRUE , sep = "," )
LN_2015 <- data.frame( "influencer" = LN_2015$Influencer ,"2015" = LN_2015$Frequency)

LN_2014 <- read.csv( "_INPUT/LN_body_2014(PYT)_(INFLUENCER).csv", header=TRUE , sep = "," )
LN_2014 <- data.frame( "influencer"= LN_2014$Influencer ,"2014" = LN_2014$Frequency)

LN_2013 <- read.csv( "_INPUT/LN_body_2013(PYT)_(INFLUENCER).csv", header=TRUE , sep = "," )
LN_2013 <- data.frame( "influencer"= LN_2013$Influencer ,"2013" = LN_2013$Frequency)

LN_2012 <- read.csv( "_INPUT/LN_body_2012(PYT)_(INFLUENCER).csv", header=TRUE , sep = "," )
LN_2012 <- data.frame( "influencer"= LN_2012$Influencer ,"2012" = LN_2012$Frequency)

LN_2011 <- read.csv( "_INPUT/LN_body_2011(PYT)_(INFLUENCER).csv", header=TRUE , sep = "," )
LN_2011 <- data.frame( "influencer"= LN_2011$Influencer ,"2011" = LN_2011$Frequency)

LN_2010 <- read.csv( "_INPUT/LN_body_2010(PYT)_(INFLUENCER).csv", header=TRUE , sep = "," )
LN_2010 <- data.frame( "influencer"= LN_2010$Influencer ,"2010" = LN_2010$Frequency)

LN_2009 <- read.csv( "_INPUT/LN_body_2009(PYT)_(INFLUENCER).csv", header=TRUE , sep = "," )
LN_2009 <- data.frame( "influencer"= LN_2009$Influencer ,"2009" = LN_2009$Frequency)

LN_2008 <- read.csv( "_INPUT/LN_body_2008(PYT)_(INFLUENCER).csv", header=TRUE , sep = "," )
LN_2008 <- data.frame( "influencer"= LN_2008$Influencer ,"2008" = LN_2008$Frequency)

LN_2007 <- read.csv( "_INPUT/LN_body_2007(PYT)_(INFLUENCER).csv", header=TRUE , sep = "," )
LN_2007 <- data.frame( "influencer"= LN_2007$Influencer ,"2007" = LN_2007$Frequency)

LN_2006 <- read.csv( "_INPUT/LN_body_2006(PYT)_(INFLUENCER).csv", header=TRUE , sep = "," )
LN_2006 <- data.frame( "influencer"= LN_2006$Influencer ,"2006" = LN_2006$Frequency)

LN_2005 <- read.csv( "_INPUT/LN_body_2005(PYT)_(INFLUENCER).csv", header=TRUE , sep = "," )
LN_2005 <- data.frame( "influencer"= LN_2005$Influencer ,"2005" = LN_2005$Frequency)


#-------------------------------------------------------------------------------------------
#               COMBINAZIONE DEI FILE E CREAZIONE DELLA TABELLA RIASSUNTIVA
#-------------------------------------------------------------------------------------------

# GOOGLE SCOLAR
GSC_TOT <- join_all(list(GSC_2015, GSC_2014, GSC_2013, GSC_2012, GSC_2011, GSC_2010), by = 'influencer', type = 'full')

# GOOGLE SEARCH
GSE_TOT <- join_all(list(GSE_2015, GSE_2014, GSE_2013, GSE_2012, GSE_2011, GSE_2010, GSE_2009, GSE_2008, GSE_2007, GSE_2006, GSE_2005), by = 'influencer', type = 'full')

# LEXIS NEXIS
LN_TOT <- join_all(list(LN_2015, LN_2014, LN_2013, LN_2012, LN_2011, LN_2010, LN_2009, LN_2008, LN_2007, LN_2006, LN_2005), by = 'influencer', type = 'full')


#-------------------------------------------------------------------------------------------
#                                 ESPORTAZIONE DEL CSV
#-------------------------------------------------------------------------------------------

write.csv(GSC_TOT, "_OUTPUT/_GSC_body_TABLE_(INFLUENCER).csv")
write.csv(GSE_TOT, "_OUTPUT/_GSE_body_TABLE_(INFLUENCER).csv")
write.csv(LN_TOT, "_OUTPUT/_LN_body_TABLE_(INFLUENCER).csv")
