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

# sudo apt-get install alsa-utils
# apt-get install omxplayer

#sudo apt-get update
#sudo apt-get full-upgrade
#sudo modprobe snd_bcm2835

#/boot/config.txt
#dtoverlay=audremap,enable_jack=on
#aplay -s 5000 -c 2 -f S16_LE -r 44100 /dev/urandom

# download media
# https://mc2method.org/white-noise/

# fan 6
wget --no-check-certificate --directory-prefix=media -O fan6.mp3 https://mc2method.org/white-noise/download.php?file=33-Fan&length=60
ln -s -f media/fan6.mp3 media/default.mp3

install src/*.service /etc/systemd/system/

systemctl daemon-reload
systemctl enable pinoisebox.service
systemctl restart pinoisebox.service