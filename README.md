# t-virus
t-virus (for treble-virus) is a tool that takes a stock Nokia 8 (NB1) firmware
and "infects" it with various parts from the Nokia 8 Sirocco firmware, and 
generates a firmware bundle that can be flashed using NOST, converting a NB1
into a treble-enabled device.

### Firmware sources
The majority of the files are taken from a NB1 firmware bundle. The bundle 
has to be extracted by the user, t-virus does not download NB1 firmwares.

The GPT partition table and the vendor image are from the 4120 A1N firmware.
The system image that gets installed is not the image that is shipped with A1N,
but PHH's generic AOSP GSI, providing a barebones testing environment. There
is no reason to download a 2 GB system image when everyone will flash their
favorite GSI anyways.

The boot image is a [modified](https://github.com/resident-nokia/umbrella/tree/treble)
version of my umbrella kernel, which has support for early mounting vendor. The
boot image also includes TWRP, but it is pretty much broken at the moment. The
recovery loads (and you can adb into it), but the screen doesn't get updated.
And I have reason to believe that data decryption is broken anyways.

### What works?
* It boots
* WiFi
* Mobile Data
* Bluetooth
* Sound
* Vibration
* Calling
* Hardware buttons
* Fingerprint
* Camera
* GPS

### What doesn't work, or isn't tested
* The second SIM slot doesn't work
* Only the fingerprint sensor has haptic feedback
* The fingerprint UI thinks the sensor is on the back of the phone.
* VoLTE (untested)
* Sensors (They probably work, but I didn't do a full test yet)

### SELinux hell
Because Android does some very weird stuff with SELinux contexts, you cannot
launch a service file when it has an unknown context. We have to fix that by
force-setting the SELinux context manually, but due to how SELinux works, this
is only possible on a Linux system **without** SELinux. This means, that you
cannot build this on a distribution with SELinux (Fedora in my case). I
fixed the problem by building the images in a Ubuntu VM.

### Download?
**WARNING:** This is not useable as a daily driver. Continue only if you are 
able to troubleshoot things if neccessary (bootloops, bricking the phone, 
causing the alarm app to declare nuclear war)

You can download the latest release from the GitHub release page. It is a .qlz,
so you will have to flash it through NOST (you will need a completely unlocked 
bootloader). When flashing, make sure to select the "Erase Userdata" option,
not doing this will most certainly bootloop the phone.

If you want to go back to stock, simply download the latest QLZ from https://bit.ly/nokia-nb1
and flash it with NOST. It will revert all changes t-virus made to your phone.

### License
Go nuts. I really don't care what you do with this.
