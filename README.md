# atlas200-sdcard
sdcard making image of docker for atlas200
## prerequisites 
* Register qemu.
```shell
docker run --rm --privileged hypriot/qemu-register
```
* If your host machine is centos, you should upgrade your linux kernel version up to >= 4.9.
```shell
# upgrade centos 7

yum -y update
yum -y install yum-plugin-fastestmirror
rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org
rpm -Uvh http://www.elrepo.org/elrepo-release-7.0-2.el7.elrepo.noarch.rpm
yum repolist
yum --enablerepo=elrepo-kernel install kernel-ml -y
yum repolist all
awk -F\' '$1=="menuentry " {print i++ " : " $2}' /etc/grub2.cfg
grub2-set-default 0
grub2-mkconfig -o /boot/grub2/grub.cfg
reboot
```
## how to build 
```docker build . -t atlas-sdcard-img```
## make sd card
* Download the mini package file from [another location at here](https://github.com/Ascend/ascenddk-private/tree/master/B750SP05).
* Run image
```shell
docker run --rm --privileged --name atlas-sdcard-vm --device=/dev/sdb:/dev/sdb -it atlas-sdcard-img
```
* Copy the ISO file into your container
```shell
wget http://old-releases.ubuntu.com/releases/16.04.3/ubuntu-16.04.3-server-arm64.iso > /dev/null 2>&1
docker cp /LOCATION-OF-ISO/ubuntu-16.04.3-server-arm64.iso atlas-sdcard-vm:/opt
docker cp /LOCATION-OF-RAR/mini_developerkit-1.1.T8.B750SP05.rar atlas-sdcard-vm:/opt
```
* Umount your sd card from host machine
* Make sd card
```shell
python3 make_sd_card.py local /dev/sdb
```
* Test
```shell
ssh USER@192.168.0.2
```


