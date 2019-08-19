import QtQuick 2.0
import "../"

Item
{
    Column
    {
        width: parent.width - 40

        anchors.centerIn: parent

        spacing: 20

        Image
        {
            anchors.horizontalCenter: parent.horizontalCenter

            source: "qrc:/skin/ic_ok.png"

            width: 48

            height: 48
        }

        Text {
            text: qsTr("OJBK")
            color: "#fff"
            width: parent.width
            font.pointSize: 26
            wrapMode: Text.Wrap
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

    StyleButton
    {
        width: parent.width

        height: 65

        color: "transparent"

        Rectangle
        {
            width: parent.width

            height: 1

            color: "#20ffffff"

            anchors.bottom: parent.bottom
        }

        Text {
            text: qsTr("点我进下一步")
            color: parent.area.containsMouse ? "#00ff00" : "#fff"
            font.pointSize: 18
            anchors.centerIn: parent
        }

        onClick: {
            stack.currentIndex = 3
        }
    }
}
