#!/usr/bin/env bash

# setup base operating system
apt-get update
apt-get upgrade -y

# install common bioinfo/cheminfo packages
apt-get install -y blast2
apt-get install -y hmmer

# compile and install R
mkdir /tmp/compileR
cd /tmp/compileR
wget http://cran.cnr.berkeley.edu/src/base/R-3/R-3.0.2.tar.gz
tar xvfz R-3.0.2.tar.gz
cd /tmp/R-3.0.2
./configure
make
make check
make info
make install
make install-info
cd ~/ 
rm -rf /tmp/compileR

# install R packages

# clean up
apt-get clean
