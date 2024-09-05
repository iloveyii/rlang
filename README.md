# Install

- The best option is to use docker

## Run

- Run docker: `docker-compose up -d`
- SSH to container to run R console: `docker exec -ti dat246_rlang /bin/bash`
- Run R statement from cmdline: `Rscript -e 'sessionInfo()'`
- Run R script from cmd line (inside directory scripts/): `Rscript first.r`
  - Hint: copy src/first.r and src/second.r to directory scripts/
- Run R console: `R`
  
## Dockerize

- CD to directory scripts : `cd /Users/ali/projects/uni/dat246/rlang`
- `docker run -ti -v $(pwd)/scripts:/app/scripts -w /app/scripts r-base /bin/bash`
- `apt update`
- `apt install software-properties-common -y`
- `apt install gpg-agent -y`
- `apt install python3-launchpadlib -y`
- `add-apt-repository ppa:marutter/rrutter4.0 -y`
- `add-apt-repository ppa:c2d4u.team/c2d4u4.0+ -y`
- `apt install libcurl4-openssl-dev -y`
- `apt install r-base r-base-dev libcurl4-openssl-dev -y`
- `apt install libxml2-dev -y`
- `apt install libharfbuzz-dev libfribidi-dev -y`
- `apt -y install libfontconfig1-dev -y`
- `apt install cmake -y`
- `apt install libgit2-dev libfreetype6-dev libpng-dev libtiff5-dev libjpeg-dev -y`
- `apt install r-cran-rstan -y`

- R
  
```R
  Sys.setenv(DOWNLOAD_STATIC_LIBV8 = 1)
  install.packages("rstan")
```

```R
dotR <- file.path(Sys.getenv("HOME"), ".R")
if (!file.exists(dotR)) dir.create(dotR)
M <- file.path(dotR, "Makevars")
if (!file.exists(M)) file.create(M)
cat("\nCXX17FLAGS=-O3 -march=native -mtune=native -fPIC",
    "CXX17=g++", # or clang++ but you may need a version postfix
    file = M, sep = "\n", append = TRUE)
```

```R
Sys.setenv(DOWNLOAD_STATIC_LIBV8 = 1)
install.packages("V8")
```

- `install.packages("xml2", dependencies = TRUE)` 
- `install.packages(c("coda","mvtnorm","devtools","loo","dagitty","shape"))`
- `install.packages('BH')`
- `devtools::install_github("stan-dev/cmdstanr")` -> 1
- `cmdstanr::install_cmdstan()`
- `devtools::install_github("rmcelreath/rethinking")`
- `library(rethinking)`
- `library(rstan)`  
- `sessionInfo()`
- <https://github.com/stan-dev/rstan/wiki/RStan-Getting-Started#how-to-use-rstan>
- <https://www.datamentor.io/r-programming/saving-plot>

## Troubleshooting

- Error: List directory /var/lib/apt/lists/partial is missing. - Acquire (2: No such file or directory)
  - mkdir -p /var/lib/apt/lists/partial
- Error: install.packages('BH')
  - Install packege in R: install.packages('BH')
  - Relaunch R
