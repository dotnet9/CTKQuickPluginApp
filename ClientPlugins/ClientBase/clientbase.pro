TEMPLATE = lib
TARGET = ClientBase
QT += qml quick
CONFIG += plugin c++11

# Input
SOURCES += \
    pluginactivator.cpp \
    pluginimpl.cpp \
    showclientplugineventhandler.cpp

HEADERS += \
    pluginactivator.h \
    pluginimpl.h \
    showclientplugineventhandler.h

DISTFILES =

include(../../CTK.pri)
INCLUDEPATH += ../../include


CONFIG(debug, debug|release){
    DESTDIR = ../../../CTKQuickPluginApp/bin/debug/ClientPlugins
} else {
    DESTDIR = ../../../CTKQuickPluginApp/bin/release/ClientPlugins
}

RESOURCES += \
    resource.qrc \
    qml.qrc
