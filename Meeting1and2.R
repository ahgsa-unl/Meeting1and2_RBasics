######################
# R Club meeting one #
######################

# 3) R terminology
# Object
a<- c(1,4,7,9)
a

# Functions
help()
help("mean")
mean(a)

# Arguments within functions
mean(x=a)

# Package installation
install.packages("ggplot2")

# Loading packages
library(ggplot2)

# 4) Importing a dataset
# Setting working directory
setwd("/Users/lmbastos/Dropbox/1 - UNL/AHGSA/R Club/Meeting #01/data")

# Reading cotton dataset and saving it to object called "cotton"
cotton <- read.csv("cotton.csv") 

# Variable types
summary(cotton)
str(cotton)
class(cotton$lineage)

# Resampling a dataset
# First row only
cotton[1,]

# First column only
cotton[,1]

# Rows 1 through 4 and columns 1 through 3
cotton[1:4,1:3]

# Rows 1 and 4 and columns 1 and 5
cotton[c(1,4),c(1,5)]

# 5) Exploratory statistical analysis
# Histogram
ggplot(data=cotton, aes(x=yield))+
  geom_histogram()

# Density plot
ggplot(data=cotton, aes(x=yield))+
  geom_density()

# Boxplot
ggplot(data=cotton, aes(x=block, y=yield))+
  geom_boxplot()

# Violin plot
ggplot(data=cotton, aes(x=block, y=yield))+
  geom_violin()







