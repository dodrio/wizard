# Distributed under the terms of the GNU General Public License v2

EAPI=6
MY_P=${PN}-legacy-${PV}

DESCRIPTION="Fast, reliable, and secure node dependency management"
HOMEPAGE="https://yarnpkg.com"
SRC_URI="https://github.com/yarnpkg/yarn/releases/download/v${PV}/${MY_P}.js"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="net-libs/nodejs"
DEPEND="${RDEPEND}"

S=${DISTDIR}

src_install() {
	exeinto /usr/bin
	newexe ${MY_P}.js ${PN}
}
