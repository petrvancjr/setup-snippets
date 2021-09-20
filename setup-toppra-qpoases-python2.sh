#!/bin/bash
# - Installs the last version of toppra with Python2 compatibility
# - Tricky installation for the qpOASES for Python2

python -m pip install toppra==0.2.2a0

cd ~
wget --no-check-certificate https://www.coin-or.org/download/source/qpOASES/qpOASES-3.2.1.zip
unzip qpOASES-3.2.1.zip
rm qpOASES-3.2.1.zip
cd qpOASES-3.2.1

make
cmake .
sudo make install
cd interfaces/python
python setup.py build_ext --inplace

echo "qpoases.so is Python executable file which you can import"

# If make fails, edit qpOASES-3.2.1/make_linux.mk
# Delete -D__USE_LONG_INTEGERS__ -D__USE_LONG_FINTS__ and then press enter"
# https://github.com/coin-or/qpOASES/issues/90
