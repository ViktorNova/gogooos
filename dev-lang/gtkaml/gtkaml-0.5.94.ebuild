# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit vala

DESCRIPTION="An Application Markup Language for GTK+ and Vala"
HOMEPAGE="http://code.google.com/p/gtkaml/"

SRC_URI="http://${PN}.googlecode.com/files/${P}.tar.bz2"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND=">=dev-libs/glib-2.16:2
	x11-libs/gtk+:2
	dev-libs/libxml2
	>=dev-lang/vala-0.18.0:0.18"
DEPEND="${RDEPEND}"

DOCS="AUTHORS NEWS README TODO"

VALA_REQUIRED_VERSION="0.18"

src_configure() {
	econf $(use_enable test tests)
}

src_install() {
	DESTDIR="${D}" emake install
}
