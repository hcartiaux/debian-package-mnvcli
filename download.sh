#!/bin/bash --posix
set -x -e

# Taken from https://www.dell.com/support/home/en-us/drivers/driversdetails?driverid=ggx26
wget --user-agent="firefox" "https://dl.dell.com/FOLDER12268461M/1/BOSS-ROR-N1_Linux_CLI_1.0.13.1061_A03.zip"
wget --user-agent="firefox" "https://dl.dell.com/FOLDER12593000M/1/BOSS-ROR-N1_Linux_RelNotes_1.0.13.1061_A03.txt"
sha256sum -c sha256sums

# Unzip and move files
unzip -f *.zip
rm -f *.zip
mkdir -p debian/upstream
mv -f *.txt debian/upstream/README

# Build the package
dpkg-buildpackage -b -us -uc
