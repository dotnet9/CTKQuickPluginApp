import QtQuick 2.0

GridView {

    model: [".","0",":","4","6","7","1","5","2","3","8","9"]

    cellWidth: width / 3; cellHeight: height / 4

    signal click(string key)

    boundsBehavior: Flickable.StopAtBounds

    delegate: Rectangle {

        width: cellWidth

        height: cellHeight

        color: ink.containsMouse ? "#5d5059" : "#4d4d42"

        Rectangle
        {
            width: 1

            height: parent.height

            color: "#2F313F"
        }

        Rectangle
        {
            width: parent.width

            height: 1

            color: "#2F313F"
        }

        Behavior on color{
            ColorAnimation {
                duration: 200
            }
        }

        Text
        {
            anchors.centerIn: parent

            text: modelData

            color: "#fff"

            font.pixelSize: 26
        }

        MouseArea
        {
            id: ink;

            anchors.fill: parent

            hoverEnabled: true

            onClicked: click(modelData)
        }

    }
}
