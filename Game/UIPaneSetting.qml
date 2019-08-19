import QtQuick 2.11

Image {

    source: "qrc:/skin/10006.jpg"
    asynchronous: true
    anchors.fill : parent

    Column
    {
        y : 30

        spacing: 30

        anchors.horizontalCenter: parent.horizontalCenter

        Row
        {
            spacing: 50

            UICheckBox
            {
                width: 130

                normalImage: "qrc:/skin/images/checkbox_01.png"

                selectImage: "qrc:/skin/images/checkbox_02.png"

                text : "获得元宝时提示"

                textColor : "#FFF"

                anchors.verticalCenter: parent.verticalCenter
            }

            UICheckBox
            {
                width: 130

                normalImage: "qrc:/skin/images/checkbox_01.png"

                selectImage: "qrc:/skin/images/checkbox_02.png"

                text : "获得金币时提示"

                textColor : "#FFF"

                anchors.verticalCenter: parent.verticalCenter
            }

            UICheckBox
            {
                width: 130

                normalImage: "qrc:/skin/images/checkbox_01.png"

                selectImage: "qrc:/skin/images/checkbox_02.png"

                text : "获得道具时提示"

                textColor : "#FFF"

                anchors.verticalCenter: parent.verticalCenter
            }
        }

        Row
        {
            spacing: 50

            UICheckBox
            {
                width: 130

                normalImage: "qrc:/skin/images/checkbox_01.png"

                selectImage: "qrc:/skin/images/checkbox_02.png"

                text : "获得经验时提示"

                textColor : "#FFF"

                anchors.verticalCenter: parent.verticalCenter
            }

            UICheckBox
            {
                width: 130

                normalImage: "qrc:/skin/images/checkbox_01.png"

                selectImage: "qrc:/skin/images/checkbox_02.png"

                text : "任务完成时提示"

                textColor : "#FFF"

                anchors.verticalCenter: parent.verticalCenter
            }

            UICheckBox
            {
                width: 130

                normalImage: "qrc:/skin/images/checkbox_01.png"

                selectImage: "qrc:/skin/images/checkbox_02.png"

                text : "卖出物品时提示"

                textColor : "#FFF"

                anchors.verticalCenter: parent.verticalCenter
            }
        }

        Row
        {
            spacing: 50

            UICheckBox
            {
                width: 130

                normalImage: "qrc:/skin/images/checkbox_01.png"

                selectImage: "qrc:/skin/images/checkbox_02.png"

                text : "充值到账时提示"

                textColor : "#FFF"

                anchors.verticalCenter: parent.verticalCenter
            }


            UICheckBox
            {
                width: 130

                normalImage: "qrc:/skin/images/checkbox_01.png"

                selectImage: "qrc:/skin/images/checkbox_02.png"

                text : "售出商品时提示"

                textColor : "#FFF"

                anchors.verticalCenter: parent.verticalCenter
            }

            UICheckBox
            {
                width: 130

                normalImage: "qrc:/skin/images/checkbox_01.png"

                selectImage: "qrc:/skin/images/checkbox_02.png"

                text : "购买商品时提示"

                textColor : "#FFF"

                anchors.verticalCenter: parent.verticalCenter
            }
        }

        Row
        {
            spacing: 50

            UICheckBox
            {
                width: 130

                normalImage: "qrc:/skin/images/checkbox_01.png"

                selectImage: "qrc:/skin/images/checkbox_02.png"

                text : "自动卖出装备"

                textColor : "#FFFF00"

                anchors.verticalCenter: parent.verticalCenter
            }

            UICheckBox
            {
                width: 130

                normalImage: "qrc:/skin/images/checkbox_01.png"

                selectImage: "qrc:/skin/images/checkbox_02.png"

                text : "显示装备职业"

                textColor : "#FFFF00"

                anchors.verticalCenter: parent.verticalCenter
            }

            UICheckBox
            {
                width: 130

                normalImage: "qrc:/skin/images/checkbox_01.png"

                selectImage: "qrc:/skin/images/checkbox_02.png"

                text : "允许网络聊天"

                textColor : "#FFFF00"

                anchors.verticalCenter: parent.verticalCenter
            }
        }
    }
}

