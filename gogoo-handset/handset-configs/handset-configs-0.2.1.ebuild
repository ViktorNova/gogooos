# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit gnome2-utils qt4-r2

DESCRIPTION="Custom configs for reference MeeGo Handset User Experience"
HOMEPAGE="https://github.com/dudochkin-victor/${PN}"
SRC_URI="https://github.com/dudochkin-victor/${PN}/tarball/${PV} -> ${P}.tar.gz"
S="${WORKDIR}/dudochkin-victor-${PN}-b440c29"

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

#Requires:   telepathy-mission-control
#Requires:   telepathy-gabble
#Requires:   telepathy-salut
#Requires:   telepathy-farsight
#Requires:   meegotouch-theme
#Requires:   meego-handset-people
#Requires:   meegotouchcp-chat
#Requires:   libmeegochat
#BuildRequires:  pkgconfig(QtCore) >= 4.6.0
#BuildRequires:  pkgconfig(QtGui)
#BuildRequires:  pkgconfig(libmeegochat)
#BuildRequires:  pkgconfig(meegotouch)
#BuildRequires:  pkgconfig(meegotouch-controlpanel)
#BuildRequires:  desktop-file-utils


#src_configure() {
#    eqmake4
#}
