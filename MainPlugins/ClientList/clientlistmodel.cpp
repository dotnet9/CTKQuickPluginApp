#include "clientlistmodel.h"
#include <ctkPluginContext.h>
#include <service/event/ctkEventAdmin.h>
#include <ctkPluginFrameworkLauncher.h>

ClientListModel::ClientListModel(QObject *parent) : QObject(parent)
{

}

void ClientListModel::showMonitorView(const int clientMark)
{
    ctkServiceReference ref;
    ctkEventAdmin* eventAdmin;
    ctkPluginContext* context;
    context = ctkPluginFrameworkLauncher::getPluginContext();
    ref = context->getServiceReference<ctkEventAdmin>();
    if(ref)
    {
        eventAdmin = context->getService<ctkEventAdmin>(ref);
        context->ungetService(ref);

        if(eventAdmin) {
            QString topic("com/lsquange/client/published");
            ctkDictionary message;
            message["ClientMark"] = clientMark;
            eventAdmin->postEvent(ctkEvent(topic, message));
        }
    }

}
