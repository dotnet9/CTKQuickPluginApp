import QtQuick 2.11
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Button{

    property bool hover : false

    property int fontSize: 12

    property string fontColor: "#FFFF00"

    property string hoverColor: "#00FF00"

    MouseArea{
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor;
        acceptedButtons: Qt.NoButton
        hoverEnabled: true;
        onEntered: {
            hover = true
        }
        onExited: {
            hover = false
        }
    }

    style : ButtonStyle{

        background: Item
        {

        }

        label: UILabel{
            renderType: Text.NativeRendering
            text : control.text
            color: hover ? hoverColor : fontColor
        }

    }

}
