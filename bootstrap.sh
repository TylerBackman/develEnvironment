#!/usr/bin/env bash

# setup base operating system
apt-get update
apt-get upgrade -y
apt-get install -y gfortran 
apt-get install -y build-essential
apt-get install -y x11-common 
apt-get install -y libx11-dev 
apt-get install -y xserver-xorg-dev 
apt-get install -y xserver-xorg 
apt-get install -y libxt-dev 
apt-get install -y screen 
apt-get install -y tmux 
apt-get install -y vim 
apt-get install -y texlive-latex-recommended 
apt-get install -y texlive-latex-extra
apt-get install -y lynx

# tools for compiling obabel
apt-get install -y cmake 
apt-get install -y libeigen3-dev zlib1g-dev libeigen2-dev libcairo2-dev python-dev

# install common bioinfo/cheminfo packages
apt-get install -y blast2
apt-get install -y hmmer

# compile and install R
mkdir /tmp/compileR
cd /tmp/compileR
wget http://cran.cnr.berkeley.edu/src/base/R-3/R-3.1.1.tar.gz
tar xvfz R-3.1.1.tar.gz
cd R-3.1.1
./configure
make
make check
make info
make install
make install-info
cd ~/ 
rm -rf /tmp/compileR

# install prereqs for building R packages
apt-get install -y curl libcurl4-openssl-dev
apt-get install -y libgsl0-dev libgsl0ldbl
apt-get install -y libxml2 libxml2-dev 

# compile and install openbabel
mkdir /tmp/compileOB
cd /tmp/compileOB
wget -O ob.tgz http://hivelocity.dl.sourceforge.net/project/openbabel/openbabel/2.3.2/openbabel-2.3.2.tar.gz
tar xvfz ob.tgz
mkdir build
cd build
cmake ../openbabel-2.3.2 -DPYTHON_BINDINGS=ON
make -j2
make install
cd ~/
rm -rf /tmp/compileOB
echo "/usr/local/lib" > /usr/lib/python2.7/dist-packages/obabel.pth

# install R packages
printf "source(\"http://bioconductor.org/biocLite.R\")
biocLite()
biocLite(c(\"ShortRead\", \"Biostrings\", \"IRanges\", \"BSgenome\", \"rtracklayer\", \"biomaRt\",
\"BiocStyle\", 
\"ChemmineR\", \"fmcsR\", \"bioassayR\", \"cellHTS2\", \"RCurl\", \"ape\", \"eiR\", \"ChemmineOB\", \"rjson\"))
" | R --slave

# install vimr and configure for screen use
cd /home/vagrant
sudo -u vagrant wget http://www.vim.org/scripts/download_script.php?src_id=16100 -O screen.vba
sudo -u vagrant vim -S screen.vba -c "q"
rm screen.vba
sudo -u vagrant wget http://www.vim.org/scripts/download_script.php?src_id=20996 -O vimr.zip
sudo -u vagrant unzip vimr.zip -d .vim
rm vimr.zip
sudo -u vagrant vim -c ":helptags .vim/doc" -c "q"
sudo -u vagrant wget https://raw.github.com/jalvesaq/screenR/master/screenR.vim -O .vim/screenR.vim
sudo -u vagrant cp /vagrant/vimrc .vimrc

# clean up
apt-get clean
