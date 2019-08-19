import QtQuick 2.11

Image {

    source: "qrc:/skin/10001.jpg"
    asynchronous: true
    anchors.fill : parent

    signal select(int id);

    ListView {

        x : 8

        y : 35

        focus: true

        clip: true

        spacing: 5

        width : 596

        height: 380

        boundsBehavior : Flickable.StopAtBounds

        model: 12

        delegate: Row {

            id : item

            UILabel
            {
                width : 120
                height : 25
                text : "测试名称"
            }

            UILabel
            {
                width : 155
                height : 25
                text : "测试内容"
            }

            UILabel
            {
                width : 125
                height : 25
                text : "c"
            }

            UILabel
            {
                width : 100
                height : 25
                text : "66"
            }

            Item
            {
                width : 100

                height : 25

                UILinkLabel
                {
                    text : "申请加入"

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

