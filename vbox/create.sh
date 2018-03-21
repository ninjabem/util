#!/bin/bash

NAME=1604

OSTYPE=Ubuntu_64
DIR=$HOME/vbox/$NAME
MEM=2048
MEDIUM=$DIR/$NAME.vdi
MEDIUM_SIZE_MB=10240

# create
VBoxManage createvm --name $NAME --ostype $OSTYPE --register

# settings
VBoxManage modifyvm $NAME --memory $MEM --vram 32 --ioapic on --apic on --cpus 2 --hwvirtex on --nestedpaging on --largepages on --firmware efi64 --nic1 nat --rtcuseutc on --usb on --mouse usbtablet --boot1 dvd --boot2 disk --boot3 none --boot4 none --audio none

# add DVD
VBoxManage storagectl $NAME --name IDE --add ide --controller PIIX4 --portcount 2 --hostiocache on --bootable on
VBoxManage storageattach $NAME --storagectl IDE --port 0 --device 0 --type dvddrive --medium emptydrive

# add SSD
VBoxManage storagectl $NAME --name SATA --add sata --controller IntelAHCI --portcount 1 --hostiocache on --bootable on
VBoxManage createmedium disk --filename $MEDIUM --size $MEDIUM_SIZE_MB --format VDI --variant Standard
VBoxManage storageattach $NAME --storagectl SATA --port 0 --type hdd --nonrotational on --medium $MEDIUM
