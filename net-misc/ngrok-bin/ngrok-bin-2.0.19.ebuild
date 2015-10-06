# Distributed under the terms of the GNU General Public License v2

EAPI=5

DESCRIPTION="Secure tunnels to localhost"
SRC_URI="https://dl.ngrok.com/ngrok_${PV}_linux_amd64.zip"
HOMEPAGE="https://ngrok.com"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="app-arch/unzip"



S="${WORKDIR}"

src_install() {
		newbin ${P}-Linux-x86_64 ${MY_PN}
}

src_unpack(){
	unpack ${A}
}

src_install(){
	dobin ${WORKDIR}/ngrok
}
