count <- function(cause = NULL) {
## Check that "cause" is non-NULL; else throw error
## Check that specific "cause" is allowed; else throw error
## Read "homicides.txt" data file
## Extract causes of death
## Return integer containing count of homicides for that cause


	possible_causes <- c('asphyxiation', 'blunt force', 'other', 'shooting', 'stabbing', 'unknown')

	if (!(cause %in% possible_causes)) {
	stop("invalid cause")
	}
	homicides <- readLines("homicides.txt")


	# homicides[,3] = tolower(homicides[,3]) 
	homicides
	if (cause == 'asphyxiation'){
		return(length(grep("[cC]ause: [Aa]sphyxiation", homicides)))
	}
	if (cause == 'blunt force'){
		return(length(grep("[cC]ause: [Bb]lunt [Ff]orce", homicides)))
	}
	if (cause == 'other'){
		return(length(grep("[cC]ause: [Oo]ther", homicides)))
	}
	if (cause == 'shooting'){
		return(length(grep("[cC]ause: [Ss]hooting", homicides)))
	}
	if (cause == 'stabbing'){
		return(length(grep("[cC]ause: [Ss]tabbing", homicides)))
	}
	if (cause == 'unknown'){
		return(length(grep("[cC]ause: [Uu]nknown", homicides)))
	}	
	
}

# grep('shooting', count())
# print (count())

# inputFile <- "/home/jal/myFile.txt"
# con  <- file(inputFile, open = "r")

# dataList <- list()
# ecdfList <- list()

# while (length(oneLine <- readLines(con, n = 1, warn = FALSE)) > 0) {
#     myVector <- (strsplit(oneLine, " "))
#     myVector <- list(as.numeric(myVector[[1]]))
#     dataList <- c(dataList,myVector)

#     myEcdf <- ecdf(myVector[[1]])
#     ecdfList <- c(ecdfList,myEcdf)

#   } 

# close(con)

# https://stackoverflow.com/questions/4106764/what-is-a-good-way-to-read-line-by-line-in-r