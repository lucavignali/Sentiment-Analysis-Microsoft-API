# Required Packages are httr and jsonlite.
# httr is used to manage the REST interface, jsonlite to convert R data structure to required json for REST
# From
# https://bigdataenthusiast.wordpress.com/2016/10/02/microsoft-cognitive-services-text-analytics-api-in-r/

library(httr)
library(jsonlite)
# Create the function to show the sentiment in a gauge
source("ggGauge.R")

# According to API description, the Request body must include, language, id and text.
# You can POST at the same time multiple sentences
# UNfortunately my language (italian) is not supported.

request_body <- data.frame(
  language = c("en","en"),
  id = c("1","2"),
  text = c(text1(),"This is awesome! Good Job Team! appreciated")
)

# Create the JOSON structure of the Reuqest Body
request_body_json <- toJSON(list(documents = request_body), auto_unbox = TRUE)

# Call the API through the POST call of httr.
# The API requires to specify in the header the type of content, and the KEY
# you have as subscriber of Microsoft Cognitive Services
result <- POST("https://westus.api.cognitive.microsoft.com/text/analytics/v2.0/sentiment",
               body = request_body_json,
               add_headers(.headers = c("Content-Type"="application/json","Ocp-Apim-Subscription-Key"="55a2a604775a48e4917e72c232030c2e")))

# Verify that the status code is 200
result$status_code

# Extract the content from the result.
Output <- content(result)

# Show the Sentiment of the first sentence (for example). 0 Means negative, 1 means positive
sentiment_1 <- Output$documents[[1]]$score

# Show the sentiment
gg.gauge(sentiment_1*100,breaks=c(0,33,66,100))
