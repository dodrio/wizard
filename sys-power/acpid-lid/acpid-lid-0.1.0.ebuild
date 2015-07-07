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
	EVENTS_SRC_DIR="${S}/events"
	EVENTS_DEST_DIR="${D}/etc/acpi/events"

	install -d "${EVENTS_DEST_DIR}"
	install -m644 \
			"${EVENTS_SRC_DIR}/lid" \
			"${EVENTS_DEST_DIR}"

	ACTIONS_SRC_DIR="${S}/actions"
	ACTIONS_DEST_DIR="${D}/etc/acpi/actions"

	install -d "${ACTIONS_DEST_DIR}"
	install -m755 \
			"${ACTIONS_SRC_DIR}/lid.sh" \
			"${ACTIONS_DEST_DIR}"

}
