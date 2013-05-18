# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit cmake-utils git-2

DESCRIPTION="collection of APIs for separating running programs"
HOMEPAGE="https://github.com/openwebos/${PN}"
EGIT_REPO_URI="https://github.com/openwebos/${PN}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="nls"

RDEPEND="
    gogoo-webapi/cmake-modules-webos
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

src_install() {
	cmake-utils_src_install
	# Move header files to include dir
	mv ${ED}usr/lib/libsandbox.a ${ED}usr/lib/libsandbox-webos.a || mv ${ED}usr/lib64/libsandbox.a ${ED}usr/lib64/libsandbox-webos.a
}

pkg_preinst() {
        sed -i s,-lsandbox,-lsandbox-webos, ${D}usr/share/pkgconfig/*.pc
}


