# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit git-2

DESCRIPTION="Enyo 1.0 applications: accounts, calculator, calendar, etc."
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
        mkdir -p ${ED}/usr/palm/applications
        mkdir -p ${ED}/etc/palm/db/kinds
        mkdir -p ${ED}/etc/palm/db/permissions
        mkdir -p ${ED}/etc/palm/activities
    
        for APP in ${WORKDIR}/${P}/com.palm.app.* ; do
	    cp -rf ${APP} ${ED}/usr/palm/applications/
	    cp -rf ${APP}/configuration/db/kinds/* ${ED}/etc/palm/db/kinds/ 2>/dev/null || true
	    cp -rf ${APP}/configuration/db/permissions/* ${ED}/etc/palm/db/permissions/ 2>/dev/null || true
	    cp -rf ${APP}/configuration/activities/* ${ED}/etc/palm/activities/ 2>/dev/null || true
        done

}