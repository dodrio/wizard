# Distributed under the terms of the GNU General Public License v2

EAPI=4

DESCRIPTION="dircolors-setting"
HOMEPAGE=""
GITHUB_USER="m31271n"
SRC_URI="https://github.com/${GITHUB_USER}/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RDEPEND="sys-apps/coreutils"

src_install() {
	insinto /etc/
	doins dir_colors

	exeinto /etc/profile.d/
	doexe dircolors.sh
}
