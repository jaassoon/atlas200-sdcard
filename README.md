# atlas200-sdcard
sdcard making image of docker for atlas200
## prerequisites 
* Register qemu.
```shell
docker run --rm --privileged hypriot/qemu-register
```
* If your host machine is centos, you should upgrade your linux kernel version up to >= 4.9.
## how to build 
```docker build . ```
## make sd card
* Download the mini package file from [another location at here](https://github.com/Ascend/ascenddk-private/tree/master/B750SP05
).
