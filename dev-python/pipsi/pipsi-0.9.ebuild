# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_4 )

inherit distutils-r1

DESCRIPTION="Wraps pip and virtualenv to install scripts"
HOMEPAGE="https://pypi.python.org/pypi/pipsi/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="dev-python/click[${PYTHON_USEDEP}]
dev-python/virtualenv[${PYTHON_USEDEP}]
"
