# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit eutils qt4-r2 git-2

DESCRIPTION="web rendering process for the isis-browser"
HOMEPAGE="https://github.com/isis-project/BrowserServer"
EGIT_REPO_URI="https://github.com/isis-project/BrowserServer"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="nls"

RDEPEND="
    gogoo-webapi/cmake-modules-webos
    gogoo-webapi/luna-sysmgr-ipc
    dev-libs/yajl
    gogoo-webapi/libpbnjson
    gogoo-webapi/luna-service2
    gogoo-webapi/webkit-supplemental
    "
DEPEND="${RDEPEND}
	sys-devel/libtool
	dev-util/pkgconfig
	nls? ( sys-devel/gettext )"


src_configure() {
	sed -i "s,/include/Qt,/include/qt4/Qt," ${WORKDIR}/${P}/Makefile.Ubuntu
	sed -i "s,/include/ \\\,/include/qt4/ \\\," ${WORKDIR}/${P}/Makefile.Ubuntu
#	sed -i s,/include/ime,/usr/include/ime, ${WORKDIR}/${P}/desktop.pri	
#	sed -i s,/include/luna-sysmgr-common,/usr/include/luna-sysmgr-common, ${WORKDIR}/${P}/desktop.pri
#	sed -i "s/O_WRONLY | O_CREAT | O_TRUNC/O_WRONLY | O_CREAT | O_TRUNC, 0666/" ${WORKDIR}/${P}/Src/Main.cpp

}

src_compile(){
    emake -f Makefile.Ubuntu QT_INSTALL_PREFIX=/usr STAGING_INCDIR=/usr/include STAGING_LIBDIR=/usr/lib BUILD_TYPE=release || die
}
#src_install(){
	# Move header files to include dir
#	mkdir -p ${ED}usr/include/luna-sysmgr-common
#	cp ${WORKDIR}/${P}/include/*.h ${ED}usr/include/luna-sysmgr-common
#	mkdir -p ${ED}usr/lib/
#	mv ${WORKDIR}/${P}/release-x86/libLunaSysMgrCommon.* ${ED}usr/lib
#}