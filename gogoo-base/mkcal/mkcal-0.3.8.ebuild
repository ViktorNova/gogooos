# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit gnome2-utils qt4-r2

DESCRIPTION="Extended KDE kcal calendar library port for Maemo"
HOMEPAGE="https://github.com/dudochkin-victor/${PN}"
SRC_URI="https://github.com/dudochkin-victor/${PN}/tarball/${PV} -> ${P}.tar.gz"
S="${WORKDIR}/dudochkin-victor-${PN}-20a94f5"

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

#BuildRequires:  doxygen
#BuildRequires:  fdupes
#BuildRequires:  graphviz
#BuildRequires:  pkgconfig(QtCore)
#BuildRequires:  pkgconfig(libical)
#BuildRequires:  pkgconfig(libkcalcoren)
#BuildRequires:  pkgconfig(gogootouch)
#BuildRequires:  pkgconfig(sqlite3)
#BuildRequires:  pkgconfig(tracker-client-0.10)
#BuildRequires:  pkgconfig(uuid)
#BuildRequires:  pkgconfig(qmfclient)
#BuildRequires:  pkgconfig(QtSparql)
#BuildRequires:  timed-devel


src_configure() {
#    touch src/libmkcal.so.0.3.8
    eqmake4 VER_MAJ=0 VER_MIN=3 VER_PAT=8
}

src_compile() {
#    touch src/libmkcal.so.0.3.8
    emake VER_MAJ=0 VER_MIN=3 VER_PAT=8
}

src_install() {
	emake INSTALL_ROOT="${ED}" VER_MAJ=0 VER_MIN=3 VER_PAT=8 install
	cp src/libmkcal.so.0.3.8 ${ED}/usr/lib
	cd ${ED}/usr/lib
	ln -s libmkcal.so.0.3.8 libmkcal.so
	ln -s libmkcal.so.0.3.8 libmkcal.so.0
	ln -s libmkcal.so.0.3.8 libmkcal.so.0.3
	
}
