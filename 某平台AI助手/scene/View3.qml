import QtQuick 2.0
import "../"

Item
{
    property int mode

    property string t1;

    property string t2;

    property string image_default;

    property string image_select;

    MouseArea
    {
        anchors.fill: parent;

        onClicked: {
            global.sessionMode = mode;
            stack.currentIndex = 3
            console.log(image_select)
            console.log(image_default)
            console.log("选择模式")
        }
    }

    Column
    {
        width: parent.width - 40

        anchors.centerIn: parent

        spacing: 10

        Image {
            width: 128
            height: 128
            source: global.sessionMode == mode ? image_select : image_default
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Text {
            text: t1
            color: "#fff"
            font.pixelSize: 28
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Text {
            text: t2
            color: "#8A8B94"
            width: parent.width
            font.pixelSize: 24
            wrapMode: Text.Wrap
            anchors.verticalCenterOffset: -20
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
}
