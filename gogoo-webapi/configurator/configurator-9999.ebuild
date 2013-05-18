# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit cmake-utils git-2

DESCRIPTION="Creates the database schema for webos Applications"
HOMEPAGE="https://github.com/openwebos/${PN}"
EGIT_REPO_URI="https://github.com/openwebos/${PN}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="nls"

RDEPEND="
    gogoo-webapi/cmake-modules-webos
    gogoo-webapi/luna-service2
    >=dev-libs/glib-2.32.4
    gogoo-webapi/db8
    "
DEPEND="${RDEPEND}
	sys-devel/libtool
	dev-util/pkgconfig
	nls? ( sys-devel/gettext )"


src_configure() {
	local mycmakeargs=(
	    -DNO_TESTS=True 
	    -DNO_UTILS=True 
	    -DCMAKE_INSTALL_PREFIX=/
	    -DWEBOS_INSTALL_ROOT:PATH=/
	    -DCMAKE_BUILD_TYPE=Release
	)

	cmake-utils_src_configure
}
