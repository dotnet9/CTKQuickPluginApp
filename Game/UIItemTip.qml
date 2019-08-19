import QtQuick 2.11
import QtQuick.Window 2.2
import QtQuick.Controls 2.4


Popup
{
    property string name : ""

    property string image : ""

    property string money : ""

    property ListModel headerModel

    property ListModel propertyModel

    width: background.width

    height: background.height

    background: BorderImage {

        source: "qrc:/skin/tip.png"

        border.left: 25

        border.right: 25

        border.top: 25

        border.bottom: 25

        width : 240

        height: tip.height + 40

        Column
        {
            id : tip

            x : 20

            y : 20

            width: 200

            spacing: 10

            Text
            {
                color : "#FFF"

                text : name

                textFormat : Text.RichText

                renderType: Text.NativeRendering

                anchors.horizontalCenter: parent.horizontalCenter
            }

            Image
            {
                opacity: 0.7
                source: "qrc:/skin/line.png"
                width: 190
                height: 1
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Row
            {
                spacing: 30

                anchors.horizontalCenter: parent.horizontalCenter

                anchors.horizontalCenterOffset: - 8

                Image
                {
                    cache: true

                    source: "qrc:/skin/p_000001.jpg"

                    width: 50

                    height: 50

                    anchors.verticalCenter: parent.verticalCenter

                    Image
                    {
                        cache: true

                        source: image

                        anchors.verticalCenter: parent.verticalCenter

                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }

                Column
                {
                    Repeater
                    {
                        model: headerModel

                        Text
                        {
                            text : title

                            color : "#FFF"

                            textFormat : Text.RichText

                            renderType: Text.NativeRendering
                        }
                    }
                }

            }

            Image
            {
                opacity: 0.5
                source: "qrc:/skin/line.png"
                width: 190
                height: 1
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Column
            {
                x : 18

                spacing: 5

                Repeater
                {
                    model: propertyModel

                    Text
                    {
                        text : title

                        color : "#FFF"

                        textFormat : Text.RichText

                        renderType: Text.NativeRendering
                    }
                }
            }

            Image
            {
                opacity: 0.5
                source: "qrc:/skin/line.png"
                width: 190
                height: 1
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Text
            {
                text : "回收可获得 " + money + " 金币"

                color : "#CCCC00"

                renderType: Text.NativeRendering

                anchors.horizontalCenter: parent.horizontalCenter
            }

            Text
            {
                text : "Shift + 鼠标左键可展示该物品"

                color : "#00CC00"

                renderType: Text.NativeRendering

                anchors.horizontalCenter: parent.horizontalCenter
            }

        }

    }
}


