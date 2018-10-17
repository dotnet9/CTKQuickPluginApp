#include "clientmonitormodel.h"
#include <ctkPluginContext.h>
#include <service/event/ctkEventAdmin.h>
#include <ctkPluginFrameworkLauncher.h>

ClientMonitorModel::ClientMonitorModel(QObject* parent): QObject(parent)
{
}

void ClientMonitorModel::showPluginView(const int clientMark, const QString& pluginMark)
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
            QString topic("com/lsquange/clientmonitor/published");
            ctkDictionary message;
            message["ClientMark"] = clientMark;
            message["ClientPluginMark"] = pluginMark;
            eventAdmin->postEvent(ctkEvent(topic, message));
        }
    }

}
