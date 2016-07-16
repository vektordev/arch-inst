#!/bin/bash
echo "installing the base system - this assumes you have at the partition formatted and mounted as /mnt and internet connection established"
echo "We're also assuming a EFI 100 MB boot partition is in place on the drive the partition is on and it is mounted to /mnt/boot"
echo "is all that the case? [Y/n] "
read yes
if [[ $yes == "Y" || $yes == "y" || $yes == "" ]]; then
  pacman -Sy archlinux-keyring
	pacstrap /mnt base
	genfstab -p -L /mnt >> /mnt/etc/fstab
  cd /mnt
  curl -L -O raw.githubusercontent.com/vektordev/arch-inst/master/10_base.sh
  chmod +x 10_base.sh
	arch-chroot /mnt /bin/bash
else
	echo "Exiting ..."
	exit 1
fi
