#!/bin/bash
# Tested on ubuntu 18.04 LTS (ami-0ac019f4fcb7cb7e6)

# =========================
# Additional fixes for GCHP
# =========================
sudo apt-get update

sudo apt-get install -y bc gcc gfortran \
    libnetcdf-dev libnetcdff-dev netcdf-bin \
    python-numpy

# Ubuntu AMI has vim and nano but no emacs
sudo apt-get install -y emacs

# Pull S3 data without installing anaconda Python
sudo apt-get install -y awscli

# clean up cache
sudo apt-get clean
sudo rm -rf /var/lib/apt/lists/*

# =========================
# OpenMPI 3
# =========================
# https://www.open-mpi.org/software/ompi/v3.1/
wget https://download.open-mpi.org/release/open-mpi/v3.1/openmpi-3.1.3.tar.gz
tar zxf openmpi-3.1.3.tar.gz
cd openmpi-3.1.3
./configure prefix=/usr/local/
make -j4
sudo make install

# Fix library linking
# https://askubuntu.com/a/1100000
sudo ldconfig

cd ..
rm -rf openmpi-3.1.3
# =========================

# =========================
# Additional fixes for GCHP
# =========================

# GCHP directly uses `gmake` command, which is not available on ubuntu
# https://ubuntuforums.org/showthread.php?t=1811030
sudo ln -s /usr/bin/make /usr/bin/gmake