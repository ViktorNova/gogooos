# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit gnome2-utils qt4-r2

DESCRIPTION="MeeGo UX Theme"
HOMEPAGE="https://github.com/dudochkin-victor/${PN}"
SRC_URI="https://github.com/dudochkin-victor/${PN}/tarball/${PV} -> ${P}.tar.gz"
S="${WORKDIR}/dudochkin-victor-${PN}-a289ebb"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="nls"

#BuildRequires:  pkgconfig(QtCore)

RDEPEND="
	dev-qt/qtcore
	"
DEPEND="${RDEPEND}
	dev-util/intltool
	dev-util/pkgconfig
	nls? ( sys-devel/gettext )"


src_configure() {
    eqmake4
}
