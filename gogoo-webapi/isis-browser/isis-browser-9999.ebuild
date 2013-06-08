# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit git-2

DESCRIPTION="enyo browser app for webOS"
HOMEPAGE="https://github.com/isis-project/${PN}"
EGIT_REPO_URI="https://github.com/isis-project/${PN}"
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
        mkdir -p ${ED}/etc/palm/db/kinds
	mkdir -p ${ED}/etc/palm/db/permissions
	mkdir -p ${ED}/usr/palm/applications/com.palm.app.browser
	cd ${WORKDIR}/${P}
	cp -rf * ${ED}/usr/palm/applications/com.palm.app.browser
        rm -rf ${ED}/usr/palm/applications/com.palm.app.browser/db/*
        cp -rf db/kinds/* ${ED}/etc/palm/db/kinds/ 2>/dev/null || true
        cp -rf db/permissions/* ${ED}/etc/palm/db/permissions/ 2>/dev/null || true
}
