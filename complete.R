complete <- function(directory, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'id' is an integer vector indicating 
        # the monitor ID numbers to be used
        
        ## Return a data frame of the form:
        ## id nobs
        ## 1  117
        ## 2  1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the
        ## number of complete cases
        directory <- as.character(directory[1])
        data_list <- list()
        countList <- array()
        index <- array()
        for (i in seq_along(id)) {
                # print(id[i])
                file_number <- as.character(id[i])
                # print(file_number)
                while (nchar(as.character(file_number))<3) {
                        file_number <- paste('0', as.character(file_number), sep='')
                        # print(file_number)
                }
                file_name <- paste(file_number, '.csv', sep='')
                route <- paste(directory, file_name, sep='/')
                dataList = read.csv(route)
                countList[i] = (nrow(dataList[complete.cases(dataList),]))
                index[i] = id[i]
        }
        frame = data.frame(index,countList)
        colnames(frame) <- c("id", "nobs")
        return(frame)

}