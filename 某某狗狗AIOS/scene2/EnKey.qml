import QtQuick 2.0

Column
{
    property bool lowMode: true;

    signal click(string key)

    ListModel
    {
        id: keys
    }

    Row
    {
        width: parent.width

        height: parent.height / 4

        Repeater
        {
            model: keys

            Rectangle {

                width: parent.width / 4

                height: parent.height

                color: ink.containsMouse ? "#5d5059" : "#4d4d42"

                Behavior on color{
                    ColorAnimation {
                        duration: 200
                    }
                }

                Rectangle
                {
                    width: 1

                    height: parent.height * 0.8

                    anchors.verticalCenter: parent.verticalCenter

                    color: "#60ffffff"

                    visible: index != 3
                }

                Text
                {
                    anchors.centerIn: parent

                    text: lowMode ? key : key.toUpperCase()

                    color: "#fff"

                    font.pixelSize: 26
                }

                MouseArea
                {
                    id: ink;

                    anchors.fill: parent

                    hoverEnabled: true

                    enabled: key.length

                    onClicked: if(key) click(lowMode ? key : key.toUpperCase())
                }
            }
        }
    }

    GridView {

        width: parent.width

        height: parent.height / 4 * 3

        model: ["","abc","def","ghi","jkl","mno","pqrs","tuv","wxyz"]

        cellWidth: width / 3; cellHeight: height / 3

        boundsBehavior: Flickable.StopAtBounds

        delegate: Rectangle {

            width: parent.width / 3

            height: parent.height / 3

            color: ink2.containsMouse ? "#1d2029" : "#0d0d12"

            Rectangle
            {
                width: 1

                height: parent.height

                color: "#2F313F"

                anchors.right: parent.right
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

            Image
            {
                source: "qrc:/skin/top.png"

                visible: index == 0

                anchors.centerIn: parent
            }

            Text
            {
                anchors.centerIn: parent

                text: lowMode ? modelData : modelData.toUpperCase()

                color: "#fff"

                font.pointSize: 16

            }

            MouseArea
            {
                id: ink2;

                anchors.fill: parent

                hoverEnabled: true

                onClicked: {

                    if(index == 0)
                    {
                        lowMode = !lowMode

                        return;
                    }

                    keys.clear()

                    if(lowMode)
                    {
                        keys.append({key: modelData.substring(0, 1)})
                        keys.append({key: modelData.substring(1, 2)})
                        keys.append({key: modelData.substring(2, 3)})
                        keys.append({key: modelData.substring(3, 4)})
                    }
                    else
                    {
                        keys.append({key: modelData.substring(0, 1).toUpperCase()})
                        keys.append({key: modelData.substring(1, 2).toUpperCase()})
                        keys.append({key: modelData.substring(2, 3).toUpperCase()})
                        keys.append({key: modelData.substring(3, 4).toUpperCase()})
                    }
                }
            }

        }
    }
}

