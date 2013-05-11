# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit gnome2-utils qt4-r2

DESCRIPTION="Meego Music Player"
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
	>=meego-base/libqttracker-6.12.6"
DEPEND="${RDEPEND}
	dev-util/intltool
	dev-util/pkgconfig
	nls? ( sys-devel/gettext )"

#Requires:   bognor-regis
#Requires:   meego-handset-music-branding
#BuildRequires:  pkgconfig(QtCore) >= 4.6.0
#BuildRequires:  pkgconfig(QtDBus)
#BuildRequires:  pkgconfig(QtOpenGL)
#BuildRequires:  pkgconfig(QtNetwork)
#BuildRequires:  pkgconfig(QtGui)
#BuildRequires:  pkgconfig(qttracker)
#BuildRequires:  pkgconfig(meegotouch)
#BuildRequires:  pkgconfig(gstreamer-net-0.10)
#BuildRequires:  pkgconfig(gstreamer-dataprotocol-0.10)
#BuildRequires:  pkgconfig(gstreamer-controller-0.10)
#BuildRequires:  pkgconfig(gstreamer-base-0.10)
#BuildRequires:  pkgconfig(gstreamer-0.10)
#BuildRequires:  doxygen
#BuildRequires:  desktop-file-utils

src_configure() {
    eqmake4
}
