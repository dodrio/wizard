# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit systemd user

DESCRIPTION="A tool for securing communications between a client and a DNS resolver"
HOMEPAGE="https://dnscrypt.org"
SRC_URI="https://download.dnscrypt.org/${PN}/${P}.tar.gz"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="hardened libressl +plugins ssl"

RDEPEND="
	dev-libs/libsodium
	net-libs/ldns
	sys-apps/systemd
	ssl? (
		!libressl? ( dev-libs/openssl:0= )
		libressl? ( dev-libs/libressl:0= )
	)"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

DOCS="AUTHORS ChangeLog NEWS README* THANKS *txt"

pkg_setup() {
	enewgroup _dnscrypt-proxy
	enewuser _dnscrypt-proxy -1 -1 /var/empty _dnscrypt-proxy
}

src_configure() {
	econf \
		$(use_enable hardened pie) \
		$(use_enable plugins) \
		$(use_enable ssl openssl)
}

src_install() {
	default

	systemd_dounit "${FILESDIR}"/${PN}.service
}

pkg_postinst() {
	elog "After starting the service you will need to update your"
	elog "/etc/resolv.conf and replace your current set of resolvers"
	elog "with:"
	elog
	elog "nameserver <DNSCRYPT_LOCALIP>"
	elog
	elog "Also see https://github.com/jedisct1/dnscrypt-proxy#usage."
}
