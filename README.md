# auto-restart-libvirtd

QSF KVM hosts suffer from memory leaks, a workaround is restarting libvirtd


# restart-libvirtd.sh

A bash script that checks if any of the files matching the globbing pattern /tmp/os-autoinst-*-stderr.log contains the string `qemu-system-s390x: cannot set up guest memory 's390.ram': Cannot allocate memory` and restarts libvirtd.
