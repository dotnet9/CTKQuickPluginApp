TEMPLATE = lib
TARGET = ClientMonitor
QT += qml quick
CONFIG += plugin c++11

# Input
SOURCES += \
    pluginactivator.cpp \
    pluginimpl.cpp \
    showclientmonitoreventhandler.cpp \
    clientmonitormodel.cpp

HEADERS += \
    pluginactivator.h \
    pluginimpl.h \
    showclientmonitoreventhandler.h \
    clientmonitormodel.h

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
