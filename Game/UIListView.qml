import QtQuick 2.11

ListView {

    x : 144

    y : 37

    focus: true

    clip: true

    width : 458

    height: 360

    boundsBehavior : Flickable.StopAtBounds

    delegate: Rectangle {

        width : parent.width

        height: 26

        color : ListView.isCurrentItem ? "#90A00000" : (hover ? "#60A00000" : "transparent")

        property bool hover: false

        UILabel
        {
            anchors.fill: parent

            text : title
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
}
