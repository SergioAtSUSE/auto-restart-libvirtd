#!/bin/bash
#
# This file is part of package auto-restart-libvirtd
#
# Copyright (c) 2019 SUSE LINUX Products GmbH, Nuernberg, Germany.
#
# All modifications and additions to the file contributed by third parties
# remain the property of their copyright owners, unless otherwise agreed
# upon. The license for this file, and modifications and additions to the
# file, is the same license as for the pristine package itself (unless the
# license for the pristine package is not an Open Source License, in which
# case the license is the MIT License). An "Open Source License" is a
# license that conforms to the Open Source Definition (Version 1.9)
# published by the Open Source Initiative.

# Please submit bugfixes or comments via http://bugs.opensuse.org/
#
grep "qemu-system-s390x: cannot set up guest memory 's390.ram': Cannot allocate memory" /tmp/os-autoinst-*-stderr.log
if [ "$?" -eq 0 ]; then
  systemctl restart libvirtd
  rm /tmp/os-autoinst-*-stderr.log
fi
