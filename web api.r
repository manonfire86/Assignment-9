### Load Library

suppressWarnings(library(RJSONIO))


### Read URL with provided key for NYT Books API. Pulling top 5 list of allotted books by published date.

url = "https://api.nytimes.com/svc/books/v3/lists/overview.json?published-date=2017-10-01"
urlkey = paste0(url,'&api-key=','a7649f031d6e4c68a095858d15734692')
booksurl = fromJSON(content = urlkey)


### convert data to dataframe 

booksubcat = booksurl$results$lists

booksdf = as.data.frame(do.call(rbind,booksubcat[[1]]$books))
finaldf = subset(booksdf,select = c("title","author","description","publisher","age_group","price","rank"))


### Final results by Published Dates

print(finaldf)
print(paste("The top 5 best books in October were: ",paste(unlist(finaldf$title),collapse = ", ")))

      