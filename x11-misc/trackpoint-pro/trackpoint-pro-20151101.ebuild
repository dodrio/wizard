# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit git-r3

DESCRIPTION="X11 configuration for Thinkpad trackpoint professional."
HOMEPAGE="https://github.com/wizalado/trackpoint-pro"

SRC_URI=""
EGIT_REPO_URI="https://github.com/wizalado/${PN}.git"
EGIT_COMMIT="06ab5f6823536078ebf85be79d8b380e4d6a09c9"
KEYWORDS="~amd64"

LICENSE="MIT"
SLOT="0"

DEPEND=""
RDEPEND="${DEPEND}"


src_install() {
	insinto /etc/X11/xorg.conf.d/
	doins 11trackpoint.conf
}
