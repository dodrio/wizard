# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit eutils toolchain-funcs

DESCRIPTION="Snow Crash parser harness"
HOMEPAGE="https://github.com/apiaryio/drafter"
SRC_URI="https://github.com/apiaryio/drafter/releases/download/v${PV}/${PN}-v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"

RDEPEND="sys-devel/gcc"
DEPEND="
	${RDEPEND}
	dev-lang/python
"

# reclaim the temporary build directory
S="${WORKDIR}/${PN}-v${PV}"

src_configure () {
	python2 ./configure --shared
}

src_compile() {
	emake ${PN}
}

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" install
	doheader src/drafter.h
	dolib.so build/out/Release/lib.target/libdrafter.so
	dodoc LICENSE
	dodoc README.md
}
