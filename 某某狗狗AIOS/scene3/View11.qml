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

    property string phone;

    property int time;

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
            width: parent.width - 40

            anchors.centerIn: parent

            spacing: 10

            Text {
                text: qsTr("等待(原文修改)\n" + phone.substring(0, 3) + " " + phone.substring(3, 7) + " " +  phone.substring(7, 11))
                color: "#fff"
                width: parent.width
                font.pointSize: 22
                lineHeight: 1.2
                wrapMode: Text.Wrap
                horizontalAlignment: Text.AlignHCenter
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Text {
                text: time + qsTr("秒")
                color: "#d1a05a"
                width: parent.width
                font.pointSize: 22
                wrapMode: Text.Wrap
                horizontalAlignment: Text.AlignHCenter
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }
    }

    Timer
    {
        repeat: true
        running: time > 0
        onTriggered: if(--time == 0){
             if(scene2.currentIndex == 1)
                ++scene2.currentIndex
             view_code.start();
             close();
             console.log("界面跳转")
        }
    }

    function start()
    {
        time = 3
    }
}
