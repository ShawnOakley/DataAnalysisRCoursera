getmonitor <- function(id, directory, summarize = FALSE) {
        ## 'id' is a vector of length 1 indicating the monitor ID
        ## number. The user can specify 'id' as either an integer, a
        ## character, or a numeric.
        
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'summarize' is a logical indicating whether a summary of
        ## the data should be printed to the console; the default is
        ## FALSE
        
        filen <- as.character(id[1])
        while (nchar(filen)<3) {
        	filen <- paste('0', filen, sep='')
        }
        filename <- paste(filen, '.csv', sep='')
        print(filename)
        directory <- as.character(directory[1])
        print(directory)
        route <- paste(directory, filename, sep='/')
        print(route)
        dat <- read.csv(route)
        # print(dat)
        # print(class(dat))
        if (summarize==TRUE) {
        	print(summary(dat))
        }
        return(dat)
}