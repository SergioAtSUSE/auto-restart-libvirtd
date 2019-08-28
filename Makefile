#
# Makefile for package auto-restart-libvirtd
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
.DEFAULT_GOAL:= default
.PHONY: default install printvars
path_sbin = $(DESTDIR)/usr/local/sbin/
path_systemd = $(DESTDIR)/usr/local/lib/systemd/system/

default:
	@echo "use 'make install' to install"

install:
	install -m 0544 src/restart-libvirtd.sh "$(path_sbin)"
	install -m 0444 src/restart-libvirtd.service "$(path_systemd)"
	install -m 0444 src/restart-libvirtd.timer "$(path_systemd)"

printvars:
	@$(foreach V,$(sort $(.VARIABLES)), $(if $(filter-out environment% default automatic, $(origin $V)),$(warning $V=$($V) ($(value $V)))))
	@env
