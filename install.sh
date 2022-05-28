#! /bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "Permission Denied. Try running 'sudo ./install.sh'" 1>&2
   exit 100
fi

# apt-get update
# apt-get install -y mpg123

export PINOISEBOX_HOME_DIR=/opt/pinoisebox

mkdir -p $PINOISEBOX_HOME_DIR
cd $PINOISEBOX_HOME_DIR

# media from:
# https://mc2method.org/white-noise/

mpg123 -w fan6.wav fan6.mp3
ln -s -f fan6.wav default.wav

install src/*.service /etc/systemd/system/

systemctl daemon-reload
systemctl enable pinoisebox.service
systemctl restart pinoisebox.service
