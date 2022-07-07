# PipeWire does not work

For some reason, PipeWire just stop working suddenly for no reason, but you can workaround it by using this sequence of commands:
```bash
source ~/.bash_profile
sudo xbps-remove -RF pulseaudio pulseaudio-utils
sudo xbps-remove alsa-plugins-pulseaudio
pipewire &
wireplumber &
sudo xbps-install alsa-plugins-pulseaudio
# now, if it doesn't work, kill both pipewire and wireplumber and start them again
```
