# Distributed under the terms of the GNU General Public License v2

EAPI=4
inherit eutils git-2

DESCRIPTION="Awesome WM complements"
HOMEPAGE="https://github.com/copycat-killer/lain"
EGIT_REPO_URI="https://github.com/copycat-killer/lain.git"
EGIT_COMMIT="1b12fd2319e1cd02706fd3a7ec0f0203ca2782d2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
RDEPEND="net-misc/curl"

src_install() {
	insinto /usr/share/awesome/lib/${PN}
	doins *.lua
	doins -r {icons,layout,scripts,util,widget}

	dodoc LICENSE
	dodoc README.rst
}
