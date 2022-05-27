# pinoisebox
A noise machine using raspberry pi.

## Setup 
```
sudo apt-get update
sudo apt-get install -y vlc
git clone https://github.com/ajmontag/pinoisebox.git
cd pinoisebox
sudo ./install.sh
```

## Configure
Link any file to `/opt/pinoisebox/media/default.mp3` and it will loop playback on startup:
```
ln -s -f media/my-file.mp3 media/default.mp3
```

start/stop the service using systemctl:
```
sudo systemctl stop pinoisebox.service
sudo systemctl start pinoisebox.service
```

## Troubleshooting

```
journalctl -u pinoisebox.service -b
```
