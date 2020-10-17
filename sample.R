library(rstan)
library(here)
library(dplyr)

N = 100
mean = 6
sd = 2
y = rnorm(N, mean, sd)
y
hist(y)
data = list(N=N, y=y)
warmups <- 1000

total_iterations <- 2000

max_treedepth <-  10

n_chains <-  4

n_cores <- 1

adapt_delta <- 0.95

bh_fit <- stan(file = here::here("model.stan"),
               data = data,
               chains = n_chains,
               warmup = warmups,
               iter = total_iterations,
               cores = n_cores,
               refresh = 250,
               control = list(max_treedepth = max_treedepth,
                              adapt_delta = adapt_delta))
class(bh_fit)
summary(bh_fit)$summary %>% head()
