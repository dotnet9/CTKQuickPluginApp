import QtQuick 2.11
import QtQuick.Controls 1.4

Image {

    source: "qrc:/skin/10002.jpg"
    asynchronous: true
    anchors.fill : parent

    ListModel
    {
        id : buyModel

        ListElement {title : "物品" ; cellWidth : 165}
        ListElement {title : "价格" ; cellWidth : 105}
        ListElement {title : "出售者" ; cellWidth : 85}
        ListElement {title : "操作" ; cellWidth : 125}
    }

    ListModel
    {
        id : sellModel

        ListElement {title : "物品" ; cellWidth : 165}
        ListElement {title : "价格" ; cellWidth : 105}
        ListElement {title : "交易状态" ; cellWidth : 85}
        ListElement {title : "操作" ; cellWidth : 125}
    }

    //  分类列表

    UIListView
    {
        x : 7

        y : 7

        width : 116

        height : 380

        model: ListModel{
            ListElement {title : "全部"}
            ListElement {title : "武器"}
            ListElement {title : "衣服"}
            ListElement {title : "头盔"}
            ListElement {title : "手套"}
            ListElement {title : "鞋子"}
            ListElement {title : "项链"}
            ListElement {title : "戒指"}
            ListElement {title : "其它"}
        }
    }

    //  拍卖表头

    Row
    {
        x : 130

        y : 6

        Repeater
        {
            model : buyModel

            UILabel
            {
                width : cellWidth

                height : 25

                text : title

                color : "#ADAC90"
            }
        }
    }

    //  列表

    ListView {

        x : 126

        y : 33

        focus: true

        clip: true

        model: 8

        spacing: 1

        width : 479

        height: 380

        boundsBehavior : Flickable.StopAtBounds

        delegate: Row {

            id : item

            Item
            {
                width: 165

                height: 42

                clip: true

                Row
                {
                    x : 15

                    height: parent.height

                    spacing: 20

                    anchors.verticalCenter: parent.verticalCenter

                    Image
                    {
                        source: "qrc:/skin/003548.png"

                        width : 32

                        height: 32

                        anchors.verticalCenter: parent.verticalCenter

                        UIItem
                        {
                            width : parent.width

                            height : parent.height

                            enableEvent : false

                            anchors.verticalCenter: parent.verticalCenter

                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                    }

                    UILabel
                    {
                        text : "木棒"

                        anchors.verticalCenter: parent.verticalCenter
                    }
                }
            }

            UILabel
            {
                text : "100"

                width : 108

                height: 42
            }

            UILabel
            {
                text : "c"

                width : 80

                height: 42
            }

            Item
            {
                width : 126

                height: 42

                UILinkLabel
                {
                    text : "购买"

                    anchors.verticalCenter: parent.verticalCenter

                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }
        }
    }

    UIPage
    {
        y : 380

        anchors.horizontalCenterOffset: 60

        anchors.horizontalCenter: parent.horizontalCenter
    }

    Row
    {
        y : 406

        spacing: 15

        anchors.horizontalCenter: parent.horizontalCenter

        ExclusiveGroup
        {
            id : type
        }

        UILabel
        {
            x : 4

            text : "道具:"

            color: "#FFFF00"

            anchors.verticalCenter: parent.verticalCenter
        }

        Image
        {
            source: "qrc:/skin/003548.png"

            width : 32

            height: 32

            anchors.verticalCenter: parent.verticalCenter

            UIItem
            {
                id : item

                width : parent.width

                height : parent.height

                enableEvent : true

                anchors.verticalCenter: parent.verticalCenter

                anchors.horizontalCenter: parent.horizontalCenter

                Component.onCompleted: {
                    pid = 500
                    itemBoxManage[pid] = this;
                }
            }
        }

        Image
        {
            width : 120

            height : 20

            source: "qrc:/skin/input2.png"

            anchors.verticalCenter: parent.verticalCenter

            UILabel
            {
                x : 4

                text : "价格:"

                color: "#FFFF00"

                anchors.verticalCenter: parent.verticalCenter
            }

            TextInput
            {
                id : money

                x : 42

                width : 90

                color: "#FFFF00"

                clip : true

                maximumLength: 10

                activeFocusOnTab : true

                selectByMouse: true

                renderType: Text.NativeRendering

                validator : RegExpValidator{regExp: /[0-9]+/}

                anchors.verticalCenter: parent.verticalCenter
            }
        }

        UICheckBox
        {
            normalImage: "qrc:/skin/images/checkbox_01.png"

            selectImage: "qrc:/skin/images/checkbox_02.png"

            text : "元宝"

            textColor : "#FFFF00"

            exclusiveGroup: type

            checked: true

            anchors.verticalCenter: parent.verticalCenter
        }

        UICheckBox
        {
            id : m2

            normalImage: "qrc:/skin/images/checkbox_01.png"

            selectImage: "qrc:/skin/images/checkbox_02.png"

            text : "金币"

            textColor : "#FFFF00"

            exclusiveGroup: type

            anchors.verticalCenter: parent.verticalCenter
        }

        UIImageButton
        {
            width: 80
            height: 32
            normalImage: "qrc:/skin/images/button_01.png"
            hoverImage: "qrc:/skin/images/button_02.png"
            pressImage: "qrc:/skin/images/button_03.png"
            Text{
                text : "出售"
                color: "#FFFF00"
                style: Text.Raised
                styleColor: "#000"
                renderType: Text.NativeRendering
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
            }

            onClick: {

                item.sellItem(parseInt(money.text), m2.checked ? 1 : 0);

            }
        }
    }

}
