FROM r-base

WORKDIR	 /home/docker

USER docker
RUN echo "install.packages('neuralnet')" | Rscript /dev/stdin
RUN echo "install.packages('data.table')" | Rscript /dev/stdin

