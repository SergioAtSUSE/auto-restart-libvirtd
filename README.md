# auto-restart-libvirtd

QSF KVM hosts suffer from memory leaks, a workaround is restarting libvirtd


## Installation

#### From source

```bash
user@host:~/Downloads$ wget https://github.com/SergioAtSUSE/auto-restart-libvirtd/archive/v0.2.1.tar.gz
user@host:~/Downloads$ tar -xzvf v0.2.1.tar.gz
user@host:~/Downloads$ cd auto-restart-libvirtd-0.2.1/
user@host:~/Downloads/auto-restart-libvirtd-0.2.1$ make install
```


## restart-libvirtd.sh

A bash script that checks if any of the files matching the globbing pattern /tmp/os-autoinst-*-stderr.log contains the string `qemu-system-s390x: cannot set up guest memory 's390.ram': Cannot allocate memory` and restarts libvirtd.


## restart-libvirtd.service

**restart-libvirtd.service** is executed by the systemd timer **restart-libvirtd.timer**.


## restart-libvirtd.timer

**restart-libvirtd.timer** will be triggered one hour after the last execution.
