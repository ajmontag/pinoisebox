#! /bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "Permission Denied. Try running 'sudo ./install.sh'" 1>&2
   exit 100
fi

export PINOISEBOX_HOME_DIR=/opt/pinoisebox

mkdir -p $PINOISEBOX_HOME_DIR
cp -r ./ $PINOISEBOX_HOME_DIR
cd $PINOISEBOX_HOME_DIR

# media from:
# https://mc2method.org/white-noise/

ln -s -f fan6.mp3 default.mp3

install src/*.service /etc/systemd/system/

systemctl daemon-reload
systemctl enable pinoisebox.service
systemctl restart pinoisebox.service
