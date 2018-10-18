#ifndef PLUGINACTIVATOR_H
#define PLUGINACTIVATOR_H

#include <ctkPluginActivator.h>
#include "pluginservice.h"

class QQuickView;
class ShowClientMonitorEventHandler;
class ShowClientPluginEventHandler;
class PluginActivator : public QObject, public ctkPluginActivator
{
    Q_OBJECT
    Q_INTERFACES(ctkPluginActivator)
    Q_PLUGIN_METADATA(IID "ClientMonitor")

public:
    void start(ctkPluginContext* context);
    void stop(ctkPluginContext *context);


private:
    void showMonitorViewHandler(const int clientMark);
    void showPluginViewHandler(const int clientMark, const QString& clientPluginMark, QObject* view);
    QObject* getView(const QString& pluginName);

private:
    QScopedPointer<PluginService> s;
    ShowClientMonitorEventHandler* m_pEventHandler;
    QMap<int, QQuickView*> m_mapViews;
    ShowClientPluginEventHandler* m_pPluginEventHandler;
};

#endif // PLUGINACTIVATOR_H
