import QtQuick 2.0
import "../"

Item
{
    Column
    {
        width: parent.width - 40

        anchors.centerIn: parent

        anchors.verticalCenterOffset: - 10

        spacing: 20

        Text {
            text: qsTr("登录账号\n开启..")
            color: "#fff"
            width: parent.width
            font.pointSize: 22
            wrapMode: Text.Wrap
            lineHeight: 1.5
            anchors.verticalCenterOffset: - 30
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
                model: ["bt1", "bt2"]

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

                        color: ink.containsMouse ? "#00ff00" : "#fff"

                        font.pointSize: 16
                    }

                    MouseArea
                    {
                        id: ink;

                        anchors.fill: parent

                        hoverEnabled: true

                        onClicked: {
                            if(index == 0)
                                ++scene2.currentIndex
                            else
                                stack.currentIndex = 3
                        }
                    }

                }
            }
        }
    }

}
