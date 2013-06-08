# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit git-2

DESCRIPTION="loadable frameworks: calendar, contacts, globalisation"
HOMEPAGE="https://github.com/openwebos/${PN}"
EGIT_REPO_URI="https://github.com/openwebos/${PN}"
#EGIT_BRANCH="submissions/2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="nls"

RDEPEND="
    gogoo-webapi/cmake-modules-webos
    gogoo-webapi/foundation-frameworks
    gogoo-webapi/loadable-frameworks
    gogoo-webapi/mojoservice-frameworks
    "
DEPEND="${RDEPEND}
	sys-devel/libtool
	dev-util/pkgconfig
	nls? ( sys-devel/gettext )"


src_install(){
        mkdir -p ${ED}/usr/palm/services
        mkdir -p ${ED}/etc/palm/db/kinds
        mkdir -p ${ED}/etc/palm/db/permissions
        mkdir -p ${ED}/etc/palm/activities
        mkdir -p ${ED}/usr/share/ls2/system-services
	mkdir -p ${ED}/usr/share/ls2/services
	
	cd ${WORKDIR}/${P}
        for SERVICE in com.palm.service.* ; do
	    cp -rf ${SERVICE} ${ED}/usr/palm/services/
	    cp -rf ${SERVICE}/db/kinds/* ${ED}/etc/palm/db/kinds/ 2>/dev/null || true
	    cp -rf ${SERVICE}/db/permissions/* ${ED}/etc/palm/db/permissions/ 2>/dev/null || true
	    cp -rf ${SERVICE}/activities/* ${ED}/etc/palm/activities/ 2>/dev/null || true
	    cp -rf ${SERVICE}/files/sysbus/*.json ${ED}/usr/share/ls2/roles/prv 2>/dev/null || true
	    #NOTE: services go in $ROOTFS/usr/share/ls2/system-services, which is linked from /usr/share/ls2/system-services
	    cp -rf ${SERVICE}/desktop-support/*.service ${ED}/usr/share/ls2/system-services 2>/dev/null || true
	done

	# accounts service is public, so install its service file in public service dir
	cp -rf com.palm.service.accounts/desktop-support/*.service ${ED}/usr/share/ls2/services

	# install accounts service desktop credentials db kind
	cp -rf com.palm.service.accounts/desktop/com.palm.account.credentials ${ED}/etc/palm/db/kinds

	# install account-templates service
	mkdir -p ${ED}/usr/palm/public/accounts
	cp -rf account-templates/palmprofile/com.palm.palmprofile ${ED}/usr/palm/public/accounts/

	# install tempdb kinds and permissions
	mkdir -p ${ED}/etc/palm/tempdb/kinds
	mkdir -p ${ED}/etc/palm/tempdb/permissions
	cp -rf com.palm.service.accounts/tempdb/kinds/* ${ED}/etc/palm/tempdb/kinds/ 2>/dev/null || true
	cp -rf com.palm.service.accounts/tempdb/permissions/* ${ED}/etc/palm/tempdb/permissions/ 2>/dev/null || true
}