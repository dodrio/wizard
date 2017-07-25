# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="WeChat Web Devtools for Linux"
HOMEPAGE="https://github.com/m31271n/wechat_web_devtools"
SRC_URI="https://github.com/m31271n/${PN}/archive/${PV}.tar.gz"

KEYWORDS="~amd64"
LICENSE=""
SLOT="0"
IUSE=""

RDEPEND="
	>=app-emulation/wine-2.0
"

S="${WORKDIR}/${PN}-${PV}"

src_install() {
	mkdir -p ${D}/opt/${PN}
	cp -rT ${S} ${D}/opt/${PN}
	dosym /opt/${PN}/${PN} /usr/bin/${PN}
}
