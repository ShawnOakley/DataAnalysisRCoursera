agecount <- function(age = NULL) {
    homicides <- readLines("homicides.txt")
    len <- length(homicides) 
    if(!age){
        stop(age)
    } else {
        r <- regexec("<dd>(.*), (.*?) years old</dd>", homicides[1:280])
        m <- regmatches(homicides[1:280], r)
        ages_1 <- sapply(m, function(x) x[3])
        r <- regexec("Gender: (.*)<br />[Aa]ge: (.*?) years old</dd>", homicides[281:len])
        m <- regmatches(homicides[281:len], r) # parse to two parts
        ages_2 <- sapply(m, function(x) x[3])
        ages <- as.numeric(c(ages_1, ages_2))
        s <- split(ages, ages) # sorted
        valid_age <- sort(unique(ages))
        if(!age %in% valid_age){
            age_count <- 0
        } else {
            idx <- which(age == valid_age)
            age_count <- length(s[[idx]])
        }
        age_count
    }
}