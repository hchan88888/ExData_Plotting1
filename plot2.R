plot2 <- function(){

    data <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
    extract <- data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"),]
    extract$Global_active_power <- as.numeric(as.character(extract$Global_active_power))
    date<- extract[,"Date"]
    time <-extract[,"Time"]
    dateTime <- paste(date,time)
    dateTime <- gsub("1/2/", "01/02/",dateTime)
    dateTime <- gsub("2/2/", "02/02/",dateTime)
    dT <-strptime(dateTime, "%d/%m/%Y %H:%M:%S")
    extract$Date <- dT
    extract$Time <- NULL
    names(extract)[1] <- "dateTime"
    png(file = "plot2.png", width = 480, height = 480, units = "px")
    plot(extract$dateTime,extract$Global_active_power,type="l",xlab="", ylab=" Global Active Power (kilowatts)")
    dev.off()
}