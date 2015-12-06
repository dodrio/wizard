# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit git-r3

DESCRIPTION="anyenv - all in one for **env"
HOMEPAGE="https://github.com/m31271n/anyenv"

SRC_URI=""
EGIT_REPO_URI="https://github.com/m31271n/${PN}.git"
EGIT_COMMIT="ff22b6c8168228428ccf14fca51ed448fc6b473f"
KEYWORDS="~amd64"

LICENSE="MIT"
SLOT="0"

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	cd ${WORKDIR}/${PF}
	echo '
export ANYENV_ROOT=/opt/anyenv
export ANYENV_ENVS_ROOT=${HOME}/.anyenv_envs
eval "$(anyenv init -)"
' > anyenv.sh
}

src_install() {
	exeinto /etc/profile.d/
	doexe anyenv.sh

	exeinto /opt/${PN}/libexec/
	doexe libexec/*

	insinto /opt/${PN}/
	doins -r completions share

	dosym /opt/${PN}/libexec/anyenv /usr/bin/anyenv
}
