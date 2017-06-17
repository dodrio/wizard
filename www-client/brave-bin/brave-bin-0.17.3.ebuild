# Distributed under the terms of the GNU General Public License v2

EAPI=6
MY_PN=${PN/-bin/}

DESCRIPTION="Brave web browser for laptops and desktops (binary)"
HOMEPAGE="https://www.brave.com"
SRC_URI="https://github.com/${MY_PN}/browser-laptop/releases/download/v0.17.3dev/Brave.tar.bz2 -> ${P}.tar.bz2"

KEYWORDS="~amd64"
LICENSE="MPL-2.0"
SLOT="0"
IUSE=""

RDEPEND="
	gnome-base/libgnome-keyring"
DEPEND="${RDEPEND}"

S="${WORKDIR}/Brave-linux-x64"

src_install() {
        insinto /opt/${MY_PN}
        doins -r *

        exeinto /opt/${MY_PN}
        doexe brave

        dosym /opt/${MY_PN}/brave /usr/bin/${MY_PN}
}
