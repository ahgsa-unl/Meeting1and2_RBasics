########################
# R Club meeting three #
########################

# Loading packages
library(ggplot2)

# Setting work directory
setwd("/Users/lmbastos/Dropbox/1 - UNL/AHGSA/R Club/Meeting #01/")

# Reading data in
cotton<- read.csv("data/cotton.csv")

# Checking variable type
str(cotton)

# Changing variable type
cotton$lineage<- factor(cotton$lineage)
cotton$epoca<- factor(cotton$epoca)
str(cotton)


# Plotting
# Using geom_line
ggplot(data=cotton, aes(x=block, y=yield))+
  geom_point()

ggplot(data=cotton, aes(x=block, y=yield))+
  geom_point(color="red")

# Using geom_line and aesthetics
ggplot(data=cotton, aes(x=block, y=yield))+
  geom_point(aes(color=epoca))

ggplot(data=cotton, aes(x=block, y=yield))+
  geom_point(aes(shape=epoca))

ggplot(data=cotton, aes(x=block, y=yield))+
  geom_point(aes(size=epoca)) #best if size variable is numeric

ggplot(data=cotton, aes(x=block, y=yield))+
  geom_point(aes(alpha=epoca))

# Using geom_jitter
ggplot(data=cotton, aes(x=block, y=yield))+
  geom_jitter(aes(color=epoca))

ggplot(data=cotton, aes(x=block, y=yield))+
  geom_jitter(aes(color=epoca), width = .3)

# Using more than one aesthetics at the same time
ggplot(data=cotton, aes(x=block, y=yield))+
  geom_jitter(aes(color=epoca, alpha=site), width = .3)

ggplot(data=cotton, aes(x=block, y=yield))+
  geom_jitter(aes(color=epoca, alpha=site, shape=lineage), width = .3)

# Using facets
ggplot(data=cotton, aes(x=block, y=yield))+
  geom_jitter(aes(color=epoca), width = .3)+
  facet_wrap(~lineage)

ggplot(data=cotton, aes(x=block, y=yield))+
  geom_jitter(aes(color=epoca), width = .3)+
  facet_grid(lineage~.)

ggplot(data=cotton, aes(x=block, y=yield))+
  geom_point(aes(color=epoca))+
  geom_line(aes(color=epoca, group=epoca))+
  facet_grid(lineage~site)

# Exploring themes
ggplot(data=cotton, aes(x=block, y=yield))+
  geom_point(aes(color=epoca))+
  geom_line(aes(color=epoca, group=epoca))+
  facet_grid(lineage~site)+
  theme_light()


# Challenge
ggplot(data=cotton, aes(x=epoca, y=yield))+
  geom_point(aes(color=lineage))+
  geom_line(aes(group=lineage, color=lineage))+
  facet_grid(site~block)+
  theme_linedraw()

