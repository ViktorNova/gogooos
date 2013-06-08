# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit git-2

DESCRIPTION="Stubbed implementation of the com.palm.connectionmanager service"
HOMEPAGE="https://github.com/openwebos/${PN}"
EGIT_REPO_URI="https://github.com/openwebos/${PN}"
#EGIT_BRANCH="submissions/2"

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


src_install(){
	mkdir -p ${ED}/usr/palm/services/com.palm.connectionmanager
	mkdir -p ${ED}/usr/share/ls2/system-services
	mkdir -p ${ED}/usr/share/ls2/services
	mkdir -p ${ED}/usr/share/ls2/roles/prv
	mkdir -p ${ED}/usr/share/ls2/roles/pub
	
	cd ${WORKDIR}/${P}
        cp -rf *.json *.js ${ED}/usr/palm/services/com.palm.connectionmanager
        cp -rf files/sysbus/*.json ${ED}/usr/share/ls2/roles/prv
        cp -rf files/sysbus/*.json ${ED}/usr/share/ls2/roles/pub
        #NOTE: services go in ${ED}/usr/share/ls2/system-services, which is linked from /usr/share/ls2/system-services
        cp -rf desktop-support/*.service ${ED}/usr/share/ls2/system-services
        cp -rf desktop-support/*.service ${ED}/usr/share/ls2/services
}
