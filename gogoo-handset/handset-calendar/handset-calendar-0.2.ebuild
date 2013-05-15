# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit gnome2-utils qt4-r2

DESCRIPTION="MeeGo Touch Framework based calendar Application"
HOMEPAGE="https://github.com/dudochkin-victor/${PN}"
SRC_URI="https://github.com/dudochkin-victor/${PN}/tarball/${PV} -> ${P}.tar.gz"
S="${WORKDIR}/dudochkin-victor-${PN}-c529f47"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="nls"

RDEPEND="
	dev-libs/dbus-glib
	dev-libs/glib:2
	>=dev-libs/libdbusmenu-0.5.90:3[gtk]
	sys-fs/udev[gudev]
	x11-libs/gtk+:3
	meego-base/meego-qml-launcher
	>=meego-base/meego-ux-components-0.2.8.7"
DEPEND="${RDEPEND}
	dev-util/intltool
	dev-util/pkgconfig
	nls? ( sys-devel/gettext )"

#Requires:   kcalcore
#Requires:   mkcal
#Requires:   timed
#BuildRequires:  pkgconfig(QtCore) >= 4.6.0
#BuildRequires:  pkgconfig(QtDBus)
#BuildRequires:  pkgconfig(QtGui)
#BuildRequires:  pkgconfig(meegotouch)
#BuildRequires:  pkgconfig(qmfmessageserver)
#BuildRequires:  kcalcore-devel
#BuildRequires:  mkcal-devel
#BuildRequires:  timed-devel
#BuildRequires:  desktop-file-utils


src_configure() {
    eqmake4
}
