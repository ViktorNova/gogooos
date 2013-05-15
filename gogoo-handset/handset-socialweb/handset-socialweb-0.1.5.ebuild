# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit gnome2-utils qt4-r2

DESCRIPTION="MeeGo Touch Framework and libsocialweb based social networking application"
HOMEPAGE="https://github.com/dudochkin-victor/${PN}"
SRC_URI="https://github.com/dudochkin-victor/${PN}/tarball/${PV} -> ${P}.tar.gz"
S="${WORKDIR}/dudochkin-victor-${PN}-d24f42f"

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
	>=meego-base/meego-ux-components-0.2.8.7
	>=app-misc/tracker-0.14.4"
DEPEND="${RDEPEND}
	dev-util/intltool
	dev-util/pkgconfig
	nls? ( sys-devel/gettext )"

#Requires:   meegotouch-theme
#Requires:   meegotouchcp-socialweb
#Requires:   libsocialweb-qt >= 0.1.4
#Requires:   libsocialweb
#Requires:   libsocialweb-keys
#Requires:   marmazon
#BuildRequires:  pkgconfig(QtCore) >= 4.6.0
#BuildRequires:  pkgconfig(QtGui)
#BuildRequires:  pkgconfig(QtDBus)
#BuildRequires:  pkgconfig(libsocialweb-qt) >= 0.1.4
#BuildRequires:  pkgconfig(meegotouch)
#BuildRequires:  pkgconfig(meegotouch-controlpanel)
#BuildRequires:  pkgconfig(marmazon)
#BuildRequires:  desktop-file-utils

src_configure() {
    eqmake4
}
