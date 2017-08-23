# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Help you generate /etc/portage/package.* via /etc/portage/package.yaml"
HOMEPAGE="https://github.com/m31271n/portage-package-helper"
SRC_URI="https://github.com/m31271n/portage-package-helper/archive/${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"

DEPEND="net-libs/nodejs"
RDEPEND="${DEPEND}"

SHARE=/usr/share/${PN}
src_install() {
	npm install

	insinto ${SHARE}
	doins -r *

	exeinto ${SHARE}
	doexe index.js

	dosym ${SHARE}/index.js /usr/bin/pph

	dodoc README.md
}
