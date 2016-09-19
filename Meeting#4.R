#######################
# R Club meeting four #
#######################

# If you do not have these packages installed, install them
install.packages("ggplot2", dependencies = TRUE)
install.packages("reshape2", dependencies = TRUE)
install.packages("agridat", dependencies = TRUE)

# Load soybean data
library(agridat)
data(australia.soybean)

# Examine the data, seeing the overall structure 
# Note the "wide" data format, where each trait gets its own column
head(australia.soybean)

# We can use levels() to see what are the factor levels for genotypes and location
levels(australia.soybean$gen)
levels(australia.soybean$loc)

# Notice that levels() does not work on year due to year being an integer class
# unique() works, however
levels(australia.soybean$year)
class(australia.soybean$year)
unique(australia.soybean$year)

# Subset the data to 1970 only
soy <- subset(australia.soybean, year == 1970)
print(soy)

# Subset the data to 1970 and Lawes location
soy <- subset(australia.soybean, year == 1970 & loc == "Lawes")
print(soy)

# We want to rescale the data because different traits uses different units
# Let's see how scale() rescales the data.
# In this case, by default for each column it centers the data around the column mean
# and normalizes by standard deviation as well
head(soy)
scale(soy[,5:10])

# We'll create a copy of the soybean data to use for transformation
soy_copy <- soy

# Now replace the data (columns 5-10) in the copy with scaled data
soy_copy[,5:10] <- scale(soy[,5:10])
head(soy_copy)

# Convert this to matrix for for heatmap() function, and create heatmap
soy_mat <- as.matrix(soy_copy[,5:10])
rownames(soy_mat) <- soy_copy$gen
head(soy_mat)
heatmap(soy_mat)
# note that there are many available options for heatmap(), type ?heatmap to see the help file

# Switching to ggplot
# Convert data to "long" format for ggplot using reshape2 package
library(reshape2)
soy_long <- melt(data = soy_copy, id.vars = c("env", "loc", "year", "gen"))
print(soy_long)
# note that now each trait value for each genotype gets its own row,
# and the trait each value is referring to is coded on the new column "variable"

# Make a heatmap with ggplot
library(ggplot2)

ggplot(soy_long, aes(x = variable, y = gen)) + 
  geom_tile(aes(fill = value)) +
  scale_fill_gradient2(low = "red", mid = "white", high = "blue") +
  labs(x = "\nTrait", y = "Genotype\n") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Change order of traits
levels(soy_long$variable)
soy_long$variable <- factor(soy_long$variable, 
                            levels(soy_long$variable)[c(1,5,6,4,2,3)])

ggplot(soy_long, aes(x = variable, y = gen)) + 
  geom_tile(aes(fill = value)) +
  scale_fill_gradient2(low = "red", mid = "white", high = "blue") +
  labs(x = "\nTrait", y = "Genotype\n") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Example using the full data set
soy2 <- australia.soybean
soy2[,5:10] <- scale(soy2[,5:10])
soy_long2 <- melt(data = soy2, id.vars = c("env", "loc", "year", "gen"))
ggplot(soy_long2, aes(x = variable, y = gen)) + 
  geom_tile(aes(fill = value)) +
  facet_grid(year ~ loc) +
  scale_fill_gradient2(low = "red", mid = "white", high = "blue") +
  labs(x = "\nTrait", y = "Genotype\n") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
