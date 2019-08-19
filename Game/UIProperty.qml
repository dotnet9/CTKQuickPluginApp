import QtQuick 2.11

Column
{
    spacing: 15

    property int dcMin : 0
    property int dcMax : 0
    property int mcMin : 0
    property int mcMax : 0
    property int scMin : 0
    property int scMax : 0
    property int acMin : 0
    property int acMax : 0
    property int macMin : 0
    property int macMax : 0
    property int hit : 0
    property int dedge : 0
    property int crtical : 0

    Row
    {
        spacing: 10

        Image {

            width: 130

            height: 20

            source: "qrc:/skin/property.png"

            UILabel
            {
                id : label

                x : 23

                text: "物 攻: " + dcMin + " - " + dcMax

                color: "#FFFF00"

                anchors.verticalCenter: parent.verticalCenter

                enableAnimation: true
            }

        }

        Image {

            width: 130

            height: 20

            source: "qrc:/skin/property.png"

            UILabel
            {
                x : 30

                text: "命 中: " + hit

                color: "#FFFF00"

                enableAnimation: true

                anchors.verticalCenter: parent.verticalCenter
            }

        }
    }

    Row
    {
        spacing: 10

        Image {

            width: 130

            height: 20

            source: "qrc:/skin/property.png"

            UILabel
            {
                x : 23

                text: "魔 攻: " + mcMin + " - " + mcMax

                color: "#FFFF00"

                enableAnimation: true

                anchors.verticalCenter: parent.verticalCenter
            }

        }

        Image {

            width: 130

            height: 20

            source: "qrc:/skin/property.png"

            UILabel
            {
                x : 30

                text: "躲 避: " + dedge

                color: "#FFFF00"

                enableAnimation: true

                anchors.verticalCenter: parent.verticalCenter
            }

        }
    }

    Row
    {
        spacing: 10

        Image {

            width: 130

            height: 20

            source: "qrc:/skin/property.png"

            UILabel
            {
                x : 23

                text: "道 攻: " + scMin + " - " + scMax

                color: "#FFFF00"

                enableAnimation: true

                anchors.verticalCenter: parent.verticalCenter
            }

        }

        Image {

            width: 130

            height: 20

            source: "qrc:/skin/property.png"

            UILabel
            {
                x : 30

                text: "暴 击: " + crtical

                color: "#FFFF00"

                enableAnimation: true

                anchors.verticalCenter: parent.verticalCenter
            }

        }
    }

    Image {

        width: 130

        height: 20

        source: "qrc:/skin/property.png"

        UILabel
        {
            x : 23

            text: "物 防: " + acMin + " - " + acMax

            color: "#FFFF00"

            enableAnimation: true

            anchors.verticalCenter: parent.verticalCenter
        }

    }

    Image {

        width: 130

        height: 20

        source: "qrc:/skin/property.png"

        UILabel
        {
            x : 23

            text: "魔 防: " + macMin + " - " + macMax

            color: "#FFFF00"

            enableAnimation: true

            anchors.verticalCenter: parent.verticalCenter
        }

    }
}
