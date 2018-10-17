#ifndef PLUGINSERVICE_H
#define PLUGINSERVICE_H

#include <QtPlugin>
#include <QQuickItem>

/*!
 * \brief  The PluginService class
 * all plugin interfice
 * \author lsq
 * \date   2018-10-17 18:06
 */
class PluginService
{
public:
    virtual ~PluginService(){}
    /*!
     * \brief  getView
     * The plugin-in service destructor, when not using the service, delete the
     * service, must do the resource release operation.
     * \author lsq
     * \return plugin view
     */
    virtual QObject* getView() = 0;
};

#define PluginService_iid "com.lsquange.service.PluginService"
Q_DECLARE_INTERFACE(PluginService, PluginService_iid)

#endif // PLUGINSERVICE_H
