# Juuso Hämäläinen, 05.11.2020 New R-script file for exercise 2

library(dplyr)

# Load data.
lrn14 <- read.table("http://www.helsinki.fi/~kvehkala/JYTmooc/JYTOPKYS3-data.txt", sep="\t", header=TRUE)

# Structure of data.
# Contains 60 questions and apparently 183 answers to them (dtypes = int, chr).
str(lrn14)

# Dimensions of the data = (183,60).
dim(lrn14)

# Questions related to deep, surface and strategic learning
deep_questions <- c("D03", "D11", "D19", "D27", "D07", "D14", "D22", "D30","D06",  "D15", "D23", "D31")
surface_questions <- c("SU02","SU10","SU18","SU26", "SU05","SU13","SU21","SU29","SU08","SU16","SU24","SU32")
strategic_questions <- c("ST01","ST09","ST17","ST25","ST04","ST12","ST20","ST28")

# Select the columns related to deep learning and create column 'deep' by averaging
deep_columns <- select(lrn14, one_of(deep_questions))
lrn14$deep <- rowMeans(deep_columns)

# Select the columns related to surface learning and create column 'surf' by averaging
surface_columns <- select(lrn14, one_of(surface_questions))
lrn14$surf <- rowMeans(surface_columns)

# Select the columns related to strategic learning and create column 'stra' by averaging
strategic_columns <- select(lrn14, one_of(strategic_questions))
lrn14$stra <- rowMeans(strategic_columns)

# Create an analysis dataset with following extracted columns.
keep_columns <- c("gender","Age","Attitude", "deep", "stra", "surf", "Points")

# Select the 'keep_columns' to create a new dataset.
learning2014 <- select(lrn14, one_of(keep_columns))

# Clean up rows where points is greater than zero.
learning2014 <- filter(learning2014, Points > 0)

# see the stucture of the new dataset
str(learning2014)

# Convert to dataframe.
learning2014 <- as.data.frame(learning2014)


# Write to data folder as csv-file.
write.table(learning2014, "C:/Users/Juuso/OneDrive/Työpöytä/TKT/IODS/IODS-project/data/learning2014.csv")

# Read the file from csv.
learning2014 <- read.table("C:/Users/Juuso/OneDrive/Työpöytä/TKT/IODS/IODS-project/data/learning2014.csv", sep = "", header = TRUE)

# Check file.
str(learning2014)
head(learning2014)
