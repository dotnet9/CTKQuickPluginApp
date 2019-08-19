import QtQuick 2.11
import QtQuick.Window 2.2
import QtQuick.Controls 2.4
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
//import Qt.labs.controls 1.0

ListView {

    focus: true

    clip: true

    spacing: 3

    boundsBehavior : Flickable.StopAtBounds

    ScrollBar.vertical: ScrollBar {
        onActiveChanged: {
            active = true;
        }
        Component.onCompleted: {
            active = true;
//            handle.color = "#A0FFFF60";
        }
    }

    model: ListModel
    {
        id : msgModel
    }

    delegate: Image {

        property bool hover : false

        source: image

        width : parent.width

        height : 68

        Rectangle
        {
            id : item

            width : parent.width

            height: parent.height

            color : parent.ListView.isCurrentItem ? "#5000c000" : "transparent"

            Item
            {
                width : parent.width - 36

                height : parent.height - 12

                anchors.verticalCenter: parent.verticalCenter

                Column
                {
                    spacing: 16

                    width : parent.width - 100

                    anchors.right: parent.right

                    anchors.verticalCenter: parent.verticalCenter

                    anchors.verticalCenterOffset: 3

                    UILabel {
                        text: name
                        font.pixelSize: 16
                        anchors.right: parent.right
                    }

                    UILabel {
                        text: label
                        font.pixelSize: 12
                        color : "#FFFF00"
                        anchors.right: parent.right
                    }
                }
            }

        }

        MouseArea
        {
            anchors.fill: parent

            hoverEnabled: true

            onEntered: {
                hover = true
            }

            onExited: {
                hover = false
            }

            onClicked:
            {
                hover = false

                parent.ListView.view.currentIndex = index
            }
        }

    }

    function addSession(image, mapID, name, label)
    {
        msgModel.append(
        {
            "image" : image,
            "mapID" : mapID,
            "name" : name,
            "label" : label,
        })
    }

}
