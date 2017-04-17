# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Free Universal SQL Client"
HOMEPAGE="http://dbeaver.jkiss.org/"
SRC_URI="http://dbeaver.jkiss.org/files/${PV}/${PN}-${PV}-linux.gtk.x86_64.tar.gz"

KEYWORDS="~amd64"
LICENSE="Apache-2.0"
SLOT="0"
IUSE=""

RDEPEND="
	>=virtual/jre-1.8
"

S="${WORKDIR}/dbeaver"

src_install() {
	insinto /usr/share/${PN}
	doins -r *

	exeinto /usr/share/${PN}
	doexe dbeaver
	dosym /usr/share/${PN}/dbeaver /usr/bin/${PN}
}
