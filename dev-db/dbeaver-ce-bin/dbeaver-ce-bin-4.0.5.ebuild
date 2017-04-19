# Distributed under the terms of the GNU General Public License v2

EAPI=6
MY_PN=${PN/-bin/}

DESCRIPTION="Free Universal SQL Client"
HOMEPAGE="http://dbeaver.jkiss.org/"
SRC_URI="http://dbeaver.jkiss.org/files/${PV}/${MY_PN}-${PV}-linux.gtk.x86_64.tar.gz"

KEYWORDS="~amd64"
LICENSE="Apache-2.0"
SLOT="0"
IUSE=""

RDEPEND="
	>=virtual/jre-1.8
"

S="${WORKDIR}/dbeaver"

src_install() {
	insinto /opt/${MY_PN}
	doins -r *

	exeinto /opt/${MY_PN}
	doexe dbeaver
	dosym /opt/${MY_PN}/dbeaver /usr/bin/${MY_PN}
}
