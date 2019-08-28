#!/bin/bash
grep "qemu-system-s390x: cannot set up guest memory 's390.ram': Cannot allocate memory" /tmp/os-autoinst-*-stderr.log
if [ "$?" -eq 0 ]; then
  systemctl restart libvirtd
  rm /tmp/os-autoinst-*-stderr.log
fi
