# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit eutils qt4-r2 git-2

DESCRIPTION="WebAppMgr is responsible for running Enyo applications on webOS"
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
#	sed -i s,/include/sysmgr-ipc,/usr/include/sysmgr-ipc, ${WORKDIR}/${P}/desktop.pri	
#	sed -i s,/include/ime,/usr/include/ime, ${WORKDIR}/${P}/desktop.pri	
#	sed -i s,/include/luna-sysmgr-common,/usr/include/luna-sysmgr-common, ${WORKDIR}/${P}/desktop.pri
#	sed -i "s/O_WRONLY | O_CREAT | O_TRUNC/O_WRONLY | O_CREAT | O_TRUNC, 0666/" ${WORKDIR}/${P}/Src/Main.cpp
	eqmake4
}

src_compile(){
    emake -f Makefile.Ubuntu.Release || die
}
src_install(){
        mkdir -p ${ED}usr/lib/luna
        cp -f ${WORKDIR}/${P}/release-x86/WebAppMgr ${ED}usr/lib/luna/
        mkdir -p ${ED}usr/share/ls2/roles/prv
        mkdir -p ${ED}usr/share/ls2/roles/pub
        mkdir -p ${ED}usr/share/ls2/system-services
        mkdir -p ${ED}usr/share/ls2/services
        cp -f ${WORKDIR}/${P}/desktop-support/com.palm.webappmgr.json.prv ${ED}usr/share/ls2/roles/prv/com.palm.webappmgr.json
        cp -f ${WORKDIR}/${P}/desktop-support/com.palm.webappmgr.json.pub ${ED}usr/share/ls2/roles/pub/com.palm.webappmgr.json
        cp -f ${WORKDIR}/${P}/desktop-support/com.palm.webappmgr.service.prv ${ED}usr/share/ls2/system-services/com.palm.webappmgr.service
        cp -f ${WORKDIR}/${P}/desktop-support/com.palm.webappmgr.service.pub ${ED}usr/share/ls2/services/com.palm.webappmgr.service
}