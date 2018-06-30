
# loading required libraries
library(data.table)
library(dplyr)
library(plyr)

# Loading train data set
subj.train <- read.table('./UCI HAR Dataset/train/subject_train.txt',header = FALSE, sep = ' ')
acc.train <- read.table('./UCI HAR Dataset/train/y_train.txt', header = FALSE, sep = ' ')
x.train <- read.table('./UCI HAR Dataset/train/X_train.txt')

cat <- read.table('./UCI HAR Dataset/features.txt', header = FALSE, sep = ' ')
cat <- as.character(cat[,2])

train <-  data.frame(subj.train, acc.train, x.train)
names(train) <- c(c('subj', 'acc'), cat)

# Loading test dataset
subj.test <- read.table('./UCI HAR Dataset/test/subject_test.txt', header = FALSE, sep = ' ')
acc.test <- read.table('./UCI HAR Dataset/test/y_test.txt', header = FALSE, sep = ' ')
x.test <- read.table('./UCI HAR Dataset/test/X_test.txt')

test <-  data.frame(subj.test, acc.test, x.test)
names(test) <- c(c('subj', 'acc'), cat)

names.acc <- read.table('./UCI HAR Dataset/activity_labels.txt', header = FALSE)[,2]

# Merging test and train data set
merged.df <- rbind(train, test)

# Extracts only the measurements on the mean and standard deviation for each measurement.
new.df <- merged.df[,c(1,2,grep('mean|std', cat))]

# Use descriptive activity names to name the activities in the data set
new.df$acc <- names.acc[new.df$acc]

#Appropriately labels the data set with descriptive variable names.

names(new.df)

names(new.df) <- gsub("Acc", "acceleration.", names(new.df))
names(new.df) <- gsub("Gyro", "gyro.reading.", names(new.df))
names(new.df) <- gsub("Mag", "magnitude.", names(new.df))
names(new.df) <- gsub("^t", "time.domain.", names(new.df))
names(new.df) <- gsub("^f", "frequency.domain.", names(new.df))


# Creating a second tidy data set

result.df <- aggregate(new.df, by = list(acc = new.df$acc, subj = new.df$subj),FUN = mean)
write.table(x = result.df, file = "result.df.txt", row.names = F)
