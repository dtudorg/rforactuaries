
library(tidyr)
library(dplyr)

df_untidy <- data.frame(c(60:62),c(0.012,0.022,0.032),c(0.011,0.021,0.031),c(0.010,0.020,0.030))

colnames(df_untidy) <- c("age", c(2000:2002))

#convert to tidy format

df_tidy <- pivot_longer(df_untidy, names_to = "Year", values_to = "q_x", -age, names_ptypes = list(numeric()))

#get a period table in untidy format

df_untidy_2000 = select(df_untidy, c(age, '2000'))

#get the same with tidy data

df_tidy_2000 = filter(df_tidy,Year == 2000)

#simpler to specify the year as a parameter
#maintains year = 2000 as a check

#cohort

#very hard for untidy
#first need to set it up for the looping

df_untidy_yob_1940 <-matrix(0,3,1)

yob <- 1940

start_col_no <- yob - 1940 +2  

for (i in 1:3) {
  
  df_untidy_yob_1940[i] <- df_untidy[i,start_col_no]
  
}

df_untidy_yob_1940 <- data.frame("age" = df_untidy$age, "q_x" = df_untidy_yob_1940 )

#even harder when doing for real
#as the yob changes then we'd need to change i
#to put year in you'd need to convert some column names, again quite a bit of hassle

#hardcoded 3 needs to be specififed correctly

#easy for tidy data

yob <- 1940

df_tidy_yob_1940 = filter(df_tidy,Year - age == yob)
