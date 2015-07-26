# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit eutils mount-boot

DESCRIPTION="Precompiled Kernel (Kernel Ready-to-Eat [KRE])"
HOMEPAGE="http://github.com/wizalado"
SRC_URI="http://cloud.stenote.com/funtoo/kernel/${PN}-${PV}.tar.xz"

RESTRICT="mirror strip"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="-* ~amd64"

src_compile()
{
	# Unset ARCH so that you don't get Makefile not found messages
	unset ARCH && return
}

src_install()
{
	# Install Kernel
	insinto /boot
	newins ${S}/kernel/System.map-curse-x86_64-${PV} \
		   System.map-curse-x86_64-${PV}
	newins ${S}/kernel/config-curse-x86_64-${PV} \
		   config-curse-x86_64-${PV}
	newins ${S}/kernel/initramfs-curse-x86_64-${PV} \
		   initramfs-curse-x86_64-${PV}
	newins ${S}/kernel/kernel-curse-x86_64-${PV} \
		   kernel-curse-x86_64-${PV}

	# Install Modules
	dodir /lib/modules
	cp -r ${S}/modules/${PV} ${D}/lib/modules
}
