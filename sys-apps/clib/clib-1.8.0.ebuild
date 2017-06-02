# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit eutils toolchain-funcs

DESCRIPTION="C package manager-ish"
HOMEPAGE="https://github.com/clibs/clib"
SRC_URI="https://github.com/clibs/clib/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="net-misc/curl"
RDEPEND="${DEPEND}"

src_compile() {
	emake
}

src_install() {
	emake PREFIX="${D}/usr" install
	dodoc Readme.md History.md LICENSE
}
