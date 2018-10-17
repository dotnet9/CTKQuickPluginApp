#include "pluginactivator.h"
#include "pluginimpl.h"
#include <QQuickView>
#include <QQmlContext>
#include "showclientmonitoreventhandler.h"
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
        view->rootContext()->setProperty("LogView", QVariant::fromValue(logView));
        view->setSource(QUrl("qrc:/ClientMonitorView.qml"));
        view->setTitle(QString("Client monitor %1").arg(clientMark));
        view->setWidth(800);
        view->setHeight(600);
        m_mapViews.insert(clientMark, view);
        view->show();

    }
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
