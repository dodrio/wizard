# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit eutils toolchain-funcs

DESCRIPTION="Lightweight bash package manager"
HOMEPAGE="https://github.com/bpkg/bpkg"
SRC_URI="https://github.com/bpkg/bpkg/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="app-shells/bash"
RDEPEND="${DEPEND}"

src_install() {
	PREFIX="${D}/usr" ./setup.sh
	dodoc README.md LICENSE
}
