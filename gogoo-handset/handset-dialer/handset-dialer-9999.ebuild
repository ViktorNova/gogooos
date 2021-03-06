# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit gnome2-utils qt4-r2 git-2

DESCRIPTION="GoGoo Touch Framework based Voice Call Application"
HOMEPAGE="https://github.com/dudochkin-victor/${PN}"
EGIT_REPO_URI="https://github.com/dudochkin-victor/${PN}"

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
	>=gogoo-base/ux-components-0.2.8.7"
DEPEND="${RDEPEND}
	dev-util/intltool
	dev-util/pkgconfig
	nls? ( sys-devel/gettext )"

#Requires:   ofono
#Requires:   voicecallhistory
#Requires:   handset-dialer-branding
#Requires:   handset-sound-theme
#BuildRequires:  pkgconfig(QtOpenGL)
#BuildRequires:  pkgconfig(QtContacts) >= 1.0.2
#BuildRequires:  pkgconfig(QtMultimediaKit)
#BuildRequires:  pkgconfig(gogootouch)
#BuildRequires:  pkgconfig(qttracker)
#BuildRequires:  pkgconfig(gogoobluetooth)
#BuildRequires:  pkgconfig(libresourceqt1)
#BuildRequires:  libseaside-devel >= 0.0.35
#BuildRequires:  desktop-file-utils

src_configure() {
    eqmake4
}
