# Distributed under the terms of the GNU General Public License v2

EAPI=6

MAIN_VERSION=$(echo ${PV} | cut -d . -f 1,2)

DESCRIPTION="A fast, multi-threaded, multi-user SQL database server"
HOMEPAGE="https://dev.mysql.com/"
SRC_URI="https://dev.mysql.com/get/Downloads/MySQL-${MAIN_VERSION}/mysql-${PV}-linux-glibc2.5-x86_64.tar.gz"

KEYWORDS="~amd64"
LICENSE="GPL-2"
SLOT="0"
IUSE=""

RDEPEND="
"

S="${WORKDIR}/mysql-${PV}-linux-glibc2.5-x86_64"

src_install() {
	mkdir -p ${D}/opt/mysql
	cp -R ${S}/* ${D}/opt/mysql || die "install failed!"

	for bin in $(ls ${D}/opt/mysql/bin); do
		dosym /opt/mysql/bin/${bin} /usr/bin/${bin}
	done
}
