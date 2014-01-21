corr <- function(directory, threshold = 0) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0

        ## Return a numeric vector of correlations

        directory <- as.character(directory[1])
        file_list <- list.files(directory)

        i = 0
        output = c()

        for (file in file_list) {
        	route <- paste(directory, file, sep='/')
        	dataList <- read.csv(route)
        	completeData <- dataList[complete.cases(dataList),]
        	if (nrow(completeData) >= threshold) {
        		i = i + 1
        		output[i] = cor(completeData['sulfate'],completeData['nitrate'])
        	}
        }

        return(output)

}