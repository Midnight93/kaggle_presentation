set.seed(crv$seed) 
crs$nobs <- nrow(crs$dataset) # 264 observations 
crs$sample <- crs$train <- sample(nrow(crs$dataset), 0.7*crs$nobs) # 184 observations
crs$validate <- sample(setdiff(seq_len(nrow(crs$dataset)), crs$train), 0.15*crs$nobs) # 39 observations
crs$test <- setdiff(setdiff(seq_len(nrow(crs$dataset)), crs$train), crs$validate) # 41 observations

crs$input <- c("Person.A", "Person.B", "Connection", "Source.s.")

crs$numeric <- NULL

crs$categoric <- c("Person.A", "Person.B", "Connection", "Source.s.")

crs$target  <- NULL
crs$risk    <- NULL
crs$ident   <- NULL
crs$ignore  <- NULL
crs$weights <- NULL

library(mice, quietly=TRUE)
md.pattern(crs$dataset[,c(crs$input, crs$target)])
