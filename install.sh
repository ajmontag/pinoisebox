#! /bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "Permission Denied. Try running 'sudo ./install.sh'" 1>&2
   exit 100
fi

export PINOISEBOX_HOME_DIR=/opt/pinoisebox

mkdir -p $PINOISEBOX_HOME_DIR/
mkdir -p $PINOISEBOX_HOME_DIR/media
mkdir -p $PINOISEBOX_HOME_DIR/src
cp -r ./ $PINOISEBOX_HOME_DIR/src
cd $PINOISEBOX_HOME_DIR

# apt-get install omxplayer

# https://mc2method.org/white-noise/
wget --no-check-certificate --directory-prefix=media https://mc2method.org/white-noise/download.php?file=33-Fan&length=60

ln -s -f media/33-Fan-60min.mp3 media/default.mp3

install src/*.service /etc/systemd/system/

systemctl daemon-reload
systemctl enable pinoisebox.service
systemctl restart pinoisebox.service
