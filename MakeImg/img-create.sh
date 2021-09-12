#! /bin/bash

rm disk.img
qemu-img create -f raw disk.img 200M

mkfs.fat -n 'miOS' -s 2 -f 2 -R 32 -F 32 disk.img

mkdir -p mnt
mount -o loop disk.img mnt

mkdir -p mnt/EFI/BOOT
cp $1 mnt/EFI/BOOT/BOOTX64.EFI

umount mnt
rm -rf mnt