
import QtQuick 2.0


Rectangle
{
    property alias area: ink

    width: 80

    height: 80

    radius: height * 0.5

//    color: ink.containsMouse ? "#a0ffffff" : "#60ffffff"

    signal click()

    Behavior on color{
        ColorAnimation {
            duration: 200
        }
    }

    MouseArea
    {
        id: ink;

        anchors.fill: parent

        hoverEnabled: true

        onClicked: click()
    }
}
