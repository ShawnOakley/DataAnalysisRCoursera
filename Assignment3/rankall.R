# outcome <- read.csv('outcome-of-care-measures.csv', colClasses = 'character')
# head(outcome)

# # outcome[, 11] <- as.numeric(outcome[, 11])

# # hist(outcome[, 11])
# # title(main="Heart Attack 30-day Death Rate")
# # title(xlab='30-day Death Rate')
# # title(ylab='Frequency')


# # PART 2

# # If you haven’t already, read in the outcome-of-care-measures.csv dataset using the code specified above.
# # 1. Identify which columns of the data frame contain the 30-day death
# # rate from heart attack, heart failure, and pneumonia.

# # 30 day heart attack val: 
# # hist(outcome[, 11])
# # # 30 day heart failure val: 
# # hist(outcome[, 17])
# # # 30 day pneumonia val: 
# # hist(outcome[, 23])
# # 2. Coerce these columns to be numeric using the as.numeric function as above. You may receive warnings
# # about NAs but that is okay.
# outcome[, 11] <- as.numeric(outcome[, 11])
# outcome[, 17] <- as.numeric(outcome[, 17])
# outcome[, 23] <- as.numeric(outcome[, 23])

# oc11 <- range(outcome[,11],na.rm=TRUE)
# oc17 <- range(outcome[,17],na.rm=TRUE)
# oc23 <- range(outcome[,23],na.rm=TRUE)
# ocmin <- min(oc11,oc17,oc23)
# ocmax <- max(oc11,oc17,oc23)
# # 3. Make histograms of the death rates for each outcome and 
# # put the histograms on the same plot window.
# # This can be done by running par(mfrow = c(3, 1)) before calling 
# # hist. This sets the plot window
# par(mfrow = c(3, 1))

# # to have 3 rows and 1 column.
# # 4. For each plot (there should be three plots, one for each outcome) make sure the x-axis label is “30-day
# # Death Rate”.
# # 5. For each plot, set the title of the plot to be the outcome (i.e. heart attack, heart failure, or pneumonia).
# # 6. Each time you call hist, a new plot is constructed using the data to be plotted. However, this makes it
# # difficult to compare histograms across outcomes. Set all of the histograms to have the same numerical
# # range on the x-axis by using t
# hist(outcome[, 11], main="Heart Attack 30-day Death Rate", xlab='30-day Death Rate', ylab='Frequency',  xlim=c(ocmin,ocmax))
# hist(outcome[, 17], main="Heart Failure 30-day Death Rate", xlab='30-day Death Rate', ylab='Frequency', xlim=c(ocmin,ocmax))
# hist(outcome[, 23], main="Pneumonia 30-day Death Rate", xlab='30-day Death Rate', ylab='Frequency', xlim=c(ocmin,ocmax))


# Problem 3: Plot 30-day death rates by state
# outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")

# outcome[, 11] <- as.numeric(outcome[, 11])

# # Subset the original dataset and exclude states that contain less than 20 hospitals. Name this new subsetted
# # dataset outcome2.
# table <- table(outcome$State)
# outcome2 <- subset(outcome, table[State] >= 20) 
# death <- outcome2[, 11]
# state <- outcome2$State
# par(las=2)
# boxplot(death ~ state, ylab='30-day Death Rate', main='Heart Attack 30-day Death Rate by State')

# Problem 4: Plot 30-day death rates and numbers of patients
# outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")

# hospital <- read.csv("hospital-data.csv", colClasses = "character")

# library(lattice)

# outcome.hospital <- merge(outcome, hospital, by ="Provider.Number")

# death <- as.numeric(outcome.hospital[,11])
# npatient <- as.numeric(outcome.hospital[,15])
# owner <- factor(outcome.hospital$Hospital.Ownership)

# xyplot(death~npatient | owner, xlab="Number of Patients Seen", main="Heart Attack 30-day Death Rate by Ownership", ylab="30-day Death Rate")

