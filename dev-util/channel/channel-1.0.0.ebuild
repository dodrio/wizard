# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="OpenSSH based localtunnel."
HOMEPAGE="https://github.com/m31271n/channel"
SRC_URI="https://github.com/m31271n/channel/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="net-misc/openssh"
RDEPEND="${DEPEND}"

src_install() {
	dobin channel
	dodoc README.md LICENSE
}
