import QtQuick 2.11

Image {

    id : page

    width: 92

    height: 19

    asynchronous: true

    source: "qrc:/skin/page.png"

    property int index : 1

    property int size : 10

    signal click(int page)

    Row
    {
        height: 19

        spacing: 8

        anchors.horizontalCenter: parent.horizontalCenter

        UIImageButton
        {
            width: 18
            height: 18
            normalImage: "qrc:/skin/images/left_01.png"
            hoverImage: "qrc:/skin/images/left_02.png"
            pressImage: "qrc:/skin/images/left_03.png"
            anchors.verticalCenter: parent.verticalCenter
            onClick: {
                if(index - 1 >= 1)
                    page.click(--index)
            }
        }

        Text
        {
            text: index + "/" + size

            color: "#FFF"

            renderType: Text.NativeRendering

            anchors.verticalCenter: parent.verticalCenter
        }

        UIImageButton
        {
            width: 18
            height: 18
            normalImage: "qrc:/skin/images/right_01.png"
            hoverImage: "qrc:/skin/images/right_02.png"
            pressImage: "qrc:/skin/images/right_03.png"
            anchors.verticalCenter: parent.verticalCenter
            onClick: {
                if(index + 1 <= size)
                    page.click(++index)
            }
        }
    }

}
