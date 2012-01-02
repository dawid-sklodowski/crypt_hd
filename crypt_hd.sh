#!/bin/sh

case $1 in
  start)
	echo "Mounting /crytp_hd..."
	su -c 'cryptsetup luksOpen /dev/sdb6 crypt_hd
	mount /dev/mapper/crypt_hd /crypt_hd'
	;;
  stop)
	echo "Unmounting /crytp_hd..."
	su -c 'umount /crypt_hd
	cryptsetup luksClose crypt_hd'
	;;
  *)
	echo "Usage: crypt_hd.sh [ start | stop ]"
	;;
esac

