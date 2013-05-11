# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit gnome2-utils qt4-r2

DESCRIPTION="MeeGo Virtual Keyboard"
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
	>=meego-base/meego-ux-components-0.2.8.7"
DEPEND="${RDEPEND}
	dev-util/intltool
	dev-util/pkgconfig
	nls? ( sys-devel/gettext )"

#Requires:   contextkit-maemo
#BuildRequires:  pkgconfig(QtGui) >= 4.6.0
#BuildRequires:  pkgconfig(MeegoImEngine) >= 0.4.1
#BuildRequires:  pkgconfig(MeegoImFramework) >= 0.20.0
#BuildRequires:  pkgconfig(meegotouch) >= 0.20.87
#BuildRequires:  pkgconfig(meegotouch-feedbackreactionmaps) >= 0.14.0
#BuildRequires:  pkgconfig(x11)
#BuildRequires:  pkgconfig(xkbfile) >= 1.0.6
#BuildRequires:  pkgconfig(xproto)


src_configure() {
	eqmake4
}
