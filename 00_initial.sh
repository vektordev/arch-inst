#!/bin/bash
echo "installing the base system - this assumes you have at the partition formatted and mounted as /mnt and internet connection established"
echo "is all that the case? [Y/N] "
read yes
if [[ $yes == "Y" || $yes == "y" || $yes == "" ]]; then
	pacstrap /mnt base
	genfstab -p /mnt >> /mnt/etc/fstab
	arch-chroot /mnt
	echo "enter host name"
	read hst
	echo $hst > /etc/hostname
	ln -sf /usr/share/zoneinfo/Europe/Berlin
	echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
	locale-gen
	echo "LANG=en_US.UTF-8 UTF-8" > /etc/locale.conf #unsure here - is "en_US-UTF-8 UTF-8" correct, as in, my locale?
	#here be keymap config
	#here be font config
	#here be network config
	mkinitcpio -p linux
	echo "let's set a password"
	passwd
else
	echo "Exiting ..."
	exit 1
fi
