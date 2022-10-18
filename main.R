info_result <- c(92, 8, 236, 14)
right <- info_result[1]
failed <- info_result[2]
# Create the input vectors.
colors <- c("green","red")
months <- c("92%", "96%")
regions <- c("Right","Wrong")

# Create the matrix of the values.
Values <- matrix(info_result, nrow = 2, ncol = 2)
# Create the bar chart
png(file = "ResultsDistribution.png")
barplot(Values, main = "Distribution of results by number of messages", names.arg = months, xlab = "Success Rate",
		font = 1.5, ylab = "Number of messages", col = colors)
# Add the legend to the chart
legend("topleft", regions, cex = 1.3, fill = colors)

dev.off()



# Create the data for the chart
c <- c(92, 8, 236, 14)

# Give the chart file a name
png(file = "F1-Measure.png")

#Precision = TruePositives / (TruePositives + FalsePositives)
#Recall = TruePositives / (TruePositives + FalseNegatives)
Precision1 <- c[1]/(c[1] + c[2])
Recall1 <- c[1]/(c[1] + 0)
Precision2 <- c[3]/(c[3] + c[4])
Recall2 <- c[3]/(c[3] + 0)

#F-Measure = (2 * Precision * Recall) / (Precision + Recall)
F_Measure1 <- (2 * Precision1 * Recall1)/(Precision1  + Recall1)
F_Measure2 <- (2 * Precision2 * Recall2)/(Precision2 + Recall2)
F_Measure1 <- round(F_Measure1, 3)
F_Measure2 <- round(F_Measure2, 3)

H <- c(F_Measure1, F_Measure2)
M <- c(c[1] + c[2], c[3] + c[4])

F1 <- as.character(F_Measure1)
F2 <- as.character(F_Measure2)
# Plot the bar chart
barplot(H,names.arg=M,xlab="Number of messages",ylab="F1-measure",col=c("blue", "orange"),
		main="F1-Meaure (a combination of recall and precision)",border="brown", ylim=c(0, 1.2))
legend("topright", c(F1, F2), cex = 1.3, fill = c("blue", "orange"))
# Save the file
dev.off()