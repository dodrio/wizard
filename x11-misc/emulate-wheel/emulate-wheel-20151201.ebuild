# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit git-r3

DESCRIPTION="Hold down the middle key(or a real wheel) and move forward and back or left to right to emulate the wheel behavior."
HOMEPAGE="https://github.com/wizalado/emulate-wheel"

SRC_URI=""
EGIT_REPO_URI="https://github.com/wizalado/${PN}.git"
EGIT_COMMIT="4b965491596bebbf1b6fe4d3b1c9a406ccb103cf"
KEYWORDS="~amd64"

LICENSE="MIT"
SLOT="0"

DEPEND=""
RDEPEND="${DEPEND}"


src_install() {
	insinto /etc/X11/xorg.conf.d/
	doins 11emulate_wheel.conf
}
