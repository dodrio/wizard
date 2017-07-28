# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit systemd

DESCRIPTION="Ipset service for ipsets"

KEYWORDS="~amd64"
LICENSE="GPL-2"
SLOT="0"
IUSE=""

S=${D}

src_install() {
	dodir /etc/ipset

	dodir /usr/libexec/ipset
	insinto /usr/libexec/ipset
	newins "${FILESDIR}/ipset.start-stop" ipset.start-stop
	fperms 0755 /usr/libexec/ipset/ipset.start-stop

	systemd_newunit "${FILESDIR}/ipset.service" ipset.service
}
