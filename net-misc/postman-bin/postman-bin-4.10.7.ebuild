# Distributed under the terms of the GNU General Public License v2

EAPI=6
MY_PN=${PN/-bin/}

DESCRIPTION="Supercharge your API workflow"
HOMEPAGE="https://www.getpostman.com/"
SRC_URI="https://dl.pstmn.io/download/version/4.10.7/linux64 -> ${P}.tar.gz"

KEYWORDS="~amd64"
LICENSE="MPL-2.0"
SLOT="0"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}"

S="${WORKDIR}/Postman"

src_install() {
		insinto /opt/${MY_PN}
		doins -r *

		exeinto /opt/${MY_PN}
		doexe Postman

		dosym /opt/${MY_PN}/Postman /usr/bin/${MY_PN}
}
