# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit gnome2-utils qt4-r2 git-2 flag-o-matic

DESCRIPTION="Qt bindings for the Tracker media indexing infrastructure"
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
	=gogoo-base/libqtsparql-9999"
DEPEND="${RDEPEND}
	dev-util/intltool
	dev-util/pkgconfig
	nls? ( sys-devel/gettext )"

#BuildRequires:  pkgconfig(QtCore)
#BuildRequires:  pkgconfig(QtSparql)
#BuildRequires:  pkgconfig(uuid)
#BuildRequires:  tracker >= 0.7.0

src_configure() {
    filter-flags -fomit-frame-pointer
    eqmake4 "${S}/projects.pro" CONFIG-=tests SUBDIRS-=tests
}
