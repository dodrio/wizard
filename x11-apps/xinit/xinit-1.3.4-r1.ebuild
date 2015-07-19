# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit xorg-2

DESCRIPTION="X Window System initializer"

LICENSE="${LICENSE} GPL-2"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	!<x11-base/xorg-server-1.8.0
	x11-apps/xauth
	x11-libs/libX11
"
DEPEND="${RDEPEND}"
PDEPEND="
	x11-apps/xrdb
"

PATCHES=(
	"${FILESDIR}/${PN}-1.3.4-wizalado-customizations.patch"
	"${FILESDIR}/${PN}-1.3.4-startx-current-vt.patch"
)

src_prepare() {
	xorg-2_src_prepare
}

src_configure() {
	XORG_CONFIGURE_OPTIONS=(
		--with-xinitdir="${EPREFIX}"/etc/X11/xinit
	)
	xorg-2_src_configure
}

src_install() {
	xorg-2_src_install

	exeinto /etc/X11/xinit
	doexe "${FILESDIR}"/xserverrc
	exeinto /etc/X11/xinit/xinitrc.d/
	doexe "${FILESDIR}"/00-xhost
}

pkg_postinst() {
	xorg-2_pkg_postinst
}
