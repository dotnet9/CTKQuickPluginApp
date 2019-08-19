import QtQuick 2.0

Item
{
    width: parent.width

    height: 40

    Row
    {
        x: 12

        spacing: 10

        anchors.verticalCenter: parent.verticalCenter

        Image {
            width: 32
            height: 32
            visible: global.wifi
            source: "qrc:/skin/wifi.png"
        }

        Image {
            width: 32
            height: 32
            visible: global.bluetooth
            source: "qrc:/skin/bluetooth.png"
        }
    }

    StylePower
    {
        x: parent.width - 60

        width: 48

        height: 48

        value: global.power

        anchors.verticalCenter: parent.verticalCenter
    }

}
