# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit autotools eutils systemd git-r3

DESCRIPTION="A lightweight secured SOCKS5 proxy for embedded devices and low end boxes"
HOMEPAGE="https://github.com/shadowsocksr/shadowsocksr-libev"

#repack with git submodule populated: libbloom, libcork, libipset
EGIT_REPO_URI="https://github.com/shadowsocksr/shadowsocksr-libev.git"
EGIT_COMMIT="bf324d848cffa0b5b567cfa6d31c0fb1ec096ec6"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="debug doc"

RDEPEND="net-libs/mbedtls
	>=dev-libs/libsodium-1.0.8
	dev-libs/libev
	net-libs/udns
	dev-libs/libpcre
	"
DEPEND="${RDEPEND}
	sys-kernel/linux-headers
	doc? (
		app-text/asciidoc
		app-text/xmlto
	)
	"

src_prepare() {
	default

	# replace ss- with ssr-
	sed -i 's/ss-/ssr-/g' $(grep -rl 'ss-')
	sed -i 's/essr-/ess-/g' $(grep -rl 'essr-')
	sed -i 's/ossr-/oss-/g' $(grep -rl 'ossr-')

	# replace shadowsocks- with shadowsocksr-
	sed -i 's/shadowsocks/shadowsocksr/g' $(grep -rl 'shadowsocks')

	# rename file
	find . -name 'ss-*' -exec rename ss- ssr- {} \;
	find . -name 'shadowsocks*' -exec rename shadowsocks shadowsocksr {} \;

}

src_configure() {
	local myconf=" \
			   $(use_enable debug assert) \
	   "
	use doc || myconf+="--disable-documentation"
	econf ${myconf}
}


src_install() {
	default
	prune_libtool_files --all

	dodir "/etc/${PN}"
	insinto "/etc/${PN}"
	newins "${FILESDIR}/shadowsocksr.json" shadowsocksr.json

	dodoc -r acl

	systemd_newunit "${FILESDIR}/${PN}-local_at.service" "${PN}-local@.service"
	systemd_newunit "${FILESDIR}/${PN}-server_at.service" "${PN}-server@.service"
	systemd_newunit "${FILESDIR}/${PN}-redir_at.service" "${PN}-redir@.service"
	systemd_newunit "${FILESDIR}/${PN}-tunnel_at.service" "${PN}-tunnel@.service"
}
