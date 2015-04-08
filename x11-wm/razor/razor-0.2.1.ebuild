# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit eutils savedconfig toolchain-funcs

DESCRIPTION="A dynamic window manager forked from dwm"
HOMEPAGE="https://github.com/geekfrog"
GITHUB_USER="geekfrog"
SRC_URI="https://github.com/${GITHUB_USER}/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="xinerama"

DEPEND="
	x11-libs/libX11
	x11-libs/libXft
	media-libs/freetype
	media-fonts/liberation-fonts
	xinerama? (
		x11-proto/xineramaproto
		x11-libs/libXinerama
	)
"
RDEPEND="${DEPEND}"

src_prepare() {
	sed -i \
		-e "s/CFLAGS = -std=c99 -pedantic -Wall -Os/CFLAGS += -std=c99 -pedantic -Wall/" \
		-e "/^LDFLAGS/{s|=|+=|g;s|-s ||g}" \
		-e "s/#XINERAMALIBS =/XINERAMALIBS ?=/" \
		-e "s/#XINERAMAFLAGS =/XINERAMAFLAGS ?=/" \
		-e "s@/usr/X11R6/include@${EPREFIX}/usr/include/X11@" \
		-e "s@/usr/X11R6/lib@${EPREFIX}/usr/lib@" \
		-e "s@-I/usr/include@@" -e "s@-L/usr/lib@@" \
		config.mk || die
	sed -i \
		-e '/@echo CC/d' \
		-e 's|@${CC}|$(CC)|g' \
		Makefile || die

	restore_config config.h
	epatch_user
}

src_compile() {
	if use xinerama; then
		emake CC=$(tc-getCC) razor
	else
		emake CC=$(tc-getCC) XINERAMAFLAGS="" XINERAMALIBS="" razor
	fi
}

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" install

	dodoc README.md

	save_config config.h
}

pkg_postinst() {
	einfo "This ebuild has support for user defined configs"
	einfo "Please read this ebuild for more details and re-emerge as needed"
	einfo "if you want to add or remove functionality for ${PN}"
	if ! has_version x11-misc/razormenu; then
		elog "Installing ${PN} without x11-misc/razormenu"
		einfo "To have a menu you can install x11-misc/razormenu"
	fi
	einfo "You can custom status bar by usimg xsetroot:"
	einfo "xsetroot -name \"\`date\` \`uptime | sed 's/.*,//'\`\""
}
