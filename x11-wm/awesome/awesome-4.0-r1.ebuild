# Distributed under the terms of the GNU General Public License v2

EAPI=6
CMAKE_MIN_VERSION="3.0"
inherit cmake-utils eutils

DESCRIPTION="A dynamic floating and tiling window manager"
HOMEPAGE="http://awesomewm.org/"
SRC_URI="https://github.com/awesomeWM/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
KEYWORDS="~amd64"

LICENSE="GPL-2"
SLOT="0"
IUSE="dbus"

COMMON_DEPEND="
	>=dev-lang/lua-5.1:0
	dev-libs/glib:2
	>=dev-libs/libxdg-basedir-1
	>=dev-lua/lgi-0.8.0
	x11-libs/cairo[xcb]
	x11-libs/gdk-pixbuf:2
	>=x11-libs/libxcb-1.6[xkb]
	>=x11-libs/pango-1.19.3[introspection]
	>=x11-libs/startup-notification-0.10_p20110426
	>=x11-libs/xcb-util-0.3.8
	>=x11-libs/xcb-util-xrm-1.0
	x11-libs/xcb-util-cursor
	x11-libs/libXcursor
	>=x11-libs/libX11-1.3.99.901
	dbus? ( >=sys-apps/dbus-1 )
"

# graphicsmagick's 'convert -channel' has no Alpha support, bug #352282
DEPEND="
	${COMMON_DEPEND}
	>=app-text/asciidoc-8.4.5
	app-text/xmlto
	dev-util/gperf
	virtual/pkgconfig
	x11-base/xorg-server
	x11-libs/libxkbcommon
	media-gfx/imagemagick[png]
	>=x11-proto/xcb-proto-1.5
	>=x11-proto/xproto-7.0.15
"

RDEPEND="${COMMON_DEPEND}"

src_prepare() {
	# bug #408025
	epatch "${FILESDIR}/${PN}-convert-path.patch"

	eapply_user
}

src_configure() {
	mycmakeargs=(
		-DPREFIX="${EPREFIX}"/usr
		-DSYSCONFDIR="${EPREFIX}"/etc
		-DWITH_DBUS="$(usex dbus)"
	)

	cmake-utils_src_configure
}

src_compile() {
	local myargs="all"
	cmake-utils_src_make ${myargs}
}

src_install() {
	cmake-utils_src_install
}

pkg_postinst() {
	einfo
	elog "If you are having issues with Java application windows being"
	elog "completely blank, try installing"
	elog "  x11-misc/wmname"
	elog "and setting the WM name to LG3D."
	elog "For more info visit"
	elog "  https://bugs.gentoo.org/show_bug.cgi?id=440724"
	einfo
}
