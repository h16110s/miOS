
コンパイル
```
clang -target x86_64-pc-win32-coff \
    -mno-red-zone -fno-stack-protector -fshort-wchar -Wall -c hello.c
```
リンク
```
lld-link-10 /subsystem:efi_application /entry:EfiMain /out:hello.efi hello.o 
```


ディスクイメージの作成
```
qemu-img create -f raw disk.img 200M
```

フォーマット
```
mkfs.fat -n 'miOS' -s 2 -f 2 -R 32 -F 32 disk.img
```

イメージをマウント
```
mkdir -p mnt
mount -o loop disk.img mnt
```

イメージの中にEFIをコピー
```
mkdir -p mnt/EFI/BOOT
cp BOOTX64.EFI mnt/EFI/BOOT/BOOTX64.EFI
```

マウント解除
```
umount mnt
```

UEFIで起動するために`OVMF_CODE.fd`と`OVMF_VARS.fd`を用意する
```
qemu-system-x86_64 \
    -drive if=pflash,file=../mikanos-build/devenv/OVMF_CODE.fd \
    -drive if=pflash,file=../mikanos-build/devenv/OVMF_VARS.fd \
    -hda disk.img
```
