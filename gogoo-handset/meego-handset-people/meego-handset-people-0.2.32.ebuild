# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit gnome2-utils qt4-r2

DESCRIPTION="MeeGo People Application"
HOMEPAGE="https://launchpad.net/indicator-session"
#EBZR_REPO_URI="lp:indicator-session"
SRC_URI="${P}.tar.bz2"
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
	>=app-misc/tracker-0.14.4
	>=meego-base/libseaside-0.0.39"
DEPEND="${RDEPEND}
	dev-util/intltool
	dev-util/pkgconfig
	nls? ( sys-devel/gettext )"

#Requires:   libseaside >= 0.0.18
#Requires:   meego-handset-people-branding
#BuildRequires:  pkgconfig(QtCore) >= 4.6.0
#BuildRequires:  pkgconfig(QtDBus)
#BuildRequires:  pkgconfig(QtOpenGL)
#BuildRequires:  pkgconfig(QtNetwork)
#BuildRequires:  pkgconfig(QtGui)
#BuildRequires:  pkgconfig(meegotouch)
#BuildRequires:  libseaside-devel >= 0.0.18
#BuildRequires:  desktop-file-utils

src_configure() {
    eqmake4
}
