import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import QtGraphicalEffects 1.0
import "../"

Item
{
    Column
    {
        spacing: 20

        anchors.centerIn: parent

        anchors.verticalCenterOffset: - 10

        Text {
            text: "word fuck"

            color: "#fff"

            font.pixelSize: 34
        }

        Text
        {
            id: timeLabel

            anchors.horizontalCenter: parent.horizontalCenter

            text: formatTime()

            color: "#fff"

            font.pointSize: 22
        }
    }

    Item
    {
        width: parent.width

        height: 50

        anchors.bottom: parent.bottom

        StyleButton
        {
            x: 10

            width: 36

            height: 36

            anchors.verticalCenter: parent.verticalCenter

            color: "transparent"

            Image
            {
                width: 32

                height: 32

                source: "qrc:/skin/ic_voice.png"

                anchors.centerIn: parent
            }

            onClick: swipe2.currentIndex = 0
        }

        StyleButton
        {
            x: parent.width -  46

            width: 36

            height: 36

            anchors.verticalCenter: parent.verticalCenter

            color: "transparent"

            Image
            {
                width: 32

                height: 32

                source: "qrc:/skin/ic_my.png"

                anchors.centerIn: parent
            }

            onClick: swipe2.currentIndex = 2
        }
    }

    Timer
    {
        running: true

        repeat: true

        interval: 1000

        onTriggered: timeLabel.text = formatTime()
    }

    function formatTime()
    {
        return Qt.formatDateTime(new Date(), "hh:mm")
    }
}


