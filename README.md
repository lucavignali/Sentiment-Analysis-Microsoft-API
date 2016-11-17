# Sentiment-Analysis-Microsoft-API plus Cpmuter Vision example
Exercise to use the Cognitive Service API of Microsoft.

## How it works
You can use the text1 function to get the sentence you want to anlyze. In this case it is simply
embedded within the function:

_Pierre saw that there was a conspiracy against him and that they wanted to reunite him with his wife, and in the mood he then was, this was not even unpleasant to him._

Run the Sentiment_MS_REST_API.R, which creates the required POST call to the Microsoft Azure Cognitive Services and obtain the following gauge. Score ranges from 0%, which is very negative, to 100%, which is very positive.

![Sentiment 0%: Bad, 100%: Good](https://github.com/lucavignali/Sentiment-Analysis-Microsoft-API/blob/master/Rplot.png)

## Computer vision example
I have extended the approach applied in the Sentiment Analysis, to the Computer Vision API of MS Cngnitive Services. I was very impressed by the way the Cognitive engine works well. Try picture the picture available [here](http://hotelsandomingo.it/fotogallery/).

For example if we analyze the following picture

![Food](https://github.com/lucavignali/Sentiment-Analysis-Microsoft-API/blob/master/buffet4big.jpg)

The nice results are grouped in Tags, Description with the associated level of confidence as follow:

__Tags__

1. Person (99%)
2. Food (98%)
3. Indoor (96%)

__Description__

1. a woman that is cooking some food on a table (31%)

I like the desxcription very much!
