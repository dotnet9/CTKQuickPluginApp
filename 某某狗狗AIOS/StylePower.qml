import QtQuick 2.0
import QtQuick.Controls 2.1

ProgressBar {

    id: control
    to: 100
    value: 100
    padding: 2
    width: 48
    height: 48

    background: Image {

        width: 48

        height: 48

        source: "qrc:/skin/dl.png"

        Rectangle
        {
            anchors.verticalCenter: parent.verticalCenter

            x: 7

            width: control.visualPosition * 28

            height: 16
        }
    }

    contentItem: Item {}
}
