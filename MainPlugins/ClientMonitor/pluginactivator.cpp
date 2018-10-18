#include "pluginactivator.h"
#include "pluginimpl.h"
#include <QQuickView>
#include <QQmlContext>
#include "showclientmonitoreventhandler.h"
#include "showclientplugineventhandler.h"
#include "service/event/ctkEventConstants.h"
#include <ctkPluginFrameworkLauncher.h>
#include "clientmonitormodel.h"

void PluginActivator::start(ctkPluginContext *context)
{
    qmlRegisterType<ClientMonitorModel>("com.lsquage.clientmonitormodel", 1, 0, "ClientMonitorModel");
    s.reset(new PluginImpl(context));

    m_pEventHandler = new ShowClientMonitorEventHandler();
    connect(m_pEventHandler, &ShowClientMonitorEventHandler::showMonitorView,
            this, &PluginActivator::showMonitorViewHandler);

    ctkDictionary props;
    props[ctkEventConstants::EVENT_TOPIC] = "com/lsquange/client/published";
    context->registerService<ctkEventHandler>(m_pEventHandler, props);


    m_pPluginEventHandler = new ShowClientPluginEventHandler();
    connect(m_pPluginEventHandler, &ShowClientPluginEventHandler::showPluginView,
            this, &PluginActivator::showPluginViewHandler);

    ctkDictionary props2;
    props2[ctkEventConstants::EVENT_TOPIC] = "com/lsquange/clientplugin/published";
    context->registerService<ctkEventHandler>(m_pPluginEventHandler, props2);
}

void PluginActivator::stop(ctkPluginContext *context)
{
    Q_UNUSED(context);
}


void PluginActivator::showMonitorViewHandler(const int clientMark)
{
    QQuickView* view = nullptr;
    if(m_mapViews.contains(clientMark)) {
        view = m_mapViews[clientMark];
    }
    if(view == nullptr) {

        view = new QQuickView;
        QObject* logView = getView("CommonPlugin.Log");
        QObject* clientBaseView = getView("ClientPlugin.ClientBase");
        view->rootContext()->setProperty("LogView", QVariant::fromValue(logView));
        view->rootContext()->setProperty("ContentView", QVariant::fromValue(clientBaseView));
        view->setSource(QUrl("qrc:/ClientMonitorView.qml"));
        view->setTitle(QString("Client monitor %1").arg(clientMark));
        view->setWidth(800);
        view->setHeight(600);
        m_mapViews.insert(clientMark, view);
        view->show();

    }
}


void PluginActivator::showPluginViewHandler(const int clientMark, const QString& clientPluginMark, QObject* view)
{
    QQuickView* monitorView = nullptr;
    if(m_mapViews.contains(clientMark)) {
        monitorView = m_mapViews[clientMark];
    }

    monitorView->rootContext()->setProperty("ContentView", QVariant::fromValue(view));
}


QObject* PluginActivator::getView(const QString& pluginName)
{
    QObject* obj = nullptr;
    ctkPluginContext* context = ctkPluginFrameworkLauncher::getPluginContext();
    QList<QSharedPointer<ctkPlugin>> lstPlugins = context->getPlugins();
    foreach (QSharedPointer<ctkPlugin> p, lstPlugins) {
        if(pluginName != p->getSymbolicName()) {
            continue;
        }
        ctkServiceReference reference = context->getServiceReference<PluginService>();
        if (reference) {
            PluginService* service = qobject_cast<PluginService *>(context->getService(reference));
            if(service != Q_NULLPTR) {
                obj = service->getView();
            }
        }
        break;
    }

    return obj;
}
