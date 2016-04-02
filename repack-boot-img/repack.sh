#!/bin/bash


# resolve links - $0 may be a softlink
PRG="$0"
while [ -h "$PRG" ] ; do
  ls=`ls -ld "$PRG"`
  link=`expr "$ls" : '.*-> \(.*\)$'`
  if expr "$link" : '/.*' > /dev/null; then
    PRG="$link"
  else
    PRG=`dirname "$PRG"`/"$link"
  fi
done
PRGDIR=`dirname "$PRG"`
#

set -ex

mkdir -p out/target/product/X9180/rep-boot
rm -rf   out/target/product/X9180/rep-boot
mkdir -p out/target/product/X9180/rep-boot


# step 1. unpack boot.img
pushd out/target/product/X9180/rep-boot
../../../../host/linux-x86/bin/unpackbootimg -i ../boot.img -o .
gzip -d -f boot.img-ramdisk.gz

mkdir -p cpio

(cd cpio; cpio -id < ../boot.img-ramdisk)
popd

# step 2. copy files relate to selinux
cp -v $PRGDIR/{file_contexts,property_contexts,sepolicy} out/target/product/X9180/rep-boot/cpio

# step 3. repackage
pushd out/target/product/X9180/rep-boot
( cd cpio; find . | cpio -o -H newc | gzip > ../tree.cpio.gz )

../../../../host/linux-x86/bin/mkbootimg --kernel boot.img-zImage --ramdisk tree.cpio.gz --dt boot.img-dt --cmdline "$(cat boot.img-cmdline)" --base $(cat boot.img-base) --pagesize $(cat boot.img-pagesize) --ramdisk_offset $(cat boot.img-ramdisk_offset) --second_offset $(cat boot.img-second_offset) --tags_offset $(cat boot.img-tags_offset) -o ../boot.img
popd

# step 4. sign

