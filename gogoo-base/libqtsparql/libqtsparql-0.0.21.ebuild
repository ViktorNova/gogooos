# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit gnome2-utils qt4-r2 

DESCRIPTION="Library for accessing RDF stores"
HOMEPAGE="https://github.com/dudochkin-victor/${PN}"
SRC_URI="https://github.com/dudochkin-victor/${PN}/tarball/${PV} -> ${P}.tar.gz"
S="${WORKDIR}/dudochkin-victor-${PN}-21"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="nls"

RDEPEND="
	dev-libs/dbus-glib
	dev-libs/glib:2
	>=dev-libs/libdbusmenu-0.5.90:3[gtk]
	sys-fs/udev[gudev]
	x11-libs/gtk+:3"
DEPEND="${RDEPEND}
	dev-util/intltool
	dev-util/pkgconfig
	nls? ( sys-devel/gettext )"

#BuildRequires: doxygen
#BuildRequires: pkgconfig(QtCore)
#BuildRequires: tracker-devel
#Requires: tracker >= 0.10.0


src_configure() {
    ./configure -prefix /usr
    eqmake4
}

src_compile() {
    emake
    emake doc
}

#src_install() {
#	autotools-utils_src_install
#
#}

pkg_preinst() {
	echo sed -i s,${WORKDIR}/${P},/usr, ${D}usr/lib/pkgconfig/*.pc
        sed -i s,${WORKDIR}/${P},/usr, ${D}usr/lib/pkgconfig/*.pc
}

