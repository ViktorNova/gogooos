# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit gnome2-utils qt4-r2

DESCRIPTION="MeeGo Touch Framework based Voice Call Application"
HOMEPAGE="https://github.com/dudochkin-victor/${PN}"
SRC_URI="https://github.com/dudochkin-victor/${PN}/tarball/${PV} -> ${P}.tar.gz"
S="${WORKDIR}/dudochkin-victor-${PN}-51c5f90"

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

#Requires:   ofono
#Requires:   voicecallhistory
#Requires:   meego-handset-dialer-branding
#Requires:   meego-handset-sound-theme
#BuildRequires:  pkgconfig(QtOpenGL)
#BuildRequires:  pkgconfig(QtContacts) >= 1.0.2
#BuildRequires:  pkgconfig(QtMultimediaKit)
#BuildRequires:  pkgconfig(meegotouch)
#BuildRequires:  pkgconfig(qttracker)
#BuildRequires:  pkgconfig(meegobluetooth)
#BuildRequires:  pkgconfig(libresourceqt1)
#BuildRequires:  libseaside-devel >= 0.0.35
#BuildRequires:  desktop-file-utils


src_configure() {
    eqmake4
}
