# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit eutils qt4-r2 git-2

DESCRIPTION="Provides header files and source code common to luna-sysmgr and webappmanager"
HOMEPAGE="https://github.com/openwebos/${PN}"
EGIT_REPO_URI="https://github.com/dudochkin-victor/${PN}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="nls"

RDEPEND="
    gogoo-webapi/cmake-modules-webos
    gogoo-webapi/luna-sysmgr-ipc
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

	eqmake4
}

src_compile(){
    emake -f Makefile.Ubuntu.Release || die
}
src_install(){
	# Move header files to include dir
	mkdir -p ${ED}usr/include/luna-sysmgr-common
	cp ${WORKDIR}/${P}/include/*.h ${ED}usr/include/luna-sysmgr-common
	mkdir -p ${ED}usr/lib/
	mv ${WORKDIR}/${P}/release-x86/libLunaSysMgrCommon.* ${ED}usr/lib
}