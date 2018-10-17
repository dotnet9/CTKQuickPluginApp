#include "showclientmonitoreventhandler.h"


void ShowClientMonitorEventHandler::handleEvent(const ctkEvent& event)
{
    int clientMark = event.getProperty("ClientMark").toInt();

    emit showMonitorView(clientMark);
}
