import QtQuick 2.11
import QtQuick.Controls 2.4

ToolTip {

    id : tip

    background: Rectangle{
        color : "#A0000000"
        radius: 2
    }

    contentItem : Text
    {
        text : tip.text

        font.family: "SimSun"

        color: "#FFFF00"

        elide: Text.ElideRight

        renderType : Text.NativeRendering

        verticalAlignment: Text.AlignVCenter

        horizontalAlignment: Text.AlignHCenter
    }

}
