FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRCREV = "085bfa86527aa1b43e6193f0ac853ca1335ec003"

SRC_URI_append = " \
    git://github.com/xen-troops/DisplayManager.git;protocol=https;branch=master \
    file://display_manager.conf \
"
DEPENDS += " dbus-cxx"

RDEPENDS_${PN} += " dbus-cxx"

EXTRA_OECMAKE_append = " -DWITH_DOC=OFF -DCMAKE_BUILD_TYPE=Release"

do_install_append() {
    install -d ${D}${sysconfdir}/dbus-1/system.d
    install -m 0755 ${WORKDIR}/display_manager.conf ${D}${sysconfdir}/dbus-1/system.d/
}

FILES_${PN} += " \
    ${sysconfdir}/dbus-1/session.d/display_manager.conf \
"
