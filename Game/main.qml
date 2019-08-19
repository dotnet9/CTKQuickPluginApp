import QtQuick 2.11
import QtQuick.Window 2.2
import QtQuick.Controls 2.4
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.2
import QtGraphicalEffects 1.0
//import Qt.labs.controls 1.0
//import api.socket.ext 1.0
import "Socket.js" as Socket

ApplicationWindow {

    id : window
    visible: true
    width: 1300
    height: 740
    title: "匠心传奇 - [用心缔造快乐 简单而不平凡] QQ群 6634589（新手礼包）"
    color: "transparent"
    flags: Qt.Window | Qt.FramelessWindowHint | Qt.WindowSystemMenuHint| Qt.WindowMinimizeButtonHint | Qt.WindowMaximizeButtonHint

    property int globalX : 0

    property int globalY : 0

    property var callbackManage: []

    property var syncEventManage: []

    property int money1 : 0

    property int money2 : 0

    property int money3 : 0

    property int money4 : 0

    property int config : 0

    property string gamename : "匠心传奇"

    property var currentItem : null

    property var itemProperty : []

    property var objectProperty : []

    property var itemBoxManage : []

//    SocketExt
//    {
//        id : client

//        onConnected:
//        {
//            if(!status)
//                console.log("连接服务器出错...")
//        }

//        onRecved:
//        {
//            console.log(buffer)

//            var json = JSON.parse(buffer)

//            if(json)
//            {
//                if(json.code === 1)
//                {
//                    if(json.change)
//                    {
//                        var pty = objectProperty[json.carerr]

//                        for(var key in json.change)
//                            pty[key] = json.change[key]

//                        pane_role.updateProperty()
//                    }
//                }

//                if(Socket.callback(json))
//                    return

//                if(json.method === "loader")
//                {
//                    money1 = json.user[0]
//                    money2 = json.user[1]
//                    money3 = json.user[2]
//                    money4 = json.user[3]
//                    config = json.user[4]
//                    gamename = json.user[5]

//                    view_login.close()

//                    for(var i=0;i<json.object.length;++i)
//                    {
//                        objectProperty.push({
//                            sex      : json.object[i][0],
//                            carerr   : json.object[i][1],
//                            level    : json.object[i][2],
//                            exp      : json.object[i][3],
//                            hp       : json.object[i][4],
//                            dcMin    : json.object[i][5],
//                            dcMax    : json.object[i][6],
//                            mcMin    : json.object[i][7],
//                            mcMax    : json.object[i][8],
//                            scMin    : json.object[i][9],
//                            scMax    : json.object[i][10],
//                            acMin    : json.object[i][11],
//                            acMax    : json.object[i][12],
//                            macMin   : json.object[i][13],
//                            macMax   : json.object[i][14],
//                            hit      : json.object[i][15],
//                            dedge    : json.object[i][16],
//                            crtical  : json.object[i][17]
//                        })
//                    }

//                    for(var i=0;i<json.item.length;++i)
//                    {
//                        var iid = json.item[i][0]
//                        var pid = json.item[i][1]
//                        var name = json.item[i][2]
//                        var sex = json.item[i][3]
//                        var carerr = json.item[i][4]
//                        var locked = (json.item[i][5] === 1)
//                        itemBoxManage[pid].setItem(name,iid, locked)
//                    }

//                    pane_role.updateProperty();
//                }
//            }
//        }

//        Component.onCompleted: {
//            connect()
//        }
//    }

    UILoginView
    {
        id : view_login

        z : 1
    }

    Rectangle{

        id : back
        x : 10
        y : 10
        width : 1280
        height : 720

        Image
        {
            anchors.fill: parent
            asynchronous : true
            source: "qrc:/skin/back.jpg"
        }

        UILabel
        {
            text : title

            x : 89

            y : 11
        }

        Item
        {
            width: parent.width - 100

            height: 30

            Row
            {
                x : 830

                y : 7

                spacing: 20

                UILinkLabel
                {
                    text : "世界BOSS"
                }

                UILinkLabel
                {
                    text : "激活礼包"
                }

                UILinkLabel
                {
                    text : "经验加成"
                }

                UILinkLabel
                {
                    text : "我的会员"
                }

                UILinkLabel
                {
                    text : "在线充值"
                }

            }
        }

        UIImageButton
        {
            x: 1242
            y : 2
            width: 37
            height: 34
            normalImage: "qrc:/skin/images/close_01.png"
            hoverImage: "qrc:/skin/images/close_02.png"
            pressImage: "qrc:/skin/images/close_03.png"
        }

        ExclusiveGroup
        {
            id : table_left
        }

        ExclusiveGroup
        {
            id : table_right
        }

        ExclusiveGroup
        {
            id : table_center
        }

        UITabButton
        {
            x : 97
            y : 49
            normalImage: "qrc:/skin/images/tab_01.png"
            selectImage: "qrc:/skin/images/tab_02.png"
            text : "人物"
            checked: true
            exclusiveGroup: table_left
            onClicked: {
                stack_left.currentIndex = 0
            }
        }

        UITabButton
        {
            x : 177
            y : 49
            normalImage: "qrc:/skin/images/tab_01.png"
            selectImage: "qrc:/skin/images/tab_02.png"
            text : "技能"
            exclusiveGroup: table_left
            onClicked: {
                stack_left.currentIndex = 1
            }
        }

        UITabButton
        {
            x : 1026
            y : 49
            normalImage: "qrc:/skin/images/tab_01.png"
            selectImage: "qrc:/skin/images/tab_02.png"
            text : "道具"
            checked: true
            exclusiveGroup: table_right
            onClicked: {
                stack_right.currentIndex = 0
            }
        }

        UITabButton
        {
            x : 1106
            y : 49
            normalImage: "qrc:/skin/images/tab_01.png"
            selectImage: "qrc:/skin/images/tab_02.png"
            text : "日常活动"
            exclusiveGroup: table_right
            onClicked: {
                stack_right.currentIndex = 1
            }
        }

        Row
        {
            y : 49

            anchors.horizontalCenter: parent.horizontalCenter

            Repeater
            {
                model : ListModel
                {
                    ListElement {title : "战斗"}
                    ListElement {title : "行会"}
                    ListElement {title : "寄售"}
                    ListElement {title : "擂台"}
                    ListElement {title : "排行"}
                    ListElement {title : "商城"}
                    ListElement {title : "设置"}
                }

                UITabButton
                {
                    id : btn
                    normalImage: "qrc:/skin/images/tab_01.png"
                    selectImage: "qrc:/skin/images/tab_02.png"
                    text : title
                    exclusiveGroup: table_center


                    Component.onCompleted: {
                        checked = index === 0
                    }
                    onClicked: {
                        stack_center.currentIndex = index
                    }
                }
            }
        }

        StackLayout
        {
            z : 100

            id : stack_left

            x : 27

            y : 77

            width : 296

            height: 605

            currentIndex: 0

            UIPaneRole
            {
                z : 101

                id : pane_role
            }

            UIPaneSkill
            {

            }
        }

        StackLayout
        {
            z : 100

            id : stack_right

            x : 972

            y : 94

            width : 264

            height: 570

            currentIndex: 0

            UIPaneItem
            {
                z : 100
            }
        }

        StackLayout
        {
            id : stack_center

            x : 334

            y : 80

            width: 612

            height: 440

            UIPaneGame
            {

            }

            UIPaneGuild
            {

            }

            UIPaneSell
            {

            }

            Item
            {

            }

            UIPaneSort
            {

            }

            Item
            {

            }

            UIPaneSetting
            {

            }
        }

    }

    UIPaneInput
    {
        id : pane_input

        x : 351

        y : 550

        width : 598

        height: 130

    }

    Shortcut
    {
        sequences : ["Return", "Enter"]

        context: Qt.ApplicationShortcut

        onActivated: pane_input.send()
    }

    Glow {
        z : - 1
        anchors.fill: back
        radius: 10.0
        samples: 18
        color: "#A0000000"
        source: back
        spread: 0.0
    }

}
