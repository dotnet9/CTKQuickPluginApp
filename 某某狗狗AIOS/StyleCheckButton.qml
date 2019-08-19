
import QtQuick 2.0


Rectangle
{
    property bool check: false

    width: 85

    height: 85

    radius: height * 0.5

    color: check ? "#00ff00" : "#282a36"

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
