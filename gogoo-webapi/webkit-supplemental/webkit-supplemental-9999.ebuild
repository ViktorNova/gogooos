# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit eutils cmake-utils git-2

DESCRIPTION="supplemental component to webkit"
HOMEPAGE="https://github.com/isis-project/WebKitSupplemental"
EGIT_REPO_URI="https://github.com/dudochkin-victor/WebKitSupplemental"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="nls"

RDEPEND="
    gogoo-webapi/cmake-modules-webos
    gogoo-webapi/luna-sysmgr-ipc
    >=dev-qt/qtcore-5.0.2
    >=dev-qt/qtwebkit-5.0.2
    >=dev-qt/qtdbus-5.0.2
    >=dev-qt/qtwidgets-5.0.2
    "
DEPEND="${RDEPEND}
	sys-devel/libtool
	dev-util/pkgconfig
	nls? ( sys-devel/gettext )"


src_configure() {
#	local mycmakeargs=(
#	    -DNO_TESTS=True 
#	    -DNO_UTILS=True 
#	    -DCMAKE_INSTALL_PREFIX=/
#	    -DWEBOS_INSTALL_ROOT:PATH=/
#	    -DCMAKE_BUILD_TYPE=Release
#	)

	cmake-utils_src_configure
}
