import QtQuick 2.0
import "../"

Item
{
    Column
    {
        width: parent.width - 40

        anchors.centerIn: parent

        anchors.verticalCenterOffset:  20

        spacing: 20

        Text {
            text: qsTr("激活后体验完整服务")
            color: "#fff"
            width: parent.width
            font.pointSize: 16
            wrapMode: Text.Wrap
            anchors.verticalCenterOffset: 20
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Text {
            text: qsTr("欢迎使用\n某某狗狗\n界面已修改 不是原始界面")
            color: "#fff"
            width: parent.width
            font.pointSize: 22
            wrapMode: Text.Wrap
            lineHeight: 1.5
            anchors.verticalCenterOffset: 20
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
        }

    }

    Item
    {
        width: parent.width

        height: 50

        Rectangle
        {
            width: parent.width

            height: 1

            color: "#60ffffff"

            z: 1000

            anchors.bottom: parent.bottom
        }

        Row
        {
            anchors.fill: parent

            Repeater
            {
                model: ["Start", "Break"]

                Rectangle {

                    width: parent.width / 2

                    height: parent.height

                    color: "transparent"

                    Rectangle
                    {
                        width: 1

                        height: parent.height

                        color: "#60ffffff"

                        visible: index == 1;

                        anchors.bottom: parent.bottom
                    }

                    Behavior on color{
                        ColorAnimation {
                            duration: 200
                        }
                    }

                    Text
                    {
                        anchors.centerIn: parent

                        text: modelData

                        color: ink.containsMouse ? "#ff00ff" : "#0000ff"

                        font.pointSize: 16
                    }

                    MouseArea
                    {
                        id: ink;

                        anchors.fill: parent

                        hoverEnabled: true

                        onClicked: {
                            if(index == 0)
                                stack.currentIndex = 1
                            else
                                stack.currentIndex = 2
                        }
                    }

                }
            }
        }
    }

}
