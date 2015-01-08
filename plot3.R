plot3 <- function(){

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
    extract$Sub_metering_1 <- as.numeric(as.character(extract$Sub_metering_1))
    extract$Sub_metering_2 <- as.numeric(as.character(extract$Sub_metering_2))
    png(file = "plot3.png", width = 480, height = 480, units = "px")
    plot(extract$dateTime,extract$Sub_metering_1,type="l",xlab="", ylab="Energy sub metering", col="black")
    lines(extract$dateTime,extract$Sub_metering_2,type="l", col="red")
    lines(extract$dateTime,extract$Sub_metering_3,type="l", col="blue")
    legend(x="topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=2,
           col=c("black", "red", "blue"))
    dev.off()
}