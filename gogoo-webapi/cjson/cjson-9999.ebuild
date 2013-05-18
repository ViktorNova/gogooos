# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit autotools-utils eutils git-2

DESCRIPTION="open-source json-c library used by webOS"
HOMEPAGE="https://github.com/openwebos/${PN}"
EGIT_REPO_URI="https://github.com/openwebos/${PN}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="nls static-libs"

RDEPEND=""
DEPEND="${RDEPEND}
	sys-devel/libtool
	dev-util/pkgconfig
	nls? ( sys-devel/gettext )"


src_prepare() {
    eautoreconf
}

src_configure() {
	econf \
		$(use_enable static-libs static) 
	BUILD_DIR="${WORKDIR}/${P}"
}
