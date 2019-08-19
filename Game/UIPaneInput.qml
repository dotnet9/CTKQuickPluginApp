import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.0
import QtQuick.Dialogs 1.2
import QtGraphicalEffects 1.0
//import Qt.labs.controls 1.0

//  输入区

Item
{
    property bool auto : true

    Popup
    {
        id : emoji

        width : 280

        height : 160

        x : parent.width - width

        y :  - 50

        focus: true

        closePolicy: Popup.CloseOnPressOutside | Popup.CloseOnEscape

        onFocusChanged:
        {
            console.log(focus)
        }

        background : Item
        {
            Rectangle
            {
                id : back

                x : 10

                y : 10

                radius: 5

                width : parent.width - 20

                height : parent.height - 20

                color: "#A0000000"
            }
        }

        GridView
        {
             id: gridView

             clip: true

             cellWidth: 32

             cellHeight: 32

             x : 10

             y : 10

             width : parent.width - 20

             height: parent.height - 20

             anchors.margins: 5

             boundsBehavior : Flickable.StopAtBounds

             model: ListModel{
                 id : emojiList
             }

             ScrollBar.vertical: ScrollBar {
                 onActiveChanged: {
                     active = true;
                 }
                 Component.onCompleted: {
                     active = true;
//                     handle.color = "#A0FFFF60";
                 }
             }

             delegate: Item
             {
                 id: item

                 height: gridView.cellHeight

                 width: gridView.cellWidth

                 Rectangle{

                     radius: 2

                     anchors.fill: parent

                     color : item.GridView.isCurrentItem ? "#30FFFFFF" : "transparent"

                     Image {
                         id: image
                         anchors.centerIn: parent
                         source: face
                         width: 24
                         height: 24
                         anchors.verticalCenter: parent.verticalCenter
                         anchors.horizontalCenter: parent.horizontalCenter
                     }

                     MouseArea {
                         anchors.fill: parent
                         hoverEnabled: true
                         onEntered: {
                             item.GridView.view.currentIndex = model.index;
                         }
                         onClicked: {
                             input.remove(input.selectionStart, input.selectionEnd)
                             input.insert(input.cursorPosition,"#" + num)
                             emoji.close()
                         }
                     }
                 }
             }
        }

        Component.onCompleted: {
            for(var i=1;i<=30;++i)
                emojiList.append({"face" : "qrc:/skin/emoji/" + i + ".png", "num" : i})
        }
    }

    ListView
    {
        id : list

        x : 4

        y : 4

        width : 590

        height: 104

        clip: true

        boundsBehavior : Flickable.StopAtBounds

        flickableDirection: Flickable.VerticalFlick

        model: ListModel
        {
            id : contents
        }

        ScrollBar.vertical: ScrollBar {

            id : scroll

            onSizeChanged: {

                if(auto)
                {
                    position = 1 - size

                    auto = false
                }

            }

            onActiveChanged: {
                active = true;
            }

            Component.onCompleted: {
                active = true;
//                handle.color = "#A0FFFF60";
            }

        }

        delegate : Text
        {
            text : content
            textFormat : Text.RichText
            wrapMode : TextEdit.Wrap
            font.pixelSize: 12
            font.family: "SimSun"
            renderType: Text.NativeRendering
            color : "#FFF"
            width: 580
            onLinkActivated: {
                Qt.openUrlExternally(link)
            }
        }

    }

    Row
    {
        y : 110

        spacing: 5

        Rectangle
        {
            id : type

            width: 40

            height: 20

            color : "#30000000"

            Text
            {

                color: "#FFF"

                text : "聊天"

                renderType: Text.NativeRendering

                anchors.verticalCenter: parent.verticalCenter

                anchors.horizontalCenter: parent.horizontalCenter
            }
        }

        TextInput
        {
            id : input

            clip: true

            width: 525

            color : "#FFF"

                maximumLength: 100

            selectByMouse : true

            activeFocusOnTab : true

            renderType: Text.NativeRendering

            anchors.verticalCenter: parent.verticalCenter
        }

        UIImageButton
        {
            y: 1
            normalImage: "qrc:/skin/images/bq_01.png"
            hoverImage: "qrc:/skin/images/bq_02.png"
            pressImage: "qrc:/skin/images/bq_03.png"
            onClick: {
                if(!emoji.visible)
                   emoji.visible = true
            }
        }
    }

    Timer
    {
        repeat : true

        running: true

        interval : 500

        onTriggered: {

            if(contents.count >= 25)
            {
                if(scroll.size + scroll.position == 1)
                    auto = true

                contents.remove(0);
            }
        }
    }

    function send(text)
    {
        if(!input.focus)
        {           
            input.forceActiveFocus()

            return;
        }

        if(input.text.length)
        {
            var text = input.text

            for(var i=30;i>=1;--i)
                text = text.replace("#" + i, " <img src=\"qrc:/skin/emoji/" + i + ".png\" /> ")

            if(scroll.size + scroll.position == 1)
                auto = true

            contents.append({content:text})

            input.text = ""

            return;
        }

        input.focus = false
    }
}
