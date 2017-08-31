# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit eutils unpacker versionator

MY_PN="DevDocs"
DESCRIPTION="A full-featured desktop app for DevDocs.io."
HOMEPAGE="https://github.com/egoist/devdocs-desktop"
SRC_URI="https://github.com/egoist/${PN}/releases/download/v${PV}/${MY_PN}-${PV}.tar.xz -> ${P}.tar.xz"

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
	mv ${MY_PN}* ${PN}
}

src_install() {
	insinto /opt
	doins -r ${S}/${PN}
	fperms 0755 /opt/${PN}/devdocs
	dosym "/opt/${PN}/devdocs" /usr/bin/devdocs
}
