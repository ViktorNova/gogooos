# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit git-2

DESCRIPTION="JavaScript application framework emphasizing modularity and encapsulation"
HOMEPAGE="https://github.com/enyojs/${PN}-1.0"
EGIT_REPO_URI="https://github.com/enyojs/${PN}-1.0"
#EGIT_BRANCH="submissions/128.2"
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
	mkdir -p ${ED}usr/palm/frameworks/enyo/0.10/framework
        cp -rf ${WORKDIR}/${P}/framework/* ${ED}usr/palm/frameworks/enyo/0.10/framework
        cd ${ED}usr/palm/frameworks/enyo/
        # add symlink for enyo version 1.0 (which was 0.10)
        ln -sf -T 0.10 1.0
}