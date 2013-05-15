# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit gnome2-utils qt4-r2

DESCRIPTION="Common MeeGo QML Components"
HOMEPAGE="https://github.com/dudochkin-victor/${PN}"
SRC_URI="https://github.com/dudochkin-victor/${PN}/tarball/${PV} -> ${P}.tar.gz"
S="${WORKDIR}/dudochkin-victor-${PN}-5d3fdd5"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="nls"

#Requires:   libdeclarative-contacts
#Requires:   meego-ux-components
#Requires:   meego-ux-theme
#BuildRequires:  pkgconfig(libexif)
#BuildRequires:  pkgconfig(libpulse)
#BuildRequires:  pkgconfig(QtOpenGL)
#BuildRequires:  pkgconfig(QtCore)
#BuildRequires:  pkgconfig(QtDBus)
#BuildRequires:  pkgconfig(QtSensors)
#BuildRequires:  pkgconfig(qmfclient)
#BuildRequires:  pkgconfig(mlite)
#BuildRequires:  pkgconfig(libkcalcoren)
#BuildRequires:  pkgconfig(contextsubscriber-1.0)
#BuildRequires:  pkgconfig(x11)
#BuildRequires:  pkgconfig(xcomposite)
#BuildRequires:  pkgconfig(xdamage)
#BuildRequires:  doxygen

RDEPEND="
	dev-libs/dbus-glib
	dev-libs/glib:2
	>=dev-libs/libdbusmenu-0.5.90:3[gtk]
	sys-fs/udev[gudev]
	x11-libs/gtk+:3
	>=meego-base/mlite-0.0.1
	>=dev-qt/qt-mobility-1.2.2_p20121205[sensors]
	net-libs/qmf
	>=meego-base/meego-ux-components-0.2.8.7
	>=meego-base/meego-ux-theme-0.2.6
	"
DEPEND="${RDEPEND}
	dev-util/intltool
	dev-util/pkgconfig
	nls? ( sys-devel/gettext )"


src_configure() {
    eqmake4
}
