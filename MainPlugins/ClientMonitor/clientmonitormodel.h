#ifndef CLIENTMONITORMODEL_H
#define CLIENTMONITORMODEL_H

#include <QObject>

class ClientMonitorModel : public QObject
{
    Q_OBJECT
public:
    explicit ClientMonitorModel(QObject *parent = nullptr);

public slots:
    void showPluginView(const int clientMark, const QString& pluginMark);
};

#endif // CLIENTMONITORMODEL_H
