# Video Recording

Recently, I made a script for video recording using FFMPEG on Linux.
You'll need a little bit of tweaking to make it work on your system, since you may have a different GPU brand or audio device.

Its really simple to modify, you just need to run the `scripts/bin.sh` script, then modify the `/usr/bin/azrec` script. You will
just need to edit the audio device and the driver name. You may also need to change the video card ID, if you have multiple video 
cards in your machine.

Simple as that, you can run the `azrec` command to record a video, and `azrec stop` to stop recording. By default, videos will be
saved to your ~/Videos directory. **Videos cannot be saved if the set location does not exist.**