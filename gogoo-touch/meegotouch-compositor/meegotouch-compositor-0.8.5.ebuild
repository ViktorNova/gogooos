# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit gnome2-utils qt4-r2

DESCRIPTION="MeeGo UI Compositing Window Manager"
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

#Requires(post): /sbin/ldconfig
#Requires(postun): /sbin/ldconfig
#BuildRequires:  pkgconfig(QtDBus)
#BuildRequires:  pkgconfig(QtNetwork)
#BuildRequires:  pkgconfig(QtOpenGL)
#BuildRequires:  pkgconfig(contextprovider-1.0)
#BuildRequires:  pkgconfig(meegotouch)
#BuildRequires:  pkgconfig(x11)
#BuildRequires:  pkgconfig(x11-xcb)
#BuildRequires:  pkgconfig(xcb) >= 1.6
#BuildRequires:  pkgconfig(xcb-render)
#BuildRequires:  pkgconfig(xcb-shape)
#BuildRequires:  pkgconfig(xcomposite)
#BuildRequires:  pkgconfig(xdamage)
#BuildRequires:  pkgconfig(xext)
#BuildRequires:  pkgconfig(xrender)
#BuildRequires:  pkgconfig(xrandr)
#BuildRequires:  test-definition

src_configure() {
	eqmake4
}
