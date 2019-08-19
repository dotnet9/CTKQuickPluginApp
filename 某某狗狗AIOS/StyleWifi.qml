import QtQuick 2.0

Image
{
    property int level; //  信号强度

    width: 32

    height: 32

    source: {
        if(level == 1)
            return "qrc:/skin/wifi.png";
        if(level == 2)
            return "qrc:/skin/wifi.png";
        if(level == 3)
            return "qrc:/skin/wifi.png";
        return "qrc:/skin/wifi.png";
    }

    anchors.verticalCenter: parent.verticalCenter
}
