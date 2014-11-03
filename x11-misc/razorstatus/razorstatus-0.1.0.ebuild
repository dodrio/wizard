# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit eutils toolchain-funcs

DESCRIPTION="status bar for razor windows manager"
HOMEPAGE="https://github.com/geekfrog"
GITHUB_USER="geekfrog"
SRC_URI="https://github.com/${GITHUB_USER}/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="battery"

DEPEND="
	x11-libs/libX11
"
RDEPEND="${DEPEND}"

src_prepare() {
	sed -i \
		-e "s/CFLAGS = -std=c99 -pedantic -Wall -Os/CFLAGS += -std=c99 -pedantic -Wall/" \
		-e "/^LDFLAGS/{s|=|+=|g;s|-s ||g}" \
		-e "s@/usr/X11R6/include@${EPREFIX}/usr/include/X11@" \
		-e "s@/usr/X11R6/lib@${EPREFIX}/usr/lib@" \
		-e "s@-I/usr/include@@" -e "s@-L/usr/lib@@" \
		config.mk || die
	sed -i \
		-e '/@echo CC/d' \
		-e 's|@${CC}|$(CC)|g' \
		Makefile || die

	use battery && epatch "${FILESDIR}"/${P}-battery.diff

	epatch_user
}

src_compile() {
	emake CC=$(tc-getCC) razorstatus
}

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" install
}
