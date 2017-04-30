# Distributed under the terms of the GNU General Public License v2

EAPI=4

DESCRIPTION="doxil-chromium"
HOMEPAGE=""
GITHUB_USER="doxil"
SRC_URI="https://github.com/${GITHUB_USER}/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RDEPEND="app-emulation/docker"

src_prepare() {
	sed -i -e 's/\/path\/to/\/usr\/bin/g' ${WORKDIR}/chromium.desktop.example
}

src_install() {
	insinto /usr/share/applications
	newins chromium.desktop.example chromium.desktop

	exeinto /usr/bin
	doexe chromium
}
