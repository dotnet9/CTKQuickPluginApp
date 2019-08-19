import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import QtGraphicalEffects 1.0
import "scene/"
import "scene2/"
import "scene3/"

Window {
    visible: true
    width: 320
    height: 320
    color: "#555666"
    title: qsTr("Hello World")
//    flags: Qt.FramelessWindowHint

    //  下滑页面数据

    ListModel
    {
        id: listmodel1

        ListElement
        {
            left_default: "qrc:/skin/btn_light_down.png"
            left_hover: "qrc:/skin/btn_light_down_press.png"
            right_default: "qrc:/skin/ic_light_up.png"
            right_hover: "qrc:/skin/ic_light_up_press.png"
            progress : 80
        }

        ListElement
        {
            left_default: "qrc:/skin/btn_volume_down.png"
            left_hover: "qrc:/skin/btn_volume_down_press.png"
            right_default: "qrc:/skin/btn_volume_up.png"
            right_hover: "qrc:/skin/btn_volume_up_press.png"
            progress : 50
        }
    }

    //  wifi列表

    ListModel
    {
        id: listmodel2

        ListElement
        {
            name: "这是一段文字"

            lock: true

            status: 1   //  信号强度
        }

        ListElement
        {
            name: "这是一段文字"

            lock: false

            status: 2
        }

        ListElement
        {
            name: "这是一段文字"

            lock: true

            status: 3
        }

        ListElement
        {
            name: "这是一段文字"

            lock: true

            status: 2
        }

        ListElement
        {
            name: "这是一段文字"

            lock: true

            status: 1
        }

        ListElement
        {
            name: "这是一段文字"

            lock: true

            status: 1
        }

        ListElement
        {
            name: "这是一段文字"

            lock: true

            status: 2
        }

        ListElement
        {
            name: "这是一段文字"

            lock: true

            status: 1
        }
    }

    // 全局变量

    QtObject
    {
        id: global
        property bool wifi: true       //  允许wifi
        property bool bluetooth: true   //  允许蓝牙
        property bool sound: true       //  允许声音
        property int sessionMode: 0   //  回话模式
        property int power : 60     //  电量
        property string username: "word fuck"
        property bool isvip: true
    }

    Drawer
    {
        edge: Qt.TopEdge

        width: parent.width

        height: parent.height

        modal: true;

        background: View1
        {
            anchors.fill: parent
        }
    }

    Item
    {
        id: stack

        width: parent.width

        height: parent.height

        property int currentIndex : 0

        //  初始化
        SwipeView
        {
            id: scene0

            anchors.fill: parent

            visible: stack.currentIndex == 0

            //
            View8
            {

            }

            View10
            {

            }
        }

        //  开始联网
        Item
        {
            property int currentIndex : 0

            id: scene1

            visible: stack.currentIndex == 1

            anchors.fill: parent

            View14
            {
                anchors.fill: parent

                visible: scene1.currentIndex == 0
            }

            View7
            {
                id: input_wifi_password

                title: "请输入内容"

                passwordMode: true

                maxLength: 16

                anchors.fill: parent

                visible: scene1.currentIndex == 1

            }
        }

        //  登录
        Item
        {
            property int currentIndex : 0;

            id: scene2

            anchors.fill: parent

            visible: stack.currentIndex == 2

            View9
            {
                anchors.fill: parent

                visible: scene2.currentIndex == 0
            }

            View15
            {
                anchors.fill: parent

                title: "请输入内容"

                maxLength: 11

                visible: scene2.currentIndex == 1
            }

            View15
            {
                id: view_code

                anchors.fill: parent

                title: "请输入内容"

                maxLength: 4

                visible: scene2.currentIndex == 2
            }

            View12
            {
                anchors.fill: parent

                visible: scene2.currentIndex == 3
            }
        }

        //  首页

        Item
        {
            id: scene3

            anchors.fill: parent

            visible: stack.currentIndex == 3

            TopTool
            {
                width: parent.width

                height: 40

                z: 10000
            }

            SwipeView
            {
                id: swipe2

                anchors.fill: parent

                currentIndex: 1

                Text
                {
                    text: "fuck"

                    font.pointSize: 24

                    color: "#fff"

                    verticalAlignment: Text.AlignVCenter

                    horizontalAlignment: Text.AlignHCenter
                }

                View2
                {

                }

                View6
                {

                }
            }

            PageIndicator {
                id: pageidt
                count: swipe2.count
                currentIndex: swipe2.currentIndex
                anchors.bottom: parent.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                delegate: Rectangle {
                      implicitWidth: 8
                      implicitHeight: 8
                      radius: width/2
                      color: "white"
                      visible: pageidt.currentIndex != 2
                }
            }
        }

    }

    View11
    {
        id: view_code_goto
    }

    View13
    {
        id: connect_box
    }
}
