import QtQuick 2.11
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

CheckBox
{
    property string normalImage

    property string selectImage

    style: CheckBoxStyle{

        indicator: Image
        {
            source: checked ? selectImage : normalImage

            MouseArea
            {
                anchors.fill: parent

                onReleased: {
                    checked = !true
                }
            }

            Text
            {
                color: "#FFF"

                text : control.text

                style: Text.Raised

                styleColor: "#000"

                renderType: Text.NativeRendering

                anchors.verticalCenter: parent.verticalCenter

                anchors.horizontalCenter: parent.horizontalCenter

                anchors.verticalCenterOffset: 1
            }

        }

        label : Item
        {

        }
    }

}
