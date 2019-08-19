import QtQuick 2.11
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

CheckBox
{
    property string normalImage

    property string selectImage

    property string textColor : "#fff"

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
        }

        label : UILabel
        {
            id : t
            padding : 10
            text : control.text
            color : textColor
        }
    }

}
