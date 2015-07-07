# Distributed under the terms of the GNU General Public License v2

EAPI=4

DESCRIPTION="Laptop lid event handler for acpid."
HOMEPAGE=""
GITHUB_USER="wizalado"
SRC_URI="https://github.com/${GITHUB_USER}/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RDEPEND="sys-power/acpid"

src_install() {
	insinto /etc/acpi/events
	doins events/*

	insinto /etc/acpi/actions
	doins actions/*
}
