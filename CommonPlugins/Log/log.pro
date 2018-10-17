TEMPLATE = lib
TARGET = Log
QT += qml quick
CONFIG += plugin c++11

# Input
SOURCES += \
    pluginactivator.cpp \
    pluginimpl.cpp

HEADERS += \
    pluginactivator.h \
    pluginimpl.h

DISTFILES =

include(../../CTK.pri)
INCLUDEPATH += ../../include


CONFIG(debug, debug|release){
    DESTDIR = ../../../CTKQuickPluginApp/bin/debug/CommonPlugins
} else {
    DESTDIR = ../../../CTKQuickPluginApp/bin/release/CommonPlugins
}
RESOURCES += \
    resource.qrc \
    qml.qrc
