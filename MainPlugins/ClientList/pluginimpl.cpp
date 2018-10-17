#include "pluginimpl.h"
#include <ctkPluginContext.h>
#include <QtDebug>
#include <QQmlEngine>
#include <QQmlComponent>
#include "clientlistmodel.h"

PluginImpl::PluginImpl(ctkPluginContext* context)
    : m_pContext(context)
{
    context->registerService<PluginService>(this);
    qmlRegisterType<ClientListModel>("com.lsquage.clistlistmodel", 1, 0, "ClientListModel");
}

QObject* PluginImpl::getView()
{
    QQmlEngine engine;
    QQmlComponent component(&engine, QUrl("qrc:/ClientListView.qml"));
    QObject *object = component.create();

    return  object;
}
