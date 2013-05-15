# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit gnome2-utils qt4-r2

DESCRIPTION="Extended KDE kcal calendar library port for Maemo"
HOMEPAGE="https://github.com/dudochkin-victor/${PN}"
SRC_URI="https://github.com/dudochkin-victor/${PN}/tarball/${PV} -> ${P}.tar.gz"
S="${WORKDIR}/dudochkin-victor-${PN}-8344db2"

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


src_configure() {
    eqmake4
}

src_compile() {
    touch src/libkcalcoren.so.4.1.18
    emake VER_MAJ=4 VER_MIN=1 VER_PAT=18
}

src_install() {
#	emake VER_MAJ=4 VER_MIN=1 VER_PAT=18 install
	emake INSTALL_ROOT="${ED}" VER_MAJ=4 VER_MIN=1 VER_PAT=18 install
	cd ${ED}/usr/lib
	ln -s libkcalcoren.so.4.1.18 libkcalcoren.so
	ln -s libkcalcoren.so.4.1.18 libkcalcoren.so.4
	ln -s libkcalcoren.so.4.1.18 libkcalcoren.so.4.1

}
