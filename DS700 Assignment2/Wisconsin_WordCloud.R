require(twitteR)
require(RCurl)
require(tm)
require(wordcloud)
# Please create your own keys and tokens at apps.twitter.con
consumer_key  <- 'sXlKPefbD9K1x17bioH0wSsNz'
consumer_secret  <- 'JrDdo9VmIwL4sGa01nRtKtZrvt207PcU6j5e1NVqABdH9ueSml'
access_token  <- '392450969-taSU6GLnEdnwdJmnKtjAAsqbvLhg046Tb3o3K866'
access_secret  <- 'p7eIdYjqR8kkSmjEOI6zLZpply54dyEBQxgH8jDinapoA'
setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)
bd_tweets = searchTwitter("Wisconsin", n=1000, lang="en")
bd_text = sapply(bd_tweets, function(x) x$getText())
bd_corpus = Corpus(VectorSource(bd_text))
inspect(bd_corpus[1])
bd_clean  <- tm_map(bd_corpus, removePunctuation)
bd_clean  <- tm_map(bd_clean, removeNumbers)
bd_clean  <- tm_map(bd_clean, stripWhitespace)
wordcloud(bd_clean)
wordcloud(bd_clean, random.order = F, max.words = 25, scale = c(3, 0.5))
