import QtQuick 2.11
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4


Item
{
    id : item

    height : label.height

    property alias text : label.text

    property alias color : label.color

    property  bool effect : true

    clip:true

    UILabel
    {
        id: label

        anchors.verticalCenter: parent.verticalCenter

        SequentialAnimation on x
        {
            loops: Animation.Infinite

            PropertyAnimation
            {
                from: item.width
                to: -label.width
                duration : label.text.length * 1500
            }

            PauseAnimation {
                duration: 1000
            }

            running : effect
        }

    }


}
