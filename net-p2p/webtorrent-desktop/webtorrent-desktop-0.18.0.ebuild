# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Streaming torrent app for Linux (BitTorrent/WebTorrent)"
HOMEPAGE="https://webtorrent.io/desktop"
SRC_URI="https://github.com/webtorrent/webtorrent-desktop/releases/download/v0.18.0/WebTorrent-v${PV}-linux.zip"

KEYWORDS="~amd64"
LICENSE="MPL-2.0"
SLOT="0"
IUSE=""

S="${WORKDIR}/WebTorrent-linux-x64"

src_install() {
	insinto /usr/share/${PN}
	doins version *.pak *.bin *.dat
	doins *.so

	doins -r resources locales

	exeinto /usr/share/${PN}
	doexe WebTorrent
	dosym /usr/share/${PN}/WebTorrent /usr/bin/${PN}

	dodoc LICENSE*
}
