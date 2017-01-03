# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit eutils toolchain-funcs

DESCRIPTION="A very simple application that changes MacBooks' keyboard backlight level."
HOMEPAGE="https://github.com/hobarrera/kbdlight"
GITHUB_USER="hobarrera"
SRC_URI="https://github.com/${GITHUB_USER}/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"

src_compile() {
	emake CC=$(tc-getCC) kbdlight
}

src_install() {
	emake PREFIX="${D}/usr" install

	dodoc README.md
}
