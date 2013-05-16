# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit gnome2-utils qt4-r2 git-2

DESCRIPTION="System UI daemon"
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

#Requires:   %{name}-screenlock-padlock
#Requires:   %{name}-volume-fullscreen
#Requires:   controlpanel-privatemodeapplet
#BuildRequires:  pkgconfig(QtGui)
#BuildRequires:  pkgconfig(QtOpenGL)
#BuildRequires:  pkgconfig(contextsubscriber-1.0)
#BuildRequires:  pkgconfig(dbus-1)
#BuildRequires:  pkgconfig(dbus-glib-1)
#BuildRequires:  pkgconfig(glib-2.0)
#BuildRequires:  pkgconfig(libngf0)
#BuildRequires:  pkgconfig(libresourceqt1)
#BuildRequires:  pkgconfig(gogootouch) >= 0.20.37
#BuildRequires:  pkgconfig(touch-controlpanel)
#BuildRequires:  pkgconfig(mssf-crypto)
#BuildRequires:  pkgconfig(qmsystem2) >= 1.1.6
#BuildRequires:  pkgconfig(x11)
#BuildRequires:  pkgconfig(xcomposite)
#BuildRequires:  pkgconfig(xext)
#BuildRequires:  pkgconfig(xdamage)
#BuildRequires:  expat-devel
#BuildRequires:  desktop-file-utils
#BuildRequires:  fdupes

src_configure() {
	eqmake4
}
