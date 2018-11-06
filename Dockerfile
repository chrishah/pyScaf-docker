FROM ubuntu:16.04

MAINTAINER <christoph.hahn@uni-graz.at>

RUN apt-get update && apt-get -y upgrade && apt-get install -y build-essential vim git wget unzip libz-dev python \
python-dev python-pip python-numpy python-scipy python-biopython 

#install dependencies for pyScaf
#install LAST
WORKDIR /usr/src
RUN wget http://last.cbrc.jp/last-959.zip && \
	unzip last-959.zip && \
	cd last-959 && \
	make && make install && cd .. && rm -rf last-959 && \
	pip install -U FastaIndex

#setup pyScaf
RUN git clone --recursive https://github.com/lpryszcz/pyScaf.git && \
ln -s $(pwd)/pyScaf/pyScaf.py /usr/bin/

#create working directory and move to entrypoint
VOLUME /home/data
WORKDIR /home/data
