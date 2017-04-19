# Distributed under the terms of the GNU General Public License v2

EAPI=6
MY_PN=${PN/-bin/}

DESCRIPTION="Streaming torrent app for Linux (BitTorrent/WebTorrent)"
HOMEPAGE="https://webtorrent.io/desktop"
SRC_URI="https://github.com/webtorrent/webtorrent-desktop/releases/download/v0.18.0/WebTorrent-v${PV}-linux.zip"

KEYWORDS="~amd64"
LICENSE="MPL-2.0"
SLOT="0"
IUSE=""

S="${WORKDIR}/WebTorrent-linux-x64"

src_install() {
	insinto /opt/${MY_PN}
	doins -r *

	exeinto /opt/${MY_PN}
	doexe WebTorrent

	dosym /opt/${MY_PN}/WebTorrent /usr/bin/${MY_PN}
}
