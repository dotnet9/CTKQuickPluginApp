import QtQuick 2.11

Image {

    source: "qrc:/skin/10004.jpg"
    asynchronous: true
    anchors.fill : parent

    //  排名类型

    UIListView
    {
        x : 6

        y : 6

        width : 130

        height : 380

        model: ListModel{
            ListElement {title : "战士·等级"}
            ListElement {title : "法师·等级"}
            ListElement {title : "道士·等级"}
            ListElement {title : "战士·战斗力"}
            ListElement {title : "法师·战斗力"}
            ListElement {title : "道士·战斗力"}
        }
    }

    //  排名表头

    Row
    {
        x : 140

        y : 6

        Repeater
        {
            model : ListModel{

                ListElement{
                    title : "排名"
                    cellWidth : 70
                }

                ListElement{
                    title : "名称"
                    cellWidth : 130
                }

                ListElement{
                    title : "性别"
                    cellWidth : 66
                }

                ListElement{
                    title : "等级"
                    cellWidth : 68
                }

                ListElement{
                    title : "操作"
                    cellWidth : 132
                }

            }

            UILabel
            {
                width : cellWidth

                height : 25

                text : title

                color : "#ADAC90"
            }
        }
    }

    ListView {

        x : 144

        y : 37

        focus: true

        clip: true

        model: 12

        spacing: 5

        width : 458

        height: 360

        boundsBehavior : Flickable.StopAtBounds


        delegate: Row {

            id : item

            UILabel
            {
                text : index

                width : 60

                height: 25
            }

            UILabel
            {
                text : "name"

                width : 130

                height: 25
            }

            UILabel
            {
                text : "男"

                width : 70

                height: 25
            }

            UILabel
            {
                text : "99"

                width : 70

                height: 25
            }

            Item
            {
                width : 135

                height: 25

                UILinkLabel
                {
                    text : "查看详情"

                    anchors.verticalCenter: parent.verticalCenter

                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }
        }
    }

    UIPage
    {
        y : 413

        anchors.horizontalCenter: parent.horizontalCenter
    }
}
