# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit gnome2-utils qt4-r2

DESCRIPTION="GoGoo Touch Framework and Telepathy based chat application"
HOMEPAGE="https://github.com/dudochkin-victor/${PN}"
SRC_URI="https://github.com/dudochkin-victor/${PN}/tarball/${PV} -> ${P}.tar.gz"
S="${WORKDIR}/dudochkin-victor-${PN}-1166380"

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
	=gogoo-base/libgogoochat-9999"
DEPEND="${RDEPEND}
	dev-util/intltool
	dev-util/pkgconfig
	nls? ( sys-devel/gettext )"

#Requires:   telepathy-mission-control
#Requires:   telepathy-gabble
#Requires:   telepathy-salut
#Requires:   telepathy-farsight
#Requires:   gogootouch-theme
#Requires:   handset-people
#Requires:   touchcp-chat
#Requires:   libgogoochat
#BuildRequires:  pkgconfig(QtCore) >= 4.6.0
#BuildRequires:  pkgconfig(QtGui)
#BuildRequires:  pkgconfig(libgogoochat)
#BuildRequires:  pkgconfig(gogootouch)
#BuildRequires:  pkgconfig(gogootouch-controlpanel)
#BuildRequires:  desktop-file-utils

src_configure() {
    eqmake4
}
