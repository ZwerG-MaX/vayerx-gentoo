# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit eutils games waf-utils

DESCRIPTION="Tongue-in-cheek dungeon crawl game. Client and Server."
HOMEPAGE="http://lipsofsuna.org/"
SRC_URI="mirror://sourceforge/${PN}/${PV}/${P}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-db/sqlite:3
	>=dev-lang/lua-5.1
	>=dev-games/ogre-1.7
	>=dev-games/ois-1.3
	media-libs/flac
	>=media-libs/glew-1.5
	>=media-libs/libsdl-1.2
	media-libs/libvorbis
	media-libs/libogg
	media-libs/mesa
	media-libs/openal
	>=media-libs/sdl-ttf-2.0
	>=net-libs/enet-1.2
	>=net-misc/curl-3
	sci-physics/bullet
	sys-fs/inotify-tools
"
RDEPEND="${DEPEND}"

src_prepare() {
	epatch "${FILESDIR}/${P}_ogre_overlay.patch"
}

src_configure() {
	waf-utils_src_configure \
		--disable-relpath \
		--enable-optimization \
		--bindir="${GAMES_BINDIR}" \
		--datadir="${GAMES_DATADIR}"
}

src_install() {
	dogamesbin .build/${PN} || die "Installation of gamesbinary failed"
	insinto "${GAMES_DATADIR}"/${PN}/
	doins -r data/* || die "Installation of game data failed"
	doicon misc/${PN}.svg || die "Installation of Icon failed"
	domenu misc/${PN}.desktop || die "Installation of desktop file failed"
	prepgamesdirs
}
