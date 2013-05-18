# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit cmake-utils git-2

DESCRIPTION="Palm's Better Native JSON library"
HOMEPAGE="https://github.com/openwebos/${PN}"
EGIT_REPO_URI="https://github.com/openwebos/${PN}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="nls"

RDEPEND="
    gogoo-webapi/cmake-modules-webos"
DEPEND="${RDEPEND}
	sys-devel/libtool
	dev-util/pkgconfig
	nls? ( sys-devel/gettext )"


src_configure() {
	local mycmakeargs=(
	    -DWEBOS_INSTALL_ROOT:PATH=/
	)

	cmake-utils_src_configure
}
