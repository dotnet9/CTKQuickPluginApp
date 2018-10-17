#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include <QDirIterator>
#include <QtDebug>

#include <ctkPluginFrameworkLauncher.h>
#include <ctkPluginFrameworkFactory.h>
#include <ctkPluginFramework.h>
#include <ctkPluginException.h>
#include <ctkPluginContext.h>

#include "pluginservice.h"

QObject* m_pClientList;
QObject* m_pLog;

void loadPlugin(const QString& pluginDir)
{
    QString path = QString("%1/%2").arg(QGuiApplication::applicationDirPath()).arg(pluginDir);
    ctkPluginFrameworkLauncher::addSearchPath(path);
    ctkPluginFrameworkLauncher::start("org.commontk.eventadmin");

    ctkPluginContext* context = ctkPluginFrameworkLauncher::getPluginContext();

    QDirIterator itPlugin(path, QStringList() << "*.dll" << "*.so", QDir::Files);
    while(itPlugin.hasNext()) {
        QString strPlugin = itPlugin.next();
        try {
            QSharedPointer<ctkPlugin> plugin = context->installPlugin(QUrl::fromLocalFile(strPlugin));

            // 获取符号名
            QString symb = plugin->getSymbolicName();
            qDebug() << "Symbolic Name:" << symb << "\r\n";

            plugin->start(ctkPlugin::START_TRANSIENT);
            qDebug() << pluginDir << " Plugin start ...";

            ctkServiceReference reference = context->getServiceReference<PluginService>();
            if (reference) {
                PluginService* service = qobject_cast<PluginService *>(context->getService(reference));
                if(service != Q_NULLPTR) {
                    QObject* w = service->getView();
                    if(w == nullptr) {
                        continue;
                    }
                    if("MainPlugin.ClientList" == symb) {
                        m_pClientList = w;
                    }
                    else if("CommonPlugin.Log" == symb){
                        m_pLog = w;
                    }
                }
            }
        } catch(const ctkPluginException &e) {
            qDebug() << strPlugin << "Failed to install plugin" << e.what();
            return;
        }
    }
}

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    loadPlugin("MainPlugins");
    loadPlugin("CommonPlugins");
    loadPlugin("ClientPlugins");


    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("ClientListView", m_pClientList);
    engine.rootContext()->setContextProperty("LogView", m_pLog);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;



    return app.exec();
}
