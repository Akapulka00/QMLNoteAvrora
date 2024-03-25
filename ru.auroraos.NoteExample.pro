TARGET = ru.auroraos.NoteExample

CONFIG += \
    auroraapp

PKGCONFIG += \

SOURCES += \
    src/main.cpp \

HEADERS += \

DISTFILES += \
    Database.js \
    qml/pages/NoteDetailsPage.qml \
    rpm/ru.auroraos.NoteExample.spec \

AURORAAPP_ICONS = 86x86 108x108 128x128 172x172

CONFIG += auroraapp_i18n

TRANSLATIONS += \
    translations/ru.auroraos.NoteExample.ts \
    translations/ru.auroraos.NoteExample-ru.ts \
