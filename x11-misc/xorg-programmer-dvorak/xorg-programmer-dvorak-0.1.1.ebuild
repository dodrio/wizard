# Distributed under the terms of the GNU General Public License v2

EAPI=4

DESCRIPTION="Programmer Dvorak configuration for X."
HOMEPAGE=""
GITHUB_USER="geekfrog"
SRC_URI="https://github.com/${GITHUB_USER}/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="x11-misc/xkeyboard-config"

src_install() {
	DEST_DIR="${D}/etc/X11/xorg.conf.d"
	SRC_DIR="${S}"
	install -d "${DEST_DIR}"
	install -m644 \
			"${SRC_DIR}/10keyboard.conf" \
			"${DEST_DIR}"
}
