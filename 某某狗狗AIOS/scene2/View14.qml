import QtQuick 2.9
import QtQuick.Controls 2.2
import "../"

Item
{
    Column
    {
        width: parent.width

        height: parent.height

        spacing: 6

        Item
        {
            width: parent.width

            height: 40

            StyleButton
            {
                z: 100

                x: 10

                width: 16

                height: 36

                color: "transparent"

                anchors.verticalCenter: parent.verticalCenter

                Image
                {
                    source: "qrc:/skin/last.png"

                    anchors.centerIn: parent

                    width: 36

                    height: 36
                }

                onClick: {
                    stack.currentIndex = 0
                }
            }

            Text {
                text: qsTr("这是一段文字")
                color: "#fff"
                font.pointSize: 20
                height: 40
                verticalAlignment: Text.AlignVCenter
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }

        Text {
            text: qsTr("这是一段文字")
            color: "#aaa"
            font.pointSize: 16
            height: 50
            leftPadding: 10
            wrapMode: Text.Wrap
        }

        ListView
        {
            clip: true

            width: parent.width

            height: parent.height - 102 // ( 50 + 40 + 12)

            model: listmodel2

            delegate: StyleButton {
                width: parent.width
                height: 70
                radius: 0
                color: area.containsMouse ? "#20ffffff" : "transparent"

                Rectangle
                {
                    width: parent.width - 20

                    height: 1

                    anchors.horizontalCenter: parent.horizontalCenter

                    color: "#60ffffff"
                }

                Row
                {
                    anchors.fill: parent

                    spacing: 10

                    leftPadding: 10

                    rightPadding: 10

                    StyleWifi
                    {
                        level: status

                        width: 32

                        height: 32

                        anchors.verticalCenter: parent.verticalCenter
                    }

                    Text
                    {
                        width: parent.width - 120

                        anchors.verticalCenter: parent.verticalCenter

                        elide: Text.ElideRight

                        text: name

                        font.pointSize: 16

                        color: "#fff"
                    }

                    Image
                    {
                        width: 32

                        height: 32

                        source: "qrc:/skin/lock.png"

                        anchors.verticalCenter: parent.verticalCenter

                        visible: lock
                    }

                }

                onClick: {
                    input_wifi_password.title = "...."
                    scene1.currentIndex = 1;
//                    console.log("click connect wifi" + index)
//                    console.log("name " + name)
//                    console.log("lock " + lock)
//                    console.log("level " + status)
                }
            }
        }
    }
}
