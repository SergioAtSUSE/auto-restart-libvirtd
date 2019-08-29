#
# spec file for package auto-restart-libvirtd
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
Name:      auto-restart-libvirtd
Version:   0.3.1
Release:   0%{?dist}
License:   GPL-3.0+
Summary:   Auto restart libvirt when KVM host cannot allocate memory
Url:       https://github.com/SergioAtSUSE/auto-restart-libvirtd
Group:     System/Management
Source:    auto-restart-libvirtd-%{version}.tar.xz
BuildArch: noarch

%description
KVM hosts are affected by a memory leak problem that causes an error when allocating memory for the guests. A workaround is restarting libvirtd.

%prep
%setup -q

%build

%install
%make_install

%pre
%service_add_pre restart-libvirtd.service restart-libvirtd.timer

%post
%service_add_post restart-libvirtd.service restart-libvirtd.timer

%preun
%service_del_preun restart-libvirtd.service restart-libvirtd.timer

%postun
%service_del_postun restart-libvirtd.service restart-libvirtd.timer

%files
%defattr(0400,root,root,-)
%attr(0544,root,root) %{_sbindir}/restart-libvirtd.sh
%attr(0544,root,root) %{_sbindir}/rcrestart-libvirtd
%attr(0444,root,root) %{_unitdir}/restart-libvirtd.service
%attr(0444,root,root) %{_unitdir}/restart-libvirtd.timer

%changelog
