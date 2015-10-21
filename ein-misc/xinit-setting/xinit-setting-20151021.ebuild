# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit git-r3

DESCRIPTION="xinit-setting"
HOMEPAGE="https://github.com/wizalado/xinit-setting"

SRC_URI=""
EGIT_REPO_URI="https://github.com/wizalado/${PN}.git"
EGIT_COMMIT="4e8edd83e69690883f248b04a5225eced84422c6"
KEYWORDS="~amd64"

LICENSE="MIT"
SLOT="0"

DEPEND=""
RDEPEND="${DEPEND}"


src_install() {
	exeinto /etc/X11/xinit/xinitrc.d/
	doexe 99-wm
}
