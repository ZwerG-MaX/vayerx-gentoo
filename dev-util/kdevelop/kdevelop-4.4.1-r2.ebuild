# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

KDE_LINGUAS="bs ca ca@valencia da de el en_GB es et fi fr gl it nb nds nl pl pt
pt_BR ru sl sv th uk zh_CN zh_TW"
VIRTUALX_REQUIRED=test

inherit kde4-base

DESCRIPTION="Integrated Development Environment for Unix, supporting KDE/Qt, C/C++ and many other languages."
LICENSE="GPL-2 LGPL-2"
IUSE="+cmake +cxx debug okteta qthelp"

if [[ $PV == *9999* ]]; then
	KEYWORDS=""
else
	KEYWORDS="~amd64 ~ppc ~ppc64 ~x86"
fi

DEPEND="
	$(add_kdebase_dep ksysguard)
	$(add_kdebase_dep libkworkspace)
	okteta? ( $(add_kdebase_dep okteta) )
	qthelp? ( x11-libs/qt-assistant:4 )
"
RDEPEND="${DEPEND}
	$(add_kdebase_dep kapptemplate)
	dev-qt/qtdeclarative:4[webkit]
	cxx? ( >=sys-devel/gdb-7.0[python] )
"
RESTRICT="test"
# see bug 366471

PATCHES=( "${FILESDIR}/${P}_fix_foreach.patch" )

src_configure() {
	mycmakeargs=(
		$(cmake-utils_use_build cmake)
		$(cmake-utils_use_build cmake cmakebuilder)
		$(cmake-utils_use_build cxx cpp)
		$(cmake-utils_use_with okteta LibKasten)
		$(cmake-utils_use_with okteta LibOkteta)
		$(cmake-utils_use_with okteta LibOktetaKasten)
		$(cmake-utils_use_build qthelp)
	)

	kde4-base_src_configure
}
