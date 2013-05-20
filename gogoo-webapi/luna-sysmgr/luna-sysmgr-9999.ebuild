# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit eutils qt4-r2 git-2

DESCRIPTION="webOS System Manager, which is a key webOS component "
HOMEPAGE="https://github.com/openwebos/${PN}"
EGIT_REPO_URI="https://github.com/dudochkin-victor/${PN}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="nls"

RDEPEND="
    gogoo-webapi/cmake-modules-webos
    gogoo-webapi/luna-sysmgr-ipc
    gogoo-webapi/luna-sysmgr-common
    gogoo-webapi/luna-webkit-api
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
#	sed -i s,/include/ime,/usr/include/ime, ${WORKDIR}/${P}/desktop.pri	
#	sed -i s,/include/luna-sysmgr-common,/usr/include/luna-sysmgr-common, ${WORKDIR}/${P}/desktop.pri	
	eqmake4
}

src_compile(){
    emake -f Makefile.Ubuntu || die
}

src_install(){
	# Move header files to include dir
	#mkdir -p ${ED}usr/include/luna-sysmgr-common
	#cp ${WORKDIR}/${P}/include/*.h ${ED}usr/include/luna-sysmgr-common
	#mkdir -p ${ED}usr/lib/
	#mv ${WORKDIR}/${P}/release-x86/libLunaSysMgrCommon.* ${ED}usr/lib
	
	mkdir -p ${ED}usr/lib/sysmgr-images
        cp -frad ${WORKDIR}/${P}/images/* ${ED}usr/lib/sysmgr-images
        #cp -f debug-x86/LunaSysMgr $LUNA_STAGING/lib
        #cp -f debug-x86/LunaSysMgr $LUNA_STAGING/bin

        # Note: ls2/roles/prv/com.palm.luna.json refers to /usr/lib/luna/LunaSysMgr and ls2 uses that path to match role files.
        mkdir -p ${ED}usr/lib/luna
        cp -f ${WORKDIR}/${P}/debug-x86/LunaSysMgr ${ED}usr/lib/luna/LunaSysMgr

        #TODO: (temporary) remove old luna-sysmgr user scripts from $BASE
#        rm -f $BASE/service-bus.sh
#        rm -f $BASE/run-luna-sysmgr.sh
#        rm -f $BASE/install-luna-sysmgr.sh

        mkdir -p ${ED}usr/lib/luna/system/luna-applauncher
        #cp -f ${WORKDIR}/${P}/desktop-support/appinfo.json ${ED}usr/lib/luna/system/luna-applauncher/appinfo.json
	mkdir -p ${ED}usr/share/ls2/roles/prv
	mkdir -p ${ED}usr/share/ls2/roles/pub
	mkdir -p ${ED}usr/share/ls2/system-services
	mkdir -p ${ED}usr/share/ls2/services
        cp -f ${WORKDIR}/${P}/desktop-support/com.palm.luna.json.prv ${ED}usr/share/ls2/roles/prv/com.palm.luna.json
        cp -f ${WORKDIR}/${P}/desktop-support/com.palm.luna.json.pub ${ED}usr/share/ls2/roles/pub/com.palm.luna.json
        cp -f ${WORKDIR}/${P}/desktop-support/com.palm.luna.service.prv ${ED}usr/share/ls2/system-services/com.palm.luna.service
        cp -f ${WORKDIR}/${P}/desktop-support/com.palm.luna.service.pub ${ED}usr/share/ls2/services/com.palm.luna.service

        mkdir -p ${ED}etc/palm/pubsub_handlers
        cp -f ${WORKDIR}/${P}/service/com.palm.appinstaller.pubsub ${ED}etc/palm/pubsub_handlers/com.palm.appinstaller

        cp -f ${WORKDIR}/${P}/conf/default-exhibition-apps.json ${ED}etc/palm/default-exhibition-apps.json
        cp -f ${WORKDIR}/${P}/conf/default-launcher-page-layout.json ${ED}etc/palm/default-launcher-page-layout.json
        cp -f ${WORKDIR}/${P}/conf/defaultPreferences.txt ${ED}etc/palm/defaultPreferences.txt
        cp -f ${WORKDIR}/${P}/conf/luna.conf ${ED}etc/palm/luna.conf
        cp -f ${WORKDIR}/${P}/conf/luna-desktop.conf ${ED}etc/palm/luna-platform.conf
        cp -f ${WORKDIR}/${P}/conf/lunaAnimations.conf ${ED}etc/palm/lunaAnimations.conf
        cp -f ${WORKDIR}/${P}/conf/notificationPolicy.conf ${ED}etc/palm//notificationPolicy.conf

        mkdir -p ${ED}usr/lib/luna/customization
        cp -f ${WORKDIR}/${P}/conf/default-exhibition-apps.json ${ED}usr/lib/luna/customization/default-exhibition-apps.json

        mkdir -p ${ED}usr/palm/sounds
        cp -f ${WORKDIR}/${P}/sounds/* ${ED}usr/palm/sounds

        mkdir -p ${ED}etc/palm/luna-applauncher
        cp -f ${WORKDIR}/${P}/desktop-support/appinfo.json ${ED}etc/palm/luna-applauncher

        mkdir -p ${ED}etc/palm/launcher3
        cp -rf ${WORKDIR}/${P}/conf/launcher3/* ${ED}etc/palm/launcher3

        mkdir -p ${ED}etc/palm/schemas
        cp -rf ${WORKDIR}/${P}/conf/*.schema ${ED}etc/palm/schemas

        mkdir -p ${ED}etc/palm/db_kinds
        cp -f ${WORKDIR}/${P}/mojodb/com.palm.securitypolicy ${ED}etc/palm/db_kinds
        cp -f ${WORKDIR}/${P}/mojodb/com.palm.securitypolicy.device ${ED}etc/palm/db_kinds
        mkdir -p ${ED}etc/palm/db/permissions
        cp -f ${WORKDIR}/${P}/mojodb/com.palm.securitypolicy.permissions ${ED}etc/palm/db/permissions/com.palm.securitypolicy

        mkdir -p ${ED}usr/palm/sysmgr/images
        cp -fr ${WORKDIR}/${P}/images/* ${ED}usr/palm/sysmgr/images
        mkdir -p ${ED}usr/palm/sysmgr/localization
        mkdir -p ${ED}usr/palm/sysmgr/low-memory
        cp -frad ${WORKDIR}/${P}/low-memory/* ${ED}usr/palm/sysmgr/low-memory
        mkdir -p ${ED}usr/palm/sysmgr/uiComponents
        cp -frad ${WORKDIR}/${P}/uiComponents/* ${ED}usr/palm/sysmgr/uiComponents
}