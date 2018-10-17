TEMPLATE = lib
TARGET = ClientList
QT += qml quick
CONFIG += plugin c++11

# Input
SOURCES += \
    pluginactivator.cpp \
    pluginimpl.cpp \
    clientlistmodel.cpp

HEADERS += \
    pluginactivator.h \
    pluginimpl.h \
    clientlistmodel.h

include(../../CTK.pri)
INCLUDEPATH += ../../include


CONFIG(debug, debug|release){
    DESTDIR = ../../../CTKQuickPluginApp/bin/debug/MainPlugins
} else {
    DESTDIR = ../../../CTKQuickPluginApp/bin/release/MainPlugins
}

RESOURCES += \
    resource.qrc \
    qml.qrc
