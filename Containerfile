FROM registry.cloud.college.ucsb.edu/ucsb/rstudio-base:latest

LABEL maintainer="LSIT Systems <lsitops@ucsb.edu>"

USER root

RUN mamba install -y bioconda::bioconductor-qvalue

RUN R -e "install.packages(c('tidyverse', 'car', 'lindia', 'MASS', 'patchwork', 'quantreg', 'GGally'), repos = 'https://cloud.r-project.org/', Ncpus = parallel::detectCores())"

USER $NB_USER

