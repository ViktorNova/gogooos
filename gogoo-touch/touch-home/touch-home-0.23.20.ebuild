# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit gnome2-utils qt4-r2

DESCRIPTION="MeeGo Touch Homescreen"
HOMEPAGE="https://github.com/dudochkin-victor/${PN}"
SRC_URI="https://github.com/dudochkin-victor/${PN}/tarball/${PV} -> ${P}.tar.gz"
S="${WORKDIR}/dudochkin-victor-${PN}-2db5eb1"

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

#BuildRequires:  pkgconfig(QtCore) >= 4.6.0
#BuildRequires:  pkgconfig(QtOpenGL)
#BuildRequires:  pkgconfig(xdamage)
#BuildRequires:  pkgconfig(contextprovider-1.0)
#BuildRequires:  pkgconfig(xcomposite)
#BuildRequires:  pkgconfig(meegotouch)
#BuildRequires:  pkgconfig(contentaction-0.1)
#BuildRequires:  pkgconfig(x11)
#BuildRequires:  fdupes
#BuildRequires:  doxygen


src_configure() {
	eqmake4
}
