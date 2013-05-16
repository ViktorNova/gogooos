# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit gnome2-utils qt4-r2 git-2
#autotools 

DESCRIPTION="GoGoo Touch Framework"
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
	dev-db/tinycdb
	>=gogoo-base/contextkit-0.5.27.1"
# QtTest QtCore QtXml QtDbus Glib 
DEPEND="${RDEPEND}
	dev-util/intltool
	dev-util/pkgconfig
	nls? ( sys-devel/gettext )"

src_configure() {
    econf -release
}

src_install() {
	emake INSTALL_ROOT="${ED}" install
}
