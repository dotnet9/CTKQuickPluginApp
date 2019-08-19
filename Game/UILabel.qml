import QtQuick 2.11

Text
{
    id : label

    color : "#FFF"

    font.family: "SimSun"

    style: Text.Raised

    styleColor: "#000"

    elide: Text.ElideRight

    renderType : Text.NativeRendering

    verticalAlignment: Text.AlignVCenter

    horizontalAlignment: Text.AlignHCenter

    property bool enableAnimation : false

    SequentialAnimation
    {
        id:eff ;

        PropertyAnimation {target: label ; property: "opacity" ; from: 1 ; to: 0.5 ; duration: 500 ;}

        PropertyAnimation {target: label ; property: "opacity" ; from: 0.5 ; to: 1 ; duration: 500 ;}
    }

    onTextChanged:
    {
        eff.running = true && enableAnimation
    }
}
