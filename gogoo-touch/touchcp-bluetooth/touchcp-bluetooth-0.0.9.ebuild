# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit gnome2-utils qt4-r2

DESCRIPTION="GoGooTouch Control Panel Bluetooth Plugin"
HOMEPAGE="https://github.com/dudochkin-victor/${PN}"
SRC_URI="https://github.com/dudochkin-victor/${PN}/tarball/${PV} -> ${P}.tar.gz"
S="${WORKDIR}/dudochkin-victor-${PN}-12eef43"

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
	gogoo-base/qml-launcher
	>=gogoo-base/ux-components-0.2.8.7
	>=gogoo-touch/touchcp-connman-0.0.13"
DEPEND="${RDEPEND}
	dev-util/intltool
	dev-util/pkgconfig
	nls? ( sys-devel/gettext )"

#Requires:   connman
#BuildRequires:  pkgconfig(QtGui)
#BuildRequires:  pkgconfig(connman-qt)
#BuildRequires:  pkgconfig(libpulse)
#BuildRequires:  pkgconfig(libpulse-mainloop-glib)
#BuildRequires:  pkgconfig(gogootouch)
#BuildRequires:  pkgconfig(touch-controlpanel)
#BuildRequires:  doxygen

src_configure() {
	eqmake4
}
