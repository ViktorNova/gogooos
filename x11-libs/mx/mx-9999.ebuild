# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-libs/mx/mx-1.4.7.ebuild,v 1.6 2013/02/02 23:14:12 ago Exp $

EAPI="4"

inherit eutils autotools-utils git-2

DESCRIPTION="A widget toolkit using Clutter"
HOMEPAGE="http://clutter-project.org/"
EGIT_REPO_URI="https://github.com/dudochkin-victor/${PN}"

LICENSE="LGPL-2.1"
SLOT="2.0"
KEYWORDS="~alpha ~amd64 ~arm ~ia64 ~ppc ~ppc64 ~sparc ~x86"
IUSE="debug +introspection startup-notification doc"

RDEPEND="
	>=dev-libs/glib-2.28.0:2
	>=media-libs/clutter-1.7.91:1.0
	>=x11-apps/xrandr-1.2.0
	doc? ( !x11-libs/mx:1.0 )
	x11-libs/gdk-pixbuf:2[introspection?]
	introspection? ( >=dev-libs/gobject-introspection-0.6.4 )
	startup-notification? ( >=x11-libs/startup-notification-0.9 )"
DEPEND="${RDEPEND}
	app-arch/xz-utils
	>=dev-util/gtk-doc-am-1.14
	>=dev-util/intltool-0.35.0
	sys-devel/gettext
	virtual/pkgconfig
"

src_prepare() {
	eautoreconf
	# Tests are interactive, no use for us
	#sed -e 's/^\(SUBDIRS .*\)tests\(.*\)/\1 \2/g' \
	#	-i Makefile.am -i Makefile.in || die
	# In 1.4.8
	#epatch "${FILESDIR}/${P}-gl-types.patch"
}

src_configure() {
	econf \
		--disable-maintainer-flags \
		--disable-silent-rules \
		--with-winsys=x11 \
		$(use_enable doc gtk-doc) \
		$(use_enable introspection) \
		$(use_enable debug) \
		$(use_with startup-notification)
}

src_compile() {
    emake
    #	default
    prune_libtool_files
}

src_install() {
    emake DESTDIR="${D}" install
}
