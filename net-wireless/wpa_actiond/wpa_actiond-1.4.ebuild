# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit eutils git-2

EAPI=4

DESCRIPTION="wpa_supplicant interface to handle connection events"
HOMEPAGE="https://projects.archlinux.org/wpa_actiond.git/"
EGIT_REPO_URI="git://projects.archlinux.org/wpa_actiond.git"
EGIT_COMMIT="7a6b8cd72fcfdc907f2f746cf5604604f9cf2b30"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="net-wireless/wpa_supplicant"
RDEPEND="${DEPEND}"

src_prepare() {
	epatch_user
}

src_install() {
	dobin ${PN}
}