# xyplot(death ~ npatient | owner, 
#        panel = function(x, y, ...){
#          panel.xyplot(npatient, death, ...)
#          panel.lmline(npatient, death)
#        })
# panel.lmline(npatient, death)

# Problem 5: 
# Write a function called best that take two arguments: 
# the 2-character abbreviated name of a state and an
# outcome name. The function reads the outcome-of-care-measures.csv 
#file and returns a character vector with the name of 
#the hospital that has the best (i.e. lowest) 30-day mortality 
#for the specified outcome in that state.

# best <- function(state, outcome) {
# 	## read outcome data
# 	possible_outcomes <- c('heart attack', 'heart failure', 'pneumonia')
# 	hospital <- read.csv("hospital-data.csv", colClasses = "character")
# 	outcomes <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
# 	outcomes.hospital <- merge(outcomes, hospital, by ="Hospital.Name")
# 	 ## check that state and outcome are valid
# 	if (!(state %in% unique(hospital$State))) {
# 	stop("invalid state")
# 	}
	
# 	if (!(outcome %in% possible_outcomes)) {
# 	stop("invalid outcome")
# 	}

# 	state_hospitals <- subset(outcomes.hospital, outcomes.hospital$State.y == state)

# 	if (outcome == 'heart attack'){
# 		best_amount <- min(as.numeric(state_hospitals[,11]), na.rm = TRUE)
# 		target_hospitals <- subset(state_hospitals, as.numeric(state_hospitals[,11]) == best_amount) 
# 	}
	
# 	if (outcome == 'heart failure'){
# 		best_amount <- min(as.numeric(state_hospitals[,17]), na.rm = TRUE)
# 		target_hospitals <- subset(state_hospitals, as.numeric(state_hospitals[,17]) == best_amount) 
# 	}
	
# 	if (outcome == 'pneumonia'){
# 		best_amount <- min(as.numeric(state_hospitals[,23]), na.rm = TRUE)
# 		target_hospitals <- subset(state_hospitals, as.numeric(state_hospitals[,23]) == best_amount) 
# 	}
# 	target_hospital_names <- target_hospitals$Hospital.Name
# 	return(head(sort(target_hospital_names)))
# }

# rankhospital <- function(state, outcome, rank='best') {

# 	if (rank=='best'){
# 		rank<-1
# 	}

# 	## read outcome data
# 	possible_outcomes <- c('heart attack', 'heart failure', 'pneumonia')
# 	hospital <- read.csv("hospital-data.csv", colClasses = "character")
# 	outcomes <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
# 	outcomes.hospital <- merge(outcomes, hospital, by ="Hospital.Name")
# 	 ## check that state and outcome are valid
# 	if (!(state %in% unique(hospital$State))) {
# 	stop("invalid state")
# 	}
	
# 	if (!(outcome %in% possible_outcomes)) {
# 	stop("invalid outcome")
# 	}

# 	state_hospitals <- subset(outcomes.hospital, outcomes.hospital$State.y == state)

# 	if (outcome == 'heart attack'){
# 		amounts <- as.numeric(state_hospitals[,11])
# 		amounts <- sort(unique(amounts))
# 		if (rank=='worst'){
# 			rank<-length(amounts)
# 		}
# 		amount <- amounts[rank]
# 		target_hospitals <- subset(state_hospitals, as.numeric(state_hospitals[,11]) == amount) 
# 	}
	
# 	if (outcome == 'heart failure'){
# 		amounts <- as.numeric(state_hospitals[,17])
# 		amounts <- sort(unique(amounts))
# 		if (rank=='worst'){
# 			rank<-length(amounts)
# 		}
# 		amount <- amounts[rank]
# 		target_hospitals <- subset(state_hospitals, as.numeric(state_hospitals[,17]) == amount) 
# 	}
	
