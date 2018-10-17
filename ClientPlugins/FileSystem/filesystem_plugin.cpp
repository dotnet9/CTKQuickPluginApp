#include "filesystem_plugin.h"
#include "myitem.h"

#include <qqml.h>

void FileSystemPlugin::registerTypes(const char *uri)
{
    // @uri com.lsquange.fielsystem
    qmlRegisterType<MyItem>(uri, 1, 0, "MyItem");
}

