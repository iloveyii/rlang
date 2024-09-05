FROM r-base:latest

RUN apt update 
RUN apt install software-properties-common -y 
RUN apt install gpg-agent -y 
RUN apt install python3-launchpadlib -y 
RUN add-apt-repository ppa:marutter/rrutter4.0 -y 
RUN add-apt-repository ppa:c2d4u.team/c2d4u4.0+ -y 
RUN apt install libcurl4-openssl-dev -y 
RUN apt install r-base r-base-dev libcurl4-openssl-dev -y 
RUN apt install libxml2-dev -y 
RUN apt install libharfbuzz-dev libfribidi-dev -y 
RUN apt -y install libfontconfig1-dev -y 
RUN apt install cmake -y 
RUN apt install libgit2-dev libfreetype6-dev libpng-dev libtiff5-dev libjpeg-dev -y 
RUN apt install r-cran-rstan -y 


RUN Rscript -e 'Sys.setenv(DOWNLOAD_STATIC_LIBV8 = 1); install.packages("rstan");'

RUN Rscript -e 'dotR <- file.path(Sys.getenv("HOME"), ".R"); if (!file.exists(dotR)) dir.create(dotR); M <- file.path(dotR, "Makevars"); if (!file.exists(M)) file.create(M); cat("\nCXX17FLAGS=-O3 -march=native -mtune=native -fPIC", "CXX17=g++", file = M, sep = "\n", append = TRUE);'

RUN Rscript -e 'Sys.setenv(DOWNLOAD_STATIC_LIBV8 = 1); install.packages("V8");'

RUN Rscript -e 'install.packages("xml2", dependencies = TRUE)'
RUN Rscript -e 'install.packages(c("coda","mvtnorm","devtools","loo","dagitty","shape"))'
RUN Rscript -e 'install.packages("BH")'

RUN Rscript -e 'devtools::install_github("stan-dev/cmdstanr")' && echo 1

RUN Rscript -e 'cmdstanr::install_cmdstan()' 

RUN Rscript -e 'devtools::install_github("rmcelreath/rethinking")' 
RUN Rscript -e 'library(rethinking)' 
RUN Rscript -e 'library(rstan)' 
RUN Rscript -e 'sessionInfo()' 

