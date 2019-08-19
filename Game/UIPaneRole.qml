import QtQuick 2.11

Image {

    source: "qrc:/skin/pane1.png"

    asynchronous: true

    anchors.fill : parent

    property var rw : [
        ["男",-51,0],
        ["女",-51,0],
        ["布衣男",-51,0],
        ["布衣女",-51,0],
        ["轻盔甲男",-51,0],
        ["轻盔甲女",-51,0],
        ["重盔甲男",-51,0],
        ["重盔甲女",-51,0],
        ["魔法长袍男",-51,0],
        ["魔法长袍女",-51,0],
        ["灵魂战衣男",-51,0],
        ["灵魂战衣女",-51,0],
        ["战神盔甲男",-51,0],
        ["战神盔甲女",-51,0],
        ["恶魔长袍男",-51,0],
        ["恶魔长袍女",-51,0],
        ["幽灵战衣男",-51,0],
        ["幽灵战衣女",-51,0],
        ["龙骨甲男",-51,0],
        ["龙骨甲女",-51,0],
        ["天魔神甲",-51,0],
        ["圣战宝甲",-51,0],
        ["法神披风",-51,0],
        ["霓裳羽衣",-51,0],
        ["天尊道袍",-51,0],
        ["天师长袍",-51,0],
        ["雷霆战甲男",-51,0],
        ["雷霆战甲女",-51,0],
        ["烈焰魔衣男",-51,0],
        ["烈焰魔衣女",-51,0],
        ["光芒道袍男",-51,0],
        ["光芒道袍女",-51,0],
        ["王者战甲男",-51,0],
        ["王者战甲女",-51,0],
        ["王者魔衣男",-51,0],
        ["王者魔衣女",-51,0],
        ["王者道袍男",-51,0],
        ["王者道袍女",-51,0]
    ]

    property var wq : [
        ["木棒",-92,-3],
        ["木剑",-80,-5],
        ["青铜剑",-100,-38],
        ["乌木剑",-84,-33],
        ["铁剑",-104,-42],
        ["短剑",-85,9],
        ["鹤嘴锄",-102,-8],
        ["青铜斧",-87,16],
        ["八荒",-102,-56],
        ["海魂",-78,-18],
        ["半月",-80,-34],
        ["凌风",-93,-45],
        ["破魂",-75,1],
        ["斩马刀",-86,-31],
        ["偃月",-93,-21],
        ["降魔",-91,-45],
        ["修罗",-104,-27],
        ["井中月",-96,-37],
        ["凝霜",-98,-53],
        ["炼狱",-109,-24],
        ["魔杖",-99,-32],
        ["银蛇",-84,-23],
        ["祈祷之刃",-87,-59],
        ["命运之刃",-96,-49],
        ["裁决之杖",-95,-36],
        ["骨玉权杖",-98,-31],
        ["无极棍",-77,-27],
        ["怒斩",-72,-19],
        ["龙牙",-94,-56],
        ["龙纹剑",-84,-65],
        ["屠龙",-107,-62],
        ["嗜魂法杖",-93,-33],
        ["龙骨刀",-119,-92],
        ["逍遥扇",-93,21],
        ["赤血魔剑",-96,-46],
        ["霸者之刃",-114,-57],
        ["开天",-118,-55],
        ["镇天",-110,-51],
        ["玄天",-99,-51],
        ["王者之杖",-104,-85],
        ["王者之剑",-95,-56],
        ["王者之刃",-109,-88]
    ]

    Text
    {
        y : 16
        text : gamename
        color: "#FFF"
        style: Text.Raised
        styleColor: "#000"
        renderType: Text.NativeRendering
        anchors.horizontalCenter: parent.horizontalCenter
    }

    UILabelPage
    {
        y : 32

        spacing: 12

        label : ["无名小卒","魔战士","法师之神"]

        anchors.horizontalCenter: parent.horizontalCenter
    }

    UILabelPage
    {
        id : page_object

        y : 305

        spacing: 12

        label : ["职业：战士","职业：法师","职业：道士"]

        anchors.horizontalCenter: parent.horizontalCenter

        onIndexChanged: {
            updateProperty()
        }
    }

    Repeater
    {
        model : 3

        Item
        {
            visible: page_object.index == index

            property int startID : index * 100

            Image
            {
                id : imgWuQi
            }

            Image
            {
                id : imgRenWu
            }

            Repeater
            {
                model : 2

                UIItem
                {
                    x : 105 + 49 * index
                    y : 334
                    width : 40
                    height : 40
                    enableEvent: true

                    Component.onCompleted: {
                        pid = ++startID
                        itemBoxManage[pid] = this;
                    }

                    UIToolTip
                    {
                        visible: parent.hover

                        Component.onCompleted: {
                            if(index == 0)
                                text = "腰带"
                            else
                                text = "鞋子"
                        }
                    }
                }
            }

            Repeater
            {
                model : 5

                UIItem
                {
                    x : 250
                    y: index * 49 + 88
                    width : 40
                    height : 40
                    enableEvent: true
                    onNameChanged: {
                        if(index === 2)
                            updateRenWu_Name(imgRenWu,name)
                    }
                    Component.onCompleted: {
                        pid = ++startID
                        itemBoxManage[pid] = this;
                    }
                    UIToolTip
                    {
                        visible: parent.hover

                        Component.onCompleted: {
                            if(index == 0)
                                text = "项链"
                            else if(index == 1)
                                text = "护符"
                            else if(index == 2)
                                text = "衣服"
                            else if(index == 3)
                                text = "手镯"
                            else if(index == 4)
                                text = "戒指"
                         }
                    }
                }
            }

            Repeater
            {
                model : 4

                UIItem
                {
                    x : 7
                    y: index * 49 + 137
                    width : 40
                    height : 40
                    enableEvent: true
                    onNameChanged: {
                        if(index === 1)
                            updateWuQi_Name(imgWuQi,name)
                    }
                    Component.onCompleted: {
                        pid = ++startID
                        itemBoxManage[pid] = this;
                    }
                    UIToolTip
                    {
                        visible: parent.hover

                        Component.onCompleted: {
                            if(index == 0)
                                text = "头盔"
                            else if(index == 1)
                                text = "武器"
                            else if(index == 2)
                                text = "手镯"
                            else if(index == 3)
                                text = "戒指"
                        }
                    }
                }
            }

            Component.onCompleted:
            {
                updateRenWu_Index(imgRenWu, 0)
            }
        }
    }

    UIProperty
    {
        id : view_property;

        y : 400

        anchors.horizontalCenter: parent.horizontalCenter
    }

    function updateRenWu_Index(ctrl,index)
    {
        ctrl.source = "qrc:/skin/rwng/" + index + ".png"
        ctrl.x = 148 + 5 + rw[index][1]
        ctrl.y = 105 + rw[index][2]
    }

    function updateWuQi_Index(ctrl,index)
    {
        ctrl.source = "qrc:/skin/wqng/" + index + ".png"
        ctrl.x = 148 + 5 + wq[index][1]
        ctrl.y = 105 + wq[index][2]
    }

    function updateRenWu_Name(ctrl,name)
    {
        if(name.length === 0)
        {
            updateRenWu_Index(ctrl,0)

            return;
        }

        for(var i=0;i<rw.length;++i)
        {
            if(rw[i][0] === name)
            {
                updateRenWu_Index(ctrl,i)

                return;
            }
        }
    }

    function updateWuQi_Name(ctrl,name)
    {
        if(name.length == 0)
        {
            ctrl.visible = false;

            return;
        }

        for(var i=0;i<rw.length;++i)
        {
            if(wq[i][0] === name)
            {
                ctrl.visible = true;

                updateWuQi_Index(ctrl,i)

                return;
            }
        }
    }

    function updateProperty()
    {
        var pty = objectProperty[page_object.index];

        view_property.dcMin = pty.dcMin
        view_property.dcMax = pty.dcMax
        view_property.mcMin = pty.mcMin
        view_property.mcMax = pty.mcMax
        view_property.scMin = pty.scMin
        view_property.scMax = pty.scMax
        view_property.acMin = pty.acMin
        view_property.acMax = pty.acMax
        view_property.macMin = pty.macMin
        view_property.macMax = pty.macMax
        view_property.hit = pty.hit
        view_property.dedge = pty.dedge
        view_property.crtical = pty.crtical
    }

}
