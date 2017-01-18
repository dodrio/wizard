# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Awesome WM complements"
HOMEPAGE="https://github.com/m31271n/lain"
SRC_URI="https://github.com/m31271n/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
RDEPEND="net-misc/curl"

src_install() {
	insinto /usr/share/awesome/lib/${PN}
	doins *.lua
	doins -r {icons,layout,scripts,util,widgets}

	dodoc LICENSE
	dodoc README.rst
}
