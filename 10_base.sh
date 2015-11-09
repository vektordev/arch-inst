echo "enter host name"
read hst
echo $hst > /etc/hostname
ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime
hwclock --systohc --utc
echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
echo "de_DE.UTF-8 UTF-8" > /etc/locale.gen
locale-gen
echo "LANG=de_DE.UTF-8 UTF-8" > /etc/locale.conf #this is possibly still wrong.
localectl set-keymap --no-convert de-latin1
#here be font config
#here be network config
mkinitcpio -p linux
echo "let's set a password"
passwd
echo "font, network unconfigured. If it worked out of the box before running this script, you'll probably be good. You still need a bootloader!"
pacman -S grub efibootmgr os-prober
grub-install --target=x86_64-efi --efi-directory=$esp --bootloader-id=grub --recheck
grub-mkconfig -o /boot/grub/grub.cfg
