import QtQuick 2.11
//import Qt.labs.controls 1.0
import QtQuick.Controls 2.4

Image {

    z : 100
    source: "qrc:/skin/pane3.png"
    asynchronous: true
    anchors.fill: parent

    property int mode: 0

    property int startID: 1000

    Popup {

        id : itemExt

        x : - 321

        y : 45

        focus : true

        closePolicy : Popup.OnEscape


        enter : Transition
        {
            ParallelAnimation
            {
                PropertyAnimation{
                    property: "opacity"
                    from : 0.2
                    to : 1
                    duration: 200
                }

                ScaleAnimator {
                    from : 0.2
                    to : 1
                    duration: 200
                }
            }
        }

        exit : Transition {

            PropertyAnimation{
                property: "opacity"
                from : 1
                to :0.2
                duration: 200
            }

            ScaleAnimator {
                from : 1
                to : 0.2
                duration: 200
            }

        }

        background: Image
        {
            id : back

            source: {
                if(mode == 0)
                    return "qrc:/skin/popup_01.png"
                else if(mode == 1)
                    return "qrc:/skin/popup_02.png"
                return "qrc:/skin/popup_03.png"
            }

            UIImageButton
            {
                x: 260
                y : 3
                width: 37
                height: 34
                normalImage: "qrc:/skin/images/close_01.png"
                hoverImage: "qrc:/skin/images/close_02.png"
                pressImage: "qrc:/skin/images/close_03.png"
                onClick: {
                    itemExt.visible = false
                }
            }

            UIImageButton
            {
                y : {
                    if(mode == 0)
                        return 255
                    else if(mode == 1)
                        return 270
                    return 275
                }

                width: 80
                height: 32
                normalImage: "qrc:/skin/images/button_01.png"
                hoverImage: "qrc:/skin/images/button_02.png"
                pressImage: "qrc:/skin/images/button_03.png"
                anchors.horizontalCenter: parent.horizontalCenter

                Text{
                    text : {
                        if(mode == 0)
                            return "提炼"
                        else if(mode == 1)
                            return "鉴定"
                        return "强化"
                    }
                    color: "#FFFF00"
                    style: Text.Raised
                    styleColor: "#000"
                    renderType: Text.NativeRendering
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                }

            }
        }

    }

    Repeater
    {
        model: 10

        Item
        {
            visible : page_item.index === index + 1

            Repeater
            {
                model : 60

                UIItem
                {
                    x : index % 6 * 44 + 2
                    y : Math.floor(index / 6) * 44 + 2
                    width : 40
                    height : 40
                    pos: 1
                    enableEvent: true
                    Component.onCompleted: {
                        pid = ++startID
                        itemBoxManage[pid] = this;
                    }
                }
            }
        }
    }

    Column
    {
        y : 445

        anchors.horizontalCenter: parent.horizontalCenter

        spacing: 5

        Row
        {
            spacing: 10

            Repeater
            {
                model : ListModel
                {
                    ListElement {title : "回收"}
                    ListElement {title : "整理"}
                    ListElement {title : "锁定/解锁"}
                }

                UIImageButton
                {
                    width: 80
                    height: 32
                    normalImage: "qrc:/skin/images/button_01.png"
                    hoverImage: "qrc:/skin/images/button_02.png"
                    pressImage: "qrc:/skin/images/button_03.png"
                    Text{
                        text : title
                        color: "#FFFF00"
                        style: Text.Raised
                        styleColor: "#000"
                        renderType: Text.NativeRendering
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                    onClick: {

                        if(index == 0)
                        {

                        }
                        else if(index == 1)
                        {

                        }
                        else if(index == 2)
                        {
                            if(currentItem)
                                itemBoxManage[currentItem].lockItem();
                        }

                    }
                }
            }
        }
    }

    UILabel
    {
        x : 40
        y : 522
        text : money1
        color: "#FFF"
        enableAnimation: true
    }

    UILabel
    {
        x : 170
        y : 522
        text : money2
        color: "#FFF"
        enableAnimation: true
    }

    UILabel
    {
        x : 40
        y : 551
        text : money3
        color: "#FFF"
        enableAnimation: true
    }

    UILabel
    {
        x : 170
        y : 551
        text : money4
        color: "#FFF"
        enableAnimation: true
    }

    UIPage
    {
        id : page_item

        y : 486

        anchors.horizontalCenter: parent.horizontalCenter
    }
}
