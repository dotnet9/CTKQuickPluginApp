import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import QtGraphicalEffects 1.0
import "../"

Rectangle
{
    color: "#0d0d12"

    TopTool
    {

    }

    Column
    {
        id: colunm

        spacing: 10

        anchors.centerIn: parent

        anchors.verticalCenterOffset: 15

        Row
        {
            spacing: 15

            bottomPadding: 10

            anchors.horizontalCenter: parent.horizontalCenter

            StyleCheckButton
            {
                check: global.wifi

                Image
                {
                    anchors.centerIn: parent

                    source: "qrc:/skin/wifi.png"
                }

                onClick: {

                    global.wifi = !global.wifi

                    console.log("click wifi ")
                }
            }

            StyleCheckButton
            {
                check: global.bluetooth

                Image
                {
                    anchors.centerIn: parent

                    source: "qrc:/skin/bluetooth.png"
                }

                onClick: {

                    global.bluetooth = !global.bluetooth

                    console.log("click bluetooth ")
                }
            }

            StyleCheckButton
            {
                check: global.sound

                Image
                {
                    anchors.centerIn: parent

                    source: "qrc:/skin/wifi.png"
                }

                onClick: {

                    global.sound = !global.sound

                    console.log("click sound ")
                }
            }
        }

        Repeater
        {
            model: listmodel1

            Row
            {
                spacing: 2

                StyleButton
                {
                    width: 72

                    height: 72

                    color: "#444"

                    radius: 0

                    Image {

                        width: 72

                        height: 72

                        source: "qrc:/skin/wifi.png"
                    }

                    onClick: {
                        if(index == 1)
                        {
                            console.log("点击左边亮度")
                        }
                        else
                        {
                            console.log("点击左边声音")
                        }
                    }
                }

                Rectangle
                {
                    width: 232

                    height: 72

                    color: "#444"

                    Slider {

                        id: control

                        value: progress

                        to: 100;

                        width: 232

                        height: 72

                        background: Rectangle {
                            x: control.leftPadding
                            y: control.topPadding + control.availableHeight / 2 - height / 2
                            implicitWidth: 200
                            implicitHeight: 4
                            width: control.availableWidth
                            height: implicitHeight
                            color: "#4A2E2A"

                            Rectangle {
                                width: control.visualPosition * parent.width
                                height: parent.height
                                color: "#00ff00"
                            }
                        }

                        handle: Item {}
                    }

                }

//                StyleButton
//                {
//                    width: 72

//                    height: 72

//                    Image {

//                        width: 72

//                        height: 72

//                        source: parent.area.containsMouse ? right_hover : right_default
//                    }

//                    onClick: {
//                        if(index == 1)
//                        {
//                            console.log("点击右边亮度")
//                        }
//                        else
//                        {
//                            console.log("点击右边声音")
//                        }
//                    }
//                }
            }
        }

    }

}
