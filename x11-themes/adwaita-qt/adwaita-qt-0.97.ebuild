# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit eutils toolchain-funcs

DESCRIPTION="A style to bend Qt applications to look like they belong into GNOME Shell."
HOMEPAGE="https://github.com/MartinBriza/adwaita-qt"
GITHUB_USER="MartinBriza"
SRC_URI="https://github.com/${GITHUB_USER}/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	dev-qt/qtcore
"
RDEPEND="${DEPEND}"

src_prepare() {
	mkdir build-qt4
	mkdir build-qt5

	pushd build-qt4
	cmake .. \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=${D}/usr \
		-DUSE_QT4=ON
	popd

	pushd build-qt5
	cmake .. \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=${D}/usr
        popd
}

src_compile() {
	emake -C build-qt4
	emake -C build-qt5
}

src_install() {
        emake install -C build-qt4
        emake install -C build-qt5
        dodoc README.md
}
