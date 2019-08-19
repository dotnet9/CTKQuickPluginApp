#include <QtQml>
#include <QApplication>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "SocketExt.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QQmlApplicationEngine engine;

//    qmlRegisterType<SocketExt>("api.socket.ext", 1, 0, "SocketExt");

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
