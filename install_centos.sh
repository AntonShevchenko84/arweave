#!/bin/bash

echo "-----INSTALLING DEPENDENCIES-----"
yum  install -y wget gcc gcc-c++ make build-essential autoconf m4 libncurses5-dev libssh-dev epel-release unixodbc-dev openjdk-8-jdk libwxgtk3.0-dev xsltproc fop
wget https://packages.erlang-solutions.com/erlang-solutions-1.0-1.noarch.rpm
rpm -Uvh erlang-solutions-1.0-1.noarch.rpm
yum install erlang 
wget http://www.erlang.org/download/otp_src_20.1.tar.gz
tar -zvxf otp_src_20.1.tar.gz
cd otp_src_20.1
export ERL_TOP=`pwd`
echo "-----BUILDING ERLANG-----"
./configure --without-wx
make -j4
sudo make install
echo "-----INSTALLED ERLANG SUCCESFULLY-----"
cd ../
yum install -y git
echo "-----CLONING ARWEAVE REPO-----"
git clone https://github.com/ArweaveTeam/arweave.git arweave && cd arweave && git -c advice.detachedHead=false checkout stable
make all
echo "-----FINISHED INSTALLATION-----"
