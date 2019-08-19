import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.11
//import QtQuick.Layouts 1.3
//import Qt.labs.controls 1.0
import "Socket.js" as Socket

Popup {

    id : popup

    background: Image
    {
        x : 22

        y : 47

        width : 1256

        height : 662

        source: "qrc:/skin/login.jpg"
    }

    exit : Transition {

        PropertyAnimation{
            property: "opacity"
            from : 1
            to :0
            duration: 1000
        }
    }

    StackLayout
    {
        id : stack

        anchors.verticalCenter: parent.verticalCenter

        anchors.horizontalCenter: parent.horizontalCenter

        anchors.verticalCenterOffset: 45

        Column
        {
            width : 260

            spacing: 15

            anchors.verticalCenter: parent.verticalCenter

            anchors.horizontalCenter: parent.horizontalCenter

            Image
            {
                width : 200

                height : 33

                source: "qrc:/skin/input.png"

                UILabel
                {
                    x : 15

                    text : "账号:"

                    color: "#FFFF00"

                    anchors.verticalCenter: parent.verticalCenter
                }

                TextInput
                {
                    id : l_username

                    x : 80

                    width : 100

                    color: "#FFF"

                    clip : true

                    maximumLength: 30

                    activeFocusOnTab : true

                    selectByMouse: true

                    renderType: Text.NativeRendering

                    anchors.verticalCenter: parent.verticalCenter

                    Component.onCompleted: {
                        focus = true
                    }
                }
            }

            Image
            {
                width : 200

                height : 33

                source: "qrc:/skin/input.png"

                UILabel
                {
                    x : 15

                    text : "密码:"

                    color: "#FFFF00"

                    anchors.verticalCenter: parent.verticalCenter
                }

                TextInput
                {
                    id : l_password

                    x : 80

                    width : 100

                    color: "#FFF"

                    clip : true

                    maximumLength: 30

                    activeFocusOnTab : true

                    selectByMouse: true

                    renderType: Text.NativeRendering

                    echoMode : TextInput.Password

                    passwordCharacter : "*"

                    anchors.verticalCenter: parent.verticalCenter
                }
            }

            UIImageButton
            {
                normalImage: "qrc:/skin/images/login_button_01.png"
                hoverImage: "qrc:/skin/images/login_button_02.png"
                pressImage: "qrc:/skin/images/login_button_03.png"
                anchors.horizontalCenter: parent.horizontalCenter

                UILabel
                {
                    text : "登 陆"

                    anchors.verticalCenter: parent.verticalCenter

                    anchors.horizontalCenter: parent.horizontalCenter
                }

                onClick:
                {
                    var buf = Socket.requestLogin(
                        l_username.text,
                        Qt.md5(l_password.text),
                        function(result)
                    {
                        if(result.code === 1)
                        {
                            var buf = Socket.requestLoader();

                            client.write(buf)
                        }
                    });

                    client.write(buf)
                }
            }

            UIImageButton
            {
                normalImage: "qrc:/skin/images/login_button_01.png"
                hoverImage: "qrc:/skin/images/login_button_02.png"
                pressImage: "qrc:/skin/images/login_button_03.png"
                anchors.horizontalCenter: parent.horizontalCenter
                UILabel
                {
                    text : "注册账号"

                    anchors.verticalCenter: parent.verticalCenter

                    anchors.horizontalCenter: parent.horizontalCenter
                }
                onClick:
                {
                    r_username.focus = true

                    stack.currentIndex = 1
                }
            }
        }

        Column
        {
            width : 260

            spacing: 15

            visible: false

            anchors.verticalCenter: parent.verticalCenter

            anchors.horizontalCenter: parent.horizontalCenter

            Image
            {
                width : 200

                height : 33

                source: "qrc:/skin/input.png"

                UILabel
                {
                    x : 15

                    text : "账号:"

                    color: "#FFFF00"

                    anchors.verticalCenter: parent.verticalCenter
                }

                TextInput
                {
                    id : r_username

                    x : 80

                    width : 100

                    color: "#FFF"

                    clip : true

                    maximumLength: 30

                    activeFocusOnTab : true

                    selectByMouse: true

                    renderType: Text.NativeRendering

                    anchors.verticalCenter: parent.verticalCenter
                }
            }

            Image
            {
                width : 200

                height : 33

                source: "qrc:/skin/input.png"

                UILabel
                {
                    x : 15

                    text : "密码:"

                    color: "#FFFF00"

                    anchors.verticalCenter: parent.verticalCenter
                }

                TextInput
                {
                    id : r_password

                    x : 80

                    width : 100

                    color: "#FFF"

                    clip : true

                    maximumLength: 30

                    activeFocusOnTab : true

                    selectByMouse: true

                    renderType: Text.NativeRendering

                    echoMode : TextInput.Password

                    passwordCharacter : "*"

                    anchors.verticalCenter: parent.verticalCenter
                }
            }

            Image
            {
                width : 200

                height : 33

                source: "qrc:/skin/input.png"

                UILabel
                {
                    x : 15

                    text : "重复密码:"

                    color: "#FFFF00"

                    anchors.verticalCenter: parent.verticalCenter
                }

                TextInput
                {
                    id : l_password2

                    x : 80

                    width : 100

                    color: "#FFF"

                    clip : true

                    maximumLength: 30

                    activeFocusOnTab : true

                    selectByMouse: true

                    renderType: Text.NativeRendering

                    echoMode : TextInput.Password

                    passwordCharacter : "*"

                    anchors.verticalCenter: parent.verticalCenter
                }
            }

            Image
            {
                width : 200

                height : 33

                source: "qrc:/skin/input.png"

                UILabel
                {
                    x : 15

                    text : "昵称:"

                    color: "#FFFF00"

                    anchors.verticalCenter: parent.verticalCenter
                }

                TextInput
                {
                    id : r_gamename

                    x : 80

                    width : 100

                    color: "#FFF"

                    clip : true

                    maximumLength: 30

                    activeFocusOnTab : true

                    selectByMouse: true

                    renderType: Text.NativeRendering

                    anchors.verticalCenter: parent.verticalCenter
                }
            }

            Image
            {
                width : 200

                height : 33

                source: "qrc:/skin/input.png"

                UILabel
                {
                    x : 15

                    text : "手机:"

                    color: "#FFFF00"

                    anchors.verticalCenter: parent.verticalCenter
                }

                TextInput
                {
                    id : r_phone

                    x : 80

                    width : 100

                    color: "#FFF"

                    clip : true

                    maximumLength: 30

                    activeFocusOnTab : true

                    selectByMouse: true

                    renderType: Text.NativeRendering

                    validator : RegExpValidator{regExp: /1[0-9]+/}

                    anchors.verticalCenter: parent.verticalCenter
                }
            }

            Row
            {
                spacing: 32

                anchors.horizontalCenter: parent.horizontalCenter

                ExclusiveGroup
                {
                    id : group
                }

                UICheckBox
                {
                    width: 40
                    height: 40
                    checked: true
                    exclusiveGroup: group
                    normalImage: "qrc:/skin/images/nan_01.png"
                    selectImage: "qrc:/skin/images/nan_02.png"
                }

                UICheckBox
                {
                    width: 40
                    height: 40
                    exclusiveGroup: group
                    normalImage: "qrc:/skin/images/nv_01.png"
                    selectImage: "qrc:/skin/images/nv_02.png"
                }
            }

            UIImageButton
            {
                normalImage: "qrc:/skin/images/login_button_01.png"
                hoverImage: "qrc:/skin/images/login_button_02.png"
                pressImage: "qrc:/skin/images/login_button_03.png"
                anchors.horizontalCenter: parent.horizontalCenter
                UILabel
                {
                    text : "注 册"

                    anchors.verticalCenter: parent.verticalCenter

                    anchors.horizontalCenter: parent.horizontalCenter
                }

                onClick:
                {
                    var buf = Socket.requestRegister(
                        r_username.text,
                        Qt.md5(r_password.text),
                        r_phone.text,
                        r_gamename.text, function(status)
                        {

                        }
                    )

                    client.write(buf);
                }
            }

            UIImageButton
            {
                normalImage: "qrc:/skin/images/login_button_01.png"
                hoverImage: "qrc:/skin/images/login_button_02.png"
                pressImage: "qrc:/skin/images/login_button_03.png"
                anchors.horizontalCenter: parent.horizontalCenter
                UILabel
                {
                    text : "返 回"

                    anchors.verticalCenter: parent.verticalCenter

                    anchors.horizontalCenter: parent.horizontalCenter
                }
                onClick:
                {
                    l_username.focus = true

                    stack.currentIndex = 0
                }
            }
        }
    }


    Component.onCompleted: {
        open()
    }
}
