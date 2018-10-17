#ifndef CLIENTLISTMODEL_H
#define CLIENTLISTMODEL_H

#include <QObject>

class ClientListModel : public QObject
{
    Q_OBJECT
public:
    explicit ClientListModel(QObject *parent = nullptr);

signals:

public slots:
    void showMonitorView(const int clientMark);
};

#endif // CLIENTLISTMODEL_H
