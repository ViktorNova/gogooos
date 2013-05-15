# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit gnome2-utils

DESCRIPTION="Media Explorer is a media centre application"
HOMEPAGE="https://github.com/dudochkin-victor/${PN}"
SRC_URI="https://github.com/dudochkin-victor/${PN}/tarball/${PV} -> ${P}.tar.gz"
S="${WORKDIR}/dudochkin-victor-${PN}-6232e44"

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
	media-libs/grilo
	media-plugins/grilo-plugins
	gnome-base/gnome-desktop:2"
DEPEND="${RDEPEND}
	dev-util/intltool
	dev-util/pkgconfig
	nls? ( sys-devel/gettext )"


src_configure() {
#	use amd64 && append-flags -O0
#	tc-export CC
	econf
}
