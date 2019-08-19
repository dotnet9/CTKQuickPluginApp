import QtQuick 2.9
import QtQuick.Controls 2.2
import "../"

Popup {

    x: 0
    y: 0
    width: 0
    height: 0
    modal: true //  防止穿透 建议开启
    focus: true
    padding: 0
    margins: 0
    visible: false
    closePolicy: Popup.NoAutoClose
    property int status : 2     //  0 正在登录或连接(可自定message) 1.已连接或者已登录(可自定message) 2.自定义message和btn和callback
    property string message;
    property string btn;
    property var callback : null

    enter:Transition {
        NumberAnimation { property: "opacity"; from: 0.0; to: 1.0 }
    }

    exit: Transition {
        NumberAnimation { property: "opacity"; from: 1.0; to: 0.0 }
    }

    Rectangle
    {
        x : 10

        y : 10

        width: 300

        height: 300

        opacity: parent.opacity

        color: "#333"

        Column
        {
            visible: status == 0

            spacing: 30

            anchors.centerIn: parent

            BusyIndicator {

                 id: control

                 anchors.horizontalCenter: parent.horizontalCenter

                 contentItem: Item {
                     implicitWidth: 64
                     implicitHeight: 64

                     Item {
                         id: item
                         x: parent.width / 2 - 32
                         y: parent.height / 2 - 32
                         width: 64
                         height: 64
                         opacity: control.running ? 1 : 0

                         Behavior on opacity {
                             OpacityAnimator {
                                 duration: 250
                             }
                         }

                         RotationAnimator {
                             target: item
                             running: control.visible && control.running
                             from: 0
                             to: 360
                             loops: Animation.Infinite
                             duration: 720
                         }

                         Repeater {
                             id: repeater
                             model: 6

                             Rectangle {
                                 x: item.width / 2 - width / 2
                                 y: item.height / 2 - height / 2
                                 implicitWidth: 10
                                 implicitHeight: 10
                                 radius: 5
                                 transform: [
                                     Translate {
                                         y: -Math.min(item.width, item.height) * 0.5 + 5
                                     },
                                     Rotation {
                                         angle: index / repeater.count * 360
                                         origin.x: 5
                                         origin.y: 5
                                     }
                                 ]
                             }
                         }
                     }
                 }
             }

            Text
            {
                text: message

                color: "#fff"

                font.pointSize: 26

                anchors.horizontalCenter: parent.horizontalCenter
            }
        }

        Column
        {
            visible: status == 1

            spacing: 30

            anchors.centerIn: parent

            Image
            {
                source: "qrc:/skin/ic_ok.png"

                anchors.horizontalCenter: parent.horizontalCenter
            }

            Text
            {
                text: "connect ok"

                color: "#fff"

                font.pointSize: 26

                anchors.horizontalCenter: parent.horizontalCenter
            }
        }


        Item
        {
            anchors.fill: parent

            visible: status == 2

            Text
            {
                text: message

                color: "#fff"

                font.pointSize: 26

                anchors.centerIn: parent

                anchors.verticalCenterOffset: -30
            }

            Text
            {
                text: btn

                font.pointSize: 26

                width: parent.width

                height: 60

                horizontalAlignment: Text.AlignHCenter

                verticalAlignment: Text.AlignVCenter

                anchors.horizontalCenter: parent.horizontalCenter

                anchors.bottom: parent.bottom

                MouseArea
                {
                    anchors.fill: parent

                    onClicked: {

                        if(callback)
                            callback();

                        close();

                        callback = null;
                    }
                }

                Rectangle
                {
                    color: "#2F313F"

                    width: parent.width

                    height: 1
                }
            }
        }

    }

    Timer
    {
        id: timer

        running: false

        repeat: false;

        interval: 1500

        onTriggered: {
            if(stack.currentIndex == 1)
                ++stack.currentIndex;
            else
                ++scene2.currentIndex
            close();
        }
    }

    onStatusChanged:
    {
        if(status == 1)
            timer.running = true;
    }
}
