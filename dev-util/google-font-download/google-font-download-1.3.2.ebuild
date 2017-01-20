# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="A small shell script that allows you to download Google's web fonts to your local file system"
HOMEPAGE="https://github.com/neverpanic/google-font-download"
SRC_URI="https://github.com/neverpanic/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="BSD-2"
SLOT="0"
KEYWORDS="amd64"

RDEPEND="net-misc/curl
	>=app-shells/bash-4
	sys-apps/util-linux
	sys-apps/sed
	sys-apps/gawk
"

src_prepare() {
	# For EAPIs 6 and later, the default src_install function will check
	# Makefile.
	# This package's Makefile will do syntax check via shellcheck that
	# I don't wanna install, so... REMOVE Makefile.
	rm Makefile
	eapply_user
}

src_install() {
	dobin ${PN}
	dodoc README.md LICENSE
}
