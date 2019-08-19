import QtQuick 2.11

Item {

    id : page

    width: 120

    height: 19

    property alias spacing: row.spacing

    property var label : []

    property int size : label.length

    property int index : 0

    signal click(int page)

    Row
    {
        id : row

        height: 19

        spacing: 12

        anchors.horizontalCenter: parent.horizontalCenter

        UIImageButton
        {
            width: 18
            height: 18
            enabled: index !== 0
            normalImage: "qrc:/skin/images/left_01.png"
            hoverImage: "qrc:/skin/images/left_02.png"
            pressImage: "qrc:/skin/images/left_03.png"
            disableImage: "qrc:/skin/images/left_04.png"
            anchors.verticalCenter: parent.verticalCenter
            onClick: {
                if(index - 1 >= 0)
                    page.click(--index)
            }
        }

        Text
        {
            text: label[index]

            color: "#FFF"

            renderType: Text.NativeRendering

            anchors.verticalCenter: parent.verticalCenter
        }

        UIImageButton
        {
            width: 18
            height: 18
            enabled: index + 1 != size
            normalImage: "qrc:/skin/images/right_01.png"
            hoverImage: "qrc:/skin/images/right_02.png"
            pressImage: "qrc:/skin/images/right_03.png"
            disableImage: "qrc:/skin/images/right_04.png"
            anchors.verticalCenter: parent.verticalCenter
            onClick: {
                if(index + 1 < size)
                    page.click(++index)
            }
        }
    }

}
