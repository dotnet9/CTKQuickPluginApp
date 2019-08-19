import QtQuick 2.9
import "../"
import "../scene2/"

Item {

    property string title: ""

    property string value: ""

    property int maxLength: 16

    property int time : 0

    Column
    {
        anchors.fill: parent

        CodeKey
        {
            width: parent.width

            height: parent.height - 50

            onClick: {
                value = value + key
            }

            onRemove: {
                value = value.substring(0, value.length - 1)
            }

            onEnter: {

                console.log(value)

                console.log("点击确定")

                if(scene2.currentIndex == 1)
                {
                    sendCode();
                }
                else
                {
                    console.log("登录")

                    connect_box.status = 0

                    connect_box.message = "正在登录"

                    connect_box.visible = true;

                    timer2.running = true;   //  测试用的

//                    my.Login(function(){
//                        if(1 == 1)  //  成功
//                        {
//                            //  成功跳转
//                            ++scene2.currentIndex;
//                        }
//                        else if(2 == 2)   //  验证码错误
//                        {
//                            connect_box.status = 2

//                            connect_box.message = "验证码超时"

//                            connect_box.btn = "重新输入"

//                            connect_box.visible = true;

//                            connect_box.callback = function()
//                            {
//                                console.log("重新输入")

//                                value = "";
//                            }
//                        }
//                        else if(3 == 3) //  验证码超时
//                        {
//                            connect_box.status = 2

//                            connect_box.message = "验证码超时"

//                            connect_box.btn = "重新获取"

//                            connect_box.visible = true;

//                            connect_box.callback = function()
//                            {
//                                console.log("重新获取")

//                                sendCode();
//                            }
//                        }
//                    })
                }
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
                    return value;

                return title;
            }

            StyleButton
            {
                z: 100

                x: value.length ? parent.width - 100 : parent.width - 60

                width: 16

                height: 36

                color: "transparent"

                anchors.verticalCenter: parent.verticalCenter

                enabled: time == 0

                visible: maxLength == 4

                Text
                {
                    anchors.centerIn: parent

                    text: time + "秒"

                    color: "#00ff00"

                    visible: time != 0

                    font.pixelSize: 22
                }

                onClick: {
                    console.log("重新发送验证码")
                }
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
                    --scene2.currentIndex
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

    onValueChanged: {
        if(value.length > maxLength)
            value = value.substring(0, maxLength)
    }

    Timer
    {
        repeat: true
        running: time > 0
        onTriggered: --time
    }

    Timer
    {
        id: timer2;
        repeat: false
        interval: 2000
        onTriggered: {
            //  登录成功后改状态跳转
            connect_box.message = "登录成功"
            ++connect_box.status
        }
    }

    function start()
    {
        time = 60
    }

    function sendCode()
    {
        console.log("发送验证码")

        //  这里写发送的代码

        if( 1 == 1 ) //  发送成功后
        {
            view_code_goto.phone = value;

            view_code_goto.start();

            view_code_goto.visible = true;

            view_code_goto.start()
        }
        else
        {
            connect_box.status = 2

            connect_box.callback = null;

            connect_box.btn = "确定"

            connect_box.message = "验证码获取失败"

            connect_box.visible = true;
        }


    }
}
