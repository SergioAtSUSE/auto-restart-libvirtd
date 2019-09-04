# auto-restart-libvirtd

QSF KVM hosts suffer from memory leaks, a workaround is restarting libvirtd


## Installation

#### From source

```bash
user@host:~/Downloads$ wget https://github.com/openSUSE/auto-restart-libvirtd/archive/v1.0.0.tar.gz
user@host:~/Downloads$ tar -xzvf v1.0.0.tar.gz
user@host:~/Downloads$ cd auto-restart-libvirtd-1.0.0/
user@host:~/Downloads/auto-restart-libvirtd-1.0.0$ make install
```

#### From Open Build Service

Packaged in OBS project https://build.opensuse.org/package/show/devel:openSUSE:QA:QSF/auto-restart-libvirtd
```bash
# Find your distribution here https://download.opensuse.org/repositories/devel:/openSUSE:/QA:/QSF/
user@host:~$ DISTRI=openSUSE_Leap_15.1 # eg. openSUSE Leap 15.1 for x86_64
user@host:~$ sudo zypper addrepo https://download.opensuse.org/repositories/devel:/openSUSE:/QA:/QSF/$DISTRI QSF
user@host:~$ sudo zypper install auto-restart-libvirtd
```

#### Activation

```bash
user@host:~$ sudo systemctl enable --now restart-libvirtd.timer
```


## restart-libvirtd.sh

A bash script that checks if any of the files matching the globbing pattern /tmp/os-autoinst-*-stderr.log contains the string `qemu-system-s390x: cannot set up guest memory 's390.ram': Cannot allocate memory` and restarts libvirtd.


## restart-libvirtd.service

**restart-libvirtd.service** is executed by the systemd timer **restart-libvirtd.timer**.


## restart-libvirtd.timer

**restart-libvirtd.timer** will be triggered one hour after the last execution.
