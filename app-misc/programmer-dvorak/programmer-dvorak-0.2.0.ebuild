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
	insinto /usr/share/keymaps/i386/dvorak
	doins kbd/dvorak-programmer.map.gz

	if use X; then
		insinto /etc/X11/xorg.conf.d
		doins xorg/10keyboard.conf
	fi
}
