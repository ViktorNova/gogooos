# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit gnome2-utils cmake-utils

DESCRIPTION="Netbook plugin for Mutter"
HOMEPAGE="https://github.com/dudochkin-victor/${PN}"
SRC_URI="https://github.com/dudochkin-victor/${PN}/tarball/${PV} -> ${P}.tar.gz"
S="${WORKDIR}/dudochkin-victor-${PN}-9fe136d"

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
	dev-db/tinycdb
	>=meego-base/libmeegotouch-0.21.4.1
	dev-qt/qttest
	dev-qt/qtcore
	dev-qt/qtxmlpatterns
	dev-qt/qtdbus"

DEPEND="${RDEPEND}
	dev-util/intltool
	dev-util/pkgconfig
	nls? ( sys-devel/gettext )"

#Requires:   mx
#Requires:   gnome-menus
#Requires:   startup-notification
#Requires:   meego-menus
#Requires:   matchbox-panel
#Requires:   libXScrnSaver
#Requires:   mutter-meego-branding
#Requires(pre): GConf2
#Requires(preun): GConf2
#Requires(post): /sbin/ldconfig
#Requires(post): GConf2
#Requires(postun): /sbin/ldconfig
#BuildRequires:  pkgconfig(libstartup-notification-1.0)
#BuildRequires:  pkgconfig(gl)
#BuildRequires:  pkgconfig(mutter-plugins)
#BuildRequires:  pkgconfig(mx-1.0) >= 0.9.0
#BuildRequires:  pkgconfig(gtk+-2.0)
#BuildRequires:  pkgconfig(dbus-glib-1)
#BuildRequires:  pkgconfig(gconf-2.0)
#BuildRequires:  pkgconfig(gio-unix-2.0)
#BuildRequires:  pkgconfig(clutter-gtk-0.12)
#BuildRequires:  pkgconfig(libgnome-control-center-extension)
#BuildRequires:  pkgconfig(xscrnsaver)
#BuildRequires:  intltool
#BuildRequires:  desktop-file-utils

src_configure() {
#	local mycmakeargs=(
#	    -DGSETTINGS_COMPILE=OFF
#		-DVALA_EXECUTABLE="$(type -p valac-0.18)"
#	)

	cmake-utils_src_configure
}
