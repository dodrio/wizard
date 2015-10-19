# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit git-r3

DESCRIPTION="A black theme for GTK 2"
HOMEPAGE="https://github.com/wizalado/Darklight"

SRC_URI=""
EGIT_REPO_URI="https://github.com/wizalado/${PN}.git"
EGIT_COMMIT="a341fdb8d303cbc0b071ad43364c352e53571169"
KEYWORDS="~amd64"

LICENSE="MIT"
SLOT="0"

DEPEND=""
RDEPEND="x11-themes/gtk-engines"

src_install() {
	insinto /usr/share/themes/Darklight
	doins -r gtk-2.0
}