# 	if (outcome == 'pneumonia'){
# 		amounts <- as.numeric(state_hospitals[,23])
# 		amounts <- sort(unique(amounts))
# 		if (rank=='worst'){
# 			rank<-length(amounts)
# 		}
# 		amount <- amounts[rank]
# 		target_hospitals <- subset(state_hospitals, as.numeric(state_hospitals[,23]) == amount) 
# 	}
# 	target_hospital_names <- target_hospitals$Hospital.Name
# 	result <- head(sort(target_hospital_names))

# 	if (identical(result, character(0))){
# 		return(NA)
# 	}

# 	return(result)
# }

rankall <- function(outcome, rank='best') {

	if (rank=='best'){
		rank<-1
	}

	## read outcome data
	possible_outcomes <- c('heart attack', 'heart failure', 'pneumonia')
	hospitals <- read.csv("hospital-data.csv", colClasses = "character")
	outcomes <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
	outcomes.hospitals <- merge(outcomes, hospital, by ="Hospital.Name")
	 ## check that outcome is valid
	states <- unique((hospitals$State))

	output <- c()
	
	grabByState <- function(state, index, amount){
		state_hospitals <- subset(outcomes.hospital, outcomes.hospital$State.y == state)
		target_hospitals <- subset(outcomes.hospitals, as.numeric(state_hospitals[,index]) == amount) 
		target_hospital_names <- target_hospitals$Hospital.Name
		result <- head(sort(target_hospital_names))

	}

	if (!(outcome %in% possible_outcomes)) {
	stop("invalid outcome")
	}

	if (outcome == 'heart attack'){
		amounts <- as.numeric(outcomes.hospitals[,11])
		amounts <- sort(unique(amounts))
		if (rank=='worst'){
			rank<-length(amounts)
		}
		amount <- amounts[rank]
		target_hospitals <- subset(outcomes.hospitals, as.numeric(outcomes.hospitals[,11]) == amount) 
	}
	
	if (outcome == 'heart failure'){
		amounts <- as.numeric(outcomes.hospitals[,17])
		amounts <- sort(unique(amounts))
		if (rank=='worst'){
			rank<-length(amounts)
		}
		amount <- amounts[rank]
		target_hospitals <- subset(outcomes.hospitals, as.numeric(outcomes.hospitals[,17]) == amount) 
	}
	
	if (outcome == 'pneumonia'){
		amounts <- as.numeric(outcomes.hospitals[,23])
		amounts <- sort(unique(amounts))
		if (rank=='worst'){
			rank<-length(amounts)
		}
		amount <- amounts[rank]
		target_hospitals <- subset(outcomes.hospitals, as.numeric(outcomes.hospitals[,23]) == amount) 
	}
	target_hospital_names <- target_hospitals$Hospital.Name
	result <- head(sort(target_hospital_names))

	if (identical(result, character(0))){
		return(NA)
	}

	return(c(target_hospitals$State, target_hospitals$Hospital.Name))
}

# rankall <- function(outcome, num = "best" ){
#   data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
#   state <- data$State
#   state <- sort(unique(state))

#   hospital <- rep("", length(state))
  
#   for (i in 1:length(state)) {
#     statedata<- data[data$State==state[i],]
#     if (outcome == 'heart attack') {
#       death <- as.numeric(statedata[,11])
#     } else if (outcome == 'heart failure') {
#       death <- as.numeric(statedata[,17])
#     } else if (outcome == 'pneumonia') {
#       death <- as.numeric(statedata[,23])
#     } else {
#       stop("invalid outcome")
#     }

#     a <- rank(death, na.last=NA)
  
#     if (num=="best") {
#       r <- 1
#     } else if (num =="worst") {
#       r <- length(a)
#     } else if (num <= length(a) ) {
#       r <- num
#     } else {
#       r <- NA
#     }

#     if (is.na(r)) {
#       hospital[i] <- NA
#     } else {
#       hospital[i] <- statedata$Hospital.Name[order(death, statedata$Hospital.Name)[r]]
#     }

#   }

#   return(data.frame(hospital=hospital, state=state))
# }
