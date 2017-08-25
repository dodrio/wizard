# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 )

inherit check-reqs font python-single-r1

DESCRIPTION="Collection of fonts that are patched to include a high number of glyphs (icons)."
HOMEPAGE="http://nerdfonts.com/"
SRC_URI="https://github.com/ryanoasis/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="
	${DEPEND}
	media-libs/fontconfig
"

FONT_CONF=( "${S}"/10-nerd-font-symbols.conf )
FONT_S=${S}
FONT_SUFFIX="otf ttf"

pkg_pretend() { 
	
	CHECKREQS_DISK_BUILD="600M"

	check-reqs_pkg_setup

}

src_prepare() { 
	
	default

	# move all patched font files to a single directory so font_src_install works

	find patched-fonts/ \( -name '*.otf' -o -name '*.ttf' \) -exec mv {} . \; || die "Finding fonts failed."

}

src_install() { 

	echo "Installing fonts into /usr/share/fonts - this might take a while."	
	font_src_install 

	# Installing font-patcher via an ebuild is hard, because paths are hardcoded differently 
	# in .sh files. You can still get it and use it by git cloning the nerd-font project and 
	# running it from the cloned directory. 
	# https://github.com/ryanoasis/nerd-fonts

	dodoc readme.md

}

pkg_postinst() { 

	elog "You might have to enable 50-user.conf and 10-nerd-font-symbols.conf by using "
	elog "eselect fontconfig"

}
