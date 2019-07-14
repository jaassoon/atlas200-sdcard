# atlas200-sdcard
sdcard making image of docker for atlas200
## prerequisites 
### ubuntu host
* You should install qemu-user-static and copy the installed bin file to the place same with Dockerfile.
```shell
apt install qemu-user-static
cp /usr/bin/qemu-aarch64-static .
```
### centos host
* You should upgrade your linux kernel version up to >= 4.9.
* install qemu-user-static and copy the installed bin file to the place same with Dockerfile.
## how to build 
```docker build . ```
## make sd card
* Download the mini package file from [another location at here](https://github.com/Ascend/ascenddk-private/tree/master/B750SP05
).
