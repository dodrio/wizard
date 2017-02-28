# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit eutils toolchain-funcs git-r3

DESCRIPTION="A style to bend Qt applications to look like they belong into GNOME Shell."
HOMEPAGE="https://github.com/MartinBriza/adwaita-qt"
EGIT_REPO_URI="https://github.com/MartinBriza/adwaita-qt.git"
EGIT_REPO_COMMIT="1bdf31b7b3aea9e39035939d78942c4e491d0f80"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	dev-qt/qtcore
"
RDEPEND="${DEPEND}"

src_prepare() {
	mkdir build-qt5
	pushd build-qt5
	cmake .. \
		  -DCMAKE_BUILD_TYPE=Release \
		  -DCMAKE_INSTALL_PREFIX=/usr
	popd
}

src_compile() {
	emake -C build-qt5
}

src_install() {
	emake install DESTDIR=${D} -C build-qt5
	dodoc README.md
}
