rm(list=ls()) #removes all variables stores previously
library(Hmisc)

data <- read.csv('C:/Users/Jai Pratap Singh/OneDrive/Desktop/Covid_R/COVID19_line_list_data.csv')
describe(data)  # Hmisc command

data$death_dummy <- as.integer(data$death != 0)

#death rate
sum(data$death_dummy) / nrow(data)

dead = subset(data, death_dummy == 1)
alive = subset(data, death_dummy == 0)
mean(dead$age, na.rm = TRUE)
mean(alive$age, na.rm = TRUE)

# is this statistically significant
t.test(alive$age, dead$age, alternative="two.sided", conf.level = 0.91 )
# normally, if p-value < 0.05, we reject null hypothesis
# here, p-value = 0(almost), so we reject null hypothesis


men = subset(data, gender == "male")
women = subset(data, gender == "female")
mean(men$death_dummy, na.rm = TRUE)
mean(women$death_dummy, na.rm = TRUE)
t.test(men$death_dummy,women$death_dummy, alternative="two.sided", conf.level = 0.91 )
# p-value= 0.002<0.05, so this is statistically significant