import QtQuick 2.11
import QtQuick.Controls 1.4

Item
{
    Image {

        source: "qrc:/skin/10000.jpg"
        asynchronous: true
        anchors.fill : parent

        UIMapListView
        {
            id : list
            x : 8
            y : 12
            width: 252
            height: 388
        }

        Row
        {
            x : 14

            y : 406

            spacing: 35

            ExclusiveGroup
            {
                id : type
            }

            UICheckBox
            {
                normalImage: "qrc:/skin/images/checkbox_01.png"

                selectImage: "qrc:/skin/images/checkbox_02.png"

                text : "普通"

                checked: true

                exclusiveGroup: type

                anchors.verticalCenter: parent.verticalCenter
            }

            UICheckBox
            {
                normalImage: "qrc:/skin/images/checkbox_01.png"

                selectImage: "qrc:/skin/images/checkbox_02.png"

                text : "困难"

                textColor : "#20FF20"

                exclusiveGroup: type

                anchors.verticalCenter: parent.verticalCenter
            }

            UICheckBox
            {
                normalImage: "qrc:/skin/images/checkbox_01.png"

                selectImage: "qrc:/skin/images/checkbox_02.png"

                text : "地狱"

                textColor : "#FFFF00"

                exclusiveGroup: type

                anchors.verticalCenter: parent.verticalCenter
            }

            Row
            {
                spacing: 15

                anchors.verticalCenter: parent.verticalCenter

                UIImageButton
                {
                    width: 80
                    height: 32
                    normalImage: "qrc:/skin/images/button_01.png"
                    hoverImage: "qrc:/skin/images/button_02.png"
                    pressImage: "qrc:/skin/images/button_03.png"
                    Text{
                        text : "开荒"
                        color: "#FFFF00"
                        style: Text.Raised
                        styleColor: "#000"
                        renderType: Text.NativeRendering
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }

                UIImageButton
                {
                    width: 80
                    height: 32
                    normalImage: "qrc:/skin/images/button_01.png"
                    hoverImage: "qrc:/skin/images/button_02.png"
                    pressImage: "qrc:/skin/images/button_03.png"
                    Text{
                        text : "扫荡"
                        color: "#FFFF00"
                        style: Text.Raised
                        styleColor: "#000"
                        renderType: Text.NativeRendering
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }

                UIImageButton
                {
                    width: 80
                    height: 32
                    normalImage: "qrc:/skin/images/button_01.png"
                    hoverImage: "qrc:/skin/images/button_02.png"
                    pressImage: "qrc:/skin/images/button_03.png"
                    Text{
                        text : "挂机"
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

    }

    Component.onCompleted:
    {
        var map = [
            "新手村",
            "苍月岛",
            "封魔谷",
            "天然矿洞",
            "赤月魔穴",
            "尸魔洞",
            "丧尸坟1层",
            "丧尸坟2层",
            "丧尸坟3层",
            "封魔禁地"
        ]

        for(var i=0;i<10;++i)
            list.addSession("qrc:/skin/map/100" + i + ".png", i, map[i], "推荐等级 10~20")
    }
}
