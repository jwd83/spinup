#!/usr/bin/env python
import libspin

libspin.apt_upgrade()
libspin.install_package('htop')
libspin.install_package('iftop')
libspin.install_package('nginx')
libspin.install_package('ufw')
