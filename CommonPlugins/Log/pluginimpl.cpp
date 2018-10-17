#include "pluginimpl.h"
#include <ctkPluginContext.h>
#include <QtDebug>
#include <QQmlEngine>
#include <QQmlComponent>

PluginImpl::PluginImpl(ctkPluginContext* context)
    : m_pContext(context)
{
    context->registerService<PluginService>(this);
}

QObject* PluginImpl::getView()
{
    QQmlEngine engine;
    QQmlComponent component(&engine, QUrl("qrc:/LogView.qml"));
    QObject *object = component.create();

    return  object;
}
