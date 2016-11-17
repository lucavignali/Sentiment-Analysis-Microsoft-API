# Required Packages are httr and jsonlite.
# httr is used to manage the REST interface, jsonlite to convert R data structure to required json for REST
library(httr)
library(jsonlite)

# Let's make another example, using the same approach of the Sentiment Analysis.
# Go to the MS Computer Vision API to understand how the API works.
# There are several options, however we keep the standard options and create the body.

request_body <- data.frame(url = "http://hotelsandomingo.it/fotogallery/buffet4big.jpg")
request_body_json <- gsub("\\[|\\]", "", toJSON(request_body, auto_unbox = "TRUE"))


result <- POST("https://api.projectoxford.ai/vision/v1.0/analyze?visualFeatures=Tags,Description,Faces,Categories",
               body = request_body_json,
               add_headers(.headers = c("Content-Type"="application/json","Ocp-Apim-Subscription-Key"="4ceb27a699ea47a1b6e39e213f2fcb2b")))

# Verify that the status code is 200
result$status_code

Output <- content(result)

Output$description$captions[[1]]$text
