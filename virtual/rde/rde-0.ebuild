# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=3

DESCRIPTION="Virtual for the razor destkop environment. It's just a collection of packages."
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="
x11-base/xorg-server
x11-misc/programmer-dvorak
ein-misc/xinit-setting

x11-themes/darklight
x11-themes/vanilla-dmz-xcursors
ein-misc/vanilla-dmz-xcursors-setting

x11-apps/xsetroot

app-i18n/fcitx
app-i18n/fcitx-configtool
media-fonts/wqy-zenhei

x11-misc/razormenu
x11-misc/razorstatus
x11-terms/mst
x11-misc/wmname
x11-wm/razor
"
