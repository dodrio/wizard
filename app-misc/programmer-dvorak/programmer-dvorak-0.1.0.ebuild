# Distributed under the terms of the GNU General Public License v2

EAPI=4

DESCRIPTION="Programmer Dvorak for kbd."
HOMEPAGE=""
GITHUB_USER="m31271n"
SRC_URI="https://github.com/${GITHUB_USER}/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="sys-apps/kbd"

src_install() {
	KEYMAPS_DEST_DIR="${D}/usr/share/keymaps/i386/dvorak"
	KEPMAPS_SRC_DIR="${S}/linux/kbd"
	install -d "${KEYMAPS_DEST_DIR}"
	install -m644 \
			"${KEPMAPS_SRC_DIR}/dvorak-programmer.map.gz" \
			"${KEPMAPS_SRC_DIR}/dvorak-programmer-swap_ctrl_caps.map.gz" \
			"${KEYMAPS_DEST_DIR}"
}
