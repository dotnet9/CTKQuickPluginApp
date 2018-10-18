#include "showclientplugineventhandler.h"

void ShowClientPluginEventHandler::handleEvent(const ctkEvent& event)
{
    int clientMark = event.getProperty("ClientMark").toInt();
    QString clientPluginMark = event.getProperty("ClientPluginMark").toString();
    QObject* pluginView = event.getProperty("View").value<QObject *>();

    emit showPluginView(clientMark, clientPluginMark, pluginView);
}
