# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit git-r3

DESCRIPTION="A black theme for GTK 2"
HOMEPAGE="https://github.com/wizalado/Darklight"

SRC_URI=""
EGIT_REPO_URI="https://github.com/wizalado/${PN}.git"
EGIT_COMMIT="3cc3211210dc721cf6569e7de2f01abbd2ed0dee"
KEYWORDS="~amd64"

LICENSE="MIT"
SLOT="0"

DEPEND=""
RDEPEND="x11-themes/gtk-engines"

src_install() {
	insinto /usr/share/themes/Darklight
	doins -r gtk-2.0
}
