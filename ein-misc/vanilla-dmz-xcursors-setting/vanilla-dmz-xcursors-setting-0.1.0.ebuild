# Distributed under the terms of the GNU General Public License v2

EAPI=4

DESCRIPTION="Global setting for using vanilla-dmz-xcursors in system-wide"
HOMEPAGE=""
GITHUB_USER="wizalado"
SRC_URI="https://github.com/${GITHUB_USER}/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RDEPEND="x11-themes/vanilla-dmz-xcursors"

src_install() {
	insinto /usr/share/cursors/xorg-x11/default/
	doins index.theme
}
