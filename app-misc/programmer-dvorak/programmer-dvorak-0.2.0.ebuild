# Distributed under the terms of the GNU General Public License v2

EAPI=4

DESCRIPTION="Programmer Dvorak Keymap"
HOMEPAGE=""
GITHUB_USER="m31271n"
SRC_URI="https://github.com/${GITHUB_USER}/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="X"

src_install() {
	KBD_DEST_DIR="${D}/usr/share/keymaps/i386/dvorak"
	KBD_SRC_DIR="${S}/kbd"
	install -d "${KBD_DEST_DIR}"
	install -m644 \
			"${KBD_SRC_DIR}/dvorak-programmer.map.gz" \
			"${KBD_DEST_DIR}"

    if use X; then
        XORG_DEST_DIR="${D}/etc/X11/xorg.conf.d"
        XORG_SRC_DIR="${S}/xorg"
        install -d "${XORG_DEST_DIR}"
        install -m644 \
                "${XORG_SRC_DIR}/10keyboard.conf" \
                "${XORG_DEST_DIR}"
    fi
}
