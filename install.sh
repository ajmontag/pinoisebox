#! /bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "Permission Denied. Try running 'sudo ./install.sh'" 1>&2
   exit 100
fi

# apt-get update
# apt-get install -y vlc

export PINOISEBOX_HOME_DIR=/opt/pinoisebox

mkdir -p $PINOISEBOX_HOME_DIR/
mkdir -p $PINOISEBOX_HOME_DIR/media
mkdir -p $PINOISEBOX_HOME_DIR/src
cp -r ./ $PINOISEBOX_HOME_DIR/src
cd $PINOISEBOX_HOME_DIR/media

# download media
# https://mc2method.org/white-noise/

# fan 6
wget --no-check-certificate -O fan6.mp3 https://mc2method.org/white-noise/download.php?file=33-Fan&length=60
ln -s -f fan6.mp3 default.mp3

install src/*.service /etc/systemd/system/

systemctl daemon-reload
systemctl enable pinoisebox.service
systemctl restart pinoisebox.service
