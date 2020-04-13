#MARKET BASKET ANALYSIS
library(arules)
library(arulesViz)

market_basket<-read.transactions(
  
  file = 'market_basket.csv',
  sep = ',',
  quote = "",
  format = 'basket',
  rm.duplicates = TRUE,
  skip = 1
)

summary(market_basket)

#TO VIEW THE FIRST 5 TRANSACTIONS

inspect(head(market_basket,5))

#TO FIND 10 MOST PURCHASED ITEMS

library(RColorBrewer)

itemFrequencyPlot(x = market_basket,
                  topN=10,
                  # support=
                  type= 'absolute',
                  horiz = TRUE,
                  col=brewer.pal(10,'Spectral')
                  )

#BUILDING DIFFERENT RULES USING THE APRIORI ALGORITHM TO FIND RELATIONS

rule1<- market_basket %>% 
  apriori(parameter = list(support=0.005,confidence=0.8)) %>%
  sort(by = 'confidence')

summary(rule1)

# VIEWING TOP 5 RELATIONS IN RULE 1

inspect(head(rule1,5))

# VIEWING BOTTOM 5 RELATIONS IN RULE 1

inspect(tail(rule1,5))

#PLOTTING THE RULES

plot(rule1,engine = "htmlwidget")
plot(rule1, method= "two-key",engine="hmlwidget")
plot(rule1, method= "graph", engine="htmlwidget")

#THESE PLOTS HELP VISUALISE THE RULES AND ARE HELPFUL IN FINDING RELATIONS.

#THUS BY VARYING THE SUPPORT,CONFIDENCE,LIFT VALUES IN THE APRIORI ALGORITHM WE CAN FORM VARIOUS RULES ON THE DATASET AND FIND INTERESTING CONCLUSIONS.


