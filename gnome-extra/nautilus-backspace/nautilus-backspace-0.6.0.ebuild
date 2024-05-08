# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit gnome2-utils

DESCRIPTION="Nautilus extension to go back a directory on backspace"
HOMEPAGE="https://github.com/alt-gnome-team/nautilus-backspace"
SRC_URI="https://github.com/alt-gnome-team/${PN}/archive/refs/tags/${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
        dev-python/nautilus-python
"

src_prepare() {
  default_src_prepare
  rm makefile || die
}

src_install() {
  insinto /usr/share/nautilus-python/extensions
  doins Back.py

  insinto /usr/share/glib-2.0/schemas
  doins io.github.alt-gnome-team.nautilus-backspace.gschema.xml
}

pkg_postinst() {
  gnome2_schemas_update
}

pkg_postrm() {
  gnome2_schemas_update
}