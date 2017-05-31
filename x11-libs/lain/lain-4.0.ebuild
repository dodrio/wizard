# Distributed under the terms of the GNU General Public License v2

EAPI=4
inherit eutils git-2

DESCRIPTION="Awesome WM complements"
HOMEPAGE="https://github.com/copycat-killer/lain"
EGIT_REPO_URI="https://github.com/copycat-killer/lain.git"
EGIT_COMMIT="430e70670c3f0a38c1c300273784096aeb8728cd"

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
