library(dslabs) #1       
data(murders) #2
view(murders) #3
head(murders) #4
library(dplyr) #5
library(ggplot2) #6

ds_theme_set()    #7
# sets a ggplot2 theme used throughout the data science labs
install.packages("ggthemes")   #8

library(ggthemes)     #9

p + theme_economist()      #10
#A theme that approximates the style of The Economist

install.packages("ggrepel")    #11
#Automatically Position Non-Overlapping Text Labels with 'ggplot2'
#Labels repel away from each other and away from the data points
library(ggrepel)     #12

# *****13*****
r <- murders %>% 
  summarize(rate = sum(total)/ sum(population)*10^6) %>%
  pull(rate)
murders %>% ggplot(aes(population/10^6, total, label = abb)) + 
  geom_abline(intercept = log10(r), lty = 2, color = "darkgrey") +
  geom_point(aes(col=region), size = 3) +
  geom_text_repel() +
  scale_x_log10() +
  scale_y_log10() +
  xlab("Populations in mllions (log scale)") +
  ylab("Total number of murders (log scale)") +
  ggtitle("US Gun Murders in 2010") +
  scale_color_discrete(name = "Region") +
  theme_economist()

##completed