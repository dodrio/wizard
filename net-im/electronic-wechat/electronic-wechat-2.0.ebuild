# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit eutils unpacker versionator

DESCRIPTION="A better WeChat on Mac OS X and Linux. Fewer bugs, more features. Build with Electron."
HOMEPAGE="https://github.com/geeeeeeeeek/electronic-wechat"
SRC_BASE="https://github.com/geeeeeeeeek/${PN}/releases/download/V${PV}"
SRC_URI="${SRC_BASE}/linux-x64.tar.gz -> ${P}-amd64.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
RESTRICT="mirror strip"

DEPEND=""
RDEPEND="gnome-base/gconf
    x11-libs/gtk+:2
    virtual/udev
    dev-libs/libgcrypt
    x11-libs/libnotify
    x11-libs/libXtst
    dev-libs/nss
    dev-lang/python
    gnome-base/gvfs
    x11-misc/xdg-utils
    net-print/cups
"

S=${WORKDIR}

src_prepare(){
	mv electronic-wechat* ${PN}
}

src_install() {
	insinto /opt
	doins -r ${S}/${PN}
	fperms 0755 /opt/${PN}/electronic-wechat
	dosym "/opt/${PN}/electronic-wechat" /usr/bin/electronic-wechat
}
