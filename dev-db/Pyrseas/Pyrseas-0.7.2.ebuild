# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python2_7 python3_4 )

inherit distutils-r1

DESCRIPTION="Framework and utilities to upgrade and maintain databases"
HOMEPAGE="http://pyrseas.readthedocs.org"

SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
KEYWORDS="~amd64 ~x86"

LICENSE="BSD"
SLOT="0"
IUSE=""

DEPEND="dev-python/setuptools"

RDEPEND="${DEPEND}
	dev-db/postgresql
	dev-python/pyyaml
"
# planned:
#	dev-python/werkzeug
#	dev-python/jinja