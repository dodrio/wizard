# Distributed under the terms of the GNU General Public License v2

EAPI=6
MY_P=nodec-v${PV}-linux-x64

DESCRIPTION="Ahead-of-time (AOT) Compiler designed for Node.js, that just works."
HOMEPAGE="https://github.com/pmq20/node-compiler"
SRC_URI="http://p.tb.cn/rmsportal_8554_${MY_P}.gz -> ${MY_P}.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="
	>=sys-fs/squashfs-tools-4.3
	>=sys-devel/gcc-4.8.2
	>=dev-lang/python-2.6
	>=sys-devel/make-3.81
"
DEPEND="${RDEPEND}"

S=${WORKDIR}

src_install() {
	exeinto /usr/bin
	newexe ${MY_P} nodec
}
