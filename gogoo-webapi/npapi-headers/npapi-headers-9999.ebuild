# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit git-2

DESCRIPTION="cross-platform plugin architecture used by isis-project and WebKit"
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
        mkdir -p ${ED}/include/webkit/npapi
        cd ${WORKDIR}/${P}
	cp -f *.h ${ED}/include/webkit/npapi
}
