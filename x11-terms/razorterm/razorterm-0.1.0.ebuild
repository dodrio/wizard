# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit eutils multilib toolchain-funcs

DESCRIPTION="razor terminal"
HOMEPAGE="https://github.com/geekfrog"
GITHUB_USER="geekfrog"
SRC_URI="https://github.com/${GITHUB_USER}/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT-with-advertising"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="media-libs/fontconfig
	x11-libs/libX11
	x11-libs/libXext
	x11-libs/libXft"
DEPEND="${RDEPEND}
	sys-libs/ncurses
	virtual/pkgconfig
	x11-proto/xextproto
	x11-proto/xproto"

src_prepare() {
	epatch_user

	sed -e '/^CFLAGS/s:[[:space:]]-O[^[:space:]]*[[:space:]]: :' \
		-e '/^X11INC/{s:/usr/X11R6/include:/usr/include/X11:}' \
		-e "/^X11LIB/{s:/usr/X11R6/lib:/usr/$(get_libdir)/X11:}" \
		-i config.mk || die
	sed -e '/@echo/!s:@::' \
		-i Makefile || die
	tc-export CC
}

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}"/usr install
	tic -s -o "${ED}"/usr/share/terminfo st.info || die
}
