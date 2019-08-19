import QtQuick 2.11

Image {

    asynchronous: true

    property string normalImage

    property string hoverImage

    property string pressImage

    property string disableImage

    signal click()

    MouseArea
    {
        anchors.fill: parent

        enabled: parent.enabled

        hoverEnabled: true;

        onEntered: {
            source = hoverImage
        }

        onExited : {
            source = normalImage
        }

        onPressed: {
            source = pressImage
        }

        onReleased: {
            source = normalImage
        }

        onClicked:
        {
            click()
        }

        onEnabledChanged: {
            if(enabled)
                source = normalImage
            else
                source = disableImage
        }
    }

    Component.onCompleted: {
        if(enabled)
            source = normalImage
        else
            source = disableImage
    }
}
