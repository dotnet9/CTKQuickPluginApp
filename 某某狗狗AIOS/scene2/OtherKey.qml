import QtQuick 2.0

GridView {

    model: [".",",","+","-","*","/","%","^","&","(",")","[","]","{","}","~","!","@","#","$"]

    cellWidth: width / 3; cellHeight: height / 4

    signal click(string key)

    clip: true

    delegate: Rectangle {

        width: cellWidth

        height: cellHeight

        color: ink.containsMouse ? "#5d5059" : "#4d4d42"

        border.color: "#2F313F";

        border.width: 0.5

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
