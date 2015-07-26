# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit eutils mount-boot

DESCRIPTION="Precompiled Kernel (Kernel Ready-to-Eat [KRE])"
EXTRAVERSION="-1~exp1"
HOMEPAGE="http://github.com/wizalado"
SRC_URI="http://cloud.stenote.com/funtoo/kernel/${PN}-${PV}${EXTRAVERSION}.tar.xz"

RESTRICT="mirror strip"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="-* ~amd64"

S=${S}${EXTRAVERSION}

src_compile()
{
	# Unset ARCH so that you don't get Makefile not found messages
	unset ARCH && return
}


src_install()
{
	# Install Kernel
	insinto /boot
	newins ${S}/kernel/System.map-curse-x86_64-${PV}${EXTRAVERSION} \
		   System.map-curse-x86_64-${PV}${EXTRAVERSION}
	newins ${S}/kernel/config-curse-x86_64-${PV}${EXTRAVERSION} \
		   config-curse-x86_64-${PV}${EXTRAVERSION}
	newins ${S}/kernel/initramfs-curse-x86_64-${PV}${EXTRAVERSION} \
		   initramfs-curse-x86_64-${PV}${EXTRAVERSION}
	newins ${S}/kernel/kernel-curse-x86_64-${PV}${EXTRAVERSION} \
		   kernel-curse-x86_64-${PV}${EXTRAVERSION}

	# Install Modules
	dodir /lib/modules
	cp -r ${S}/modules/${PV}${EXTRAVERSION} ${D}/lib/modules
}
