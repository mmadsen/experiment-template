library(dplyr)

# read in the raw CSV exports from MongoDB, one for each experiment
foo <- read.csv("~/local-research/foo.csv")

# combine the experiments into a single data set
s1 <- tbl_df(foo)
data <- rbind(s1)

# do other calculations etc


# save binary versions of both
save(data, file="~/local-research/foo.rda")
