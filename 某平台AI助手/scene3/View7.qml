import QtQuick 2.0
import "../"
import "../scene2"

Item {

    property string title: ""

    property string value: ""

    property int keyMode: 0

    property int maxLength: 16

    property bool passwordMode: true

    Column
    {
        anchors.fill: parent

        Row
        {
            width: parent.width

            height: parent.height - 50


            Column
            {
                width: 80

                height: parent.height

                Repeater
                {
                    model: ListModel{
                        ListElement
                        {
                            image: "qrc:/skin/return.png"
                        }
                        ListElement
                        {
                            image: "qrc:/skin/space.png"
                        }
                        ListElement
                        {
                            image: "qrc:/skin/lang.png"
                        }
                        ListElement
                        {
                            image: ""
                        }
                    }

                    Rectangle {

                        width: 80

                        height: parent.height / 4

                        color: ink.containsMouse ? "#5d5059" : "#4d4d42"

                        Rectangle
                        {
                            width: parent.width

                            height: 1

                            color: "#2F313F"
                        }

                        Behavior on color{
                            ColorAnimation {
                                duration: 200
                            }
                        }

                        Text
                        {
                            anchors.centerIn: parent

                            text: {
                                if(index == 0) return "删"
                                else if(index == 1) return "空"
                                else if(index == 2) return "切"
                                return "连接"
                            }

                            color: ink.containsMouse ? "#00ff00" : "#fff"

                            font.pixelSize: 26
                        }

                        MouseArea
                        {
                            id: ink;

                            anchors.fill: parent

                            hoverEnabled: true

                            onClicked: {

                                if(index == 0)
                                {
                                    value = value.substring(0, value.length - 1)
                                }
                                if(index == 1)
                                {
                                    value = value + " "
                                }
                                if(index == 2)
                                {
                                    if(++keyMode > 2)
                                        keyMode = 0

                                    console.log(keyMode)
                                }
                                else if(index == 3)
                                {
                                    if(1 == 1)  //  连接成功
                                    {
                                        connect_box.status = 0

                                        connect_box.message = "正在连接"

                                        connect_box.visible = true;

                                        timer.running = true;   //  测试用的

                                    }   // 密码错误
                                    else
                                    {
                                        connect_box.status = 2

                                        connect_box.message = "密码错误"

                                        connect_box.btn = "确定"

                                        connect_box.visible = true;

                                        value = ""
                                    }

                                    console.log("connect")
                                }
                            }
                        }

                    }
                }
            }

            NumberKey
            {
                visible: keyMode == 0

                width: parent.width - 80

                height: parent.height

                onClick: value += key;
            }

            EnKey
            {
                visible: keyMode == 1

                width: parent.width - 80

                height: parent.height

                onClick: value += key;
            }

            OtherKey
            {
                visible: keyMode == 2

                width: parent.width - 80

                height: parent.height

                onClick: value += key;
            }
        }

        Text
        {
            id: label;

            width: parent.width

            height: 50

            font.pixelSize: 24

            color: value.length ? "#fff" : "#aaa"

            horizontalAlignment: Text.AlignHCenter

            verticalAlignment: Text.AlignVCenter

            text:
            {
                if(value.length)
                {
                    if(passwordMode)
                    {
                        var pass = ""

                        for(var i=0;i<value.length;++i)
                            pass += "*"

                        return pass;
                    }

                    return value;
                }

                return title;
            }

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
                    --scene1.currentIndex;
                }
            }

            StyleButton
            {
                x: parent.width - 65

                color: "transparent"

                anchors.verticalCenter: parent.verticalCenter

                visible: value.length

                Image
                {
                    source: "qrc:/skin/del.png"

                    anchors.centerIn: parent

                    width: 32

                    height: 32
                }

                onClick: value = ""
            }

            Rectangle
            {
                width: parent.width

                height: 1

                anchors.bottom: parent.bottom

                color: "#2F313F"
            }
        }

    }

    //  测试

    Timer
    {
        id: timer;
        repeat: false
        interval: 2000
        onTriggered: {
            connect_box.message = "connect ok"
            ++connect_box.status
        }
    }

    onValueChanged: {
        if(value.length > maxLength)
            value = value.substring(0, maxLength)
    }
}
