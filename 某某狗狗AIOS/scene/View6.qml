import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import QtGraphicalEffects 1.0
import "../"

Item
{
    clip: true

    Column
    {
        anchors.fill: parent

        // 顶部

        Item
        {
            width: parent.width

            height: 130

            Image {
                x: parent.width - 50
                width: 36
                height: 36
                source: "qrc:/skin/btn_go.png"
                anchors.verticalCenter: parent.verticalCenter
                anchors.verticalCenterOffset: 20
            }

            MouseArea
            {
                anchors.fill: parent

                onClicked: console.log("点击用户")
            }

            Row
            {
                x: 20

                spacing: 10

                anchors.verticalCenter: parent.verticalCenter

                anchors.verticalCenterOffset: 20

                Image {
                    source: "qrc:/skin/ic_face.png"
                }

                Column
                {
                    spacing: 8

                    anchors.verticalCenter: parent.verticalCenter

                    Text {
                        text: global.username
                        color: "#fff"
                        font.pixelSize: 30
                    }

                    Text {
                        text: global.isvip ? "vip" : "no vip"
                        color: global.isvip ? "#fff" : "#585C69"
                        font.pixelSize: 26
                    }
                }
            }
        }

        ListView
        {
            width: parent.width

            height: parent.height - 130

            clip: true

            header: Column
            {
                width: parent.width

                leftPadding: 10

                Rectangle
                {
                    width: parent.width

                    height: 1

                    color: "#1D2029"
                }

                Item
                {
                    width: parent.width

                    height: 86

                    Image {
                        x: parent.width - 60
                        width: 36
                        height: 36
                        source: "qrc:/skin/btn_go.png"
                        anchors.verticalCenter: parent.verticalCenter
                    }

                    MouseArea
                    {
                        anchors.fill: parent

                        onClicked: console.log("点击无线局域网")
                    }

                    Text {
                        text: qsTr("你气不气")
                        color: "#fff"
                        font.pixelSize: 34
                        width: 80
                        anchors.verticalCenter: parent.verticalCenter
                    }

                    Text {
                        x: parent.width - 95
                        text: global.wifi ? "滚" : "吧"
                        color: "#fff"
                        font.pixelSize: 26
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }

                Item
                {
                    width: parent.width

                    height: 86

                    Rectangle
                    {
                        width: parent.width

                        height:1; color: "#2A2D3F"

                        anchors.right: parent.right
                    }

                    Image {
                        x: parent.width - 60
                        width: 36
                        height: 36
                        source: "qrc:/skin/btn_go.png"
                        anchors.verticalCenter: parent.verticalCenter
                    }

                    MouseArea
                    {
                        anchors.fill: parent

                        onClicked: console.log("点击蓝牙")
                    }

                    Text {
                        text: qsTr("fuck")
                        color: "#fff"
                        font.pixelSize: 34
                        width: 80
                        anchors.verticalCenter: parent.verticalCenter
                    }

                    Text {
                        x: parent.width - 95
                        text: global.bluetooth ? "吧" : "滚"
                        color: "#fff"
                        font.pixelSize: 26
                        anchors.verticalCenter: parent.verticalCenter
                    }

                }

                Rectangle
                {
                    width: parent.width

                    height: 1

                    color: "#1D2029"
                }

                Item
                {
                    width: parent.width

                    height: 86

                    Image {
                        x: parent.width - 60
                        width: 36
                        height: 36
                        source: "qrc:/skin/btn_go.png"
                        anchors.verticalCenter: parent.verticalCenter
                    }

                    MouseArea
                    {
                        anchors.fill: parent

                        onClicked: console.log("点击录音设置")
                    }

                    Text {
                        text: qsTr("操")
                        color: "#fff"
                        font.pixelSize: 34
                        width: 80
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }

                Item
                {
                    width: parent.width

                    height: 86

                    Rectangle
                    {
                        width: parent.width

                        height:1; color: "#2A2D3F"

                        anchors.right: parent.right
                    }

                    Image {
                        x: parent.width - 60
                        width: 36
                        height: 36
                        source: "qrc:/skin/btn_go.png"
                        anchors.verticalCenter: parent.verticalCenter
                    }

                    MouseArea
                    {
                        anchors.fill: parent

                        onClicked: console.log("点击本机设置")
                    }

                    Text {
                        text: qsTr("啊")
                        color: "#fff"
                        font.pixelSize: 34
                        width: 80
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }

                Item
                {
                    width: parent.width

                    height: 86

                    Rectangle
                    {
                        width: parent.width

                        height:1; color: "#2A2D3F"

                        anchors.right: parent.right
                    }

                    Image {
                        x: parent.width - 60
                        width: 36
                        height: 36
                        source: "qrc:/skin/btn_go.png"
                        anchors.verticalCenter: parent.verticalCenter
                    }

                    MouseArea
                    {
                        anchors.fill: parent

                        onClicked: console.log("点击设备信息")
                    }

                    Text {
                        text: qsTr("设备信息")
                        color: "#fff"
                        font.pixelSize: 34
                        width: 80
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }
            }
        }
    }
}
