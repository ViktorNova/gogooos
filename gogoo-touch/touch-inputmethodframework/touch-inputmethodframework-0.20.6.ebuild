# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit gnome2-utils qt4-r2

DESCRIPTION="MeeGo UI Input Method Framework"
HOMEPAGE="https://github.com/dudochkin-victor/${PN}"
SRC_URI="https://github.com/dudochkin-victor/${PN}/tarball/${PV} -> ${P}.tar.gz"
S="${WORKDIR}/dudochkin-victor-${PN}-20cc480"

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

#Requires(pre): GConf2
#Requires(preun): GConf2
#Requires(post): /sbin/ldconfig
#Requires(post): GConf2
#Requires(postun): /sbin/ldconfig
#BuildRequires:  pkgconfig(QtCore) >= 4.6.0
#BuildRequires:  pkgconfig(dbus-1)
#BuildRequires:  pkgconfig(gconf-2.0)
#BuildRequires:  pkgconfig(meegotouch) >= 0.20.77
#BuildRequires:  pkgconfig(meegotouch-feedback)
#BuildRequires:  pkgconfig(meegotouch-feedbackreactionmaps) >= 0.14.0
#BuildRequires:  pkgconfig(meegotouch-controlpanel) >= 0.7.20
#BuildRequires:  pkgconfig(x11)
#BuildRequires:  pkgconfig(xcomposite)
#BuildRequires:  pkgconfig(xdamage)
#BuildRequires:  pkgconfig(xext)
#BuildRequires:  pkgconfig(xfixes)
#BuildRequires:  graphviz
#BuildRequires:  fdupes


src_configure() {
	eqmake4
}
