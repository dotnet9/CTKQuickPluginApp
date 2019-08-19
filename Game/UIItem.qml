import QtQuick 2.11
import QtQuick.Controls 2.4
import "Socket.js" as Socket
import "ItemIcon.js" as ItemIcon


Item {

    id : item

    z : 100

    property bool hide : false

    property string name: ""

    property var iid : null

    property var pid : null

    property bool locked : false

    property bool hover : false

    property bool enableEvent : true

    property int pos : 0

    UIItemTip
    {
        id : tip

        y : - height / 2

        headerModel: ListModel
        {

        }

        propertyModel : ListModel
        {

        }
    }

    Item
    {
        width : parent.width

        height: parent.height

        Drag.active: dragArea.drag.active && enableEvent && iid && pid

        Drag.dragType : Drag.Automatic

        Drag.supportedActions: Qt.MoveAction

        Drag.imageSource: image.source

        Drag.mimeData: {"text/plain": JSON.stringify({"pid" : pid, "iid" : iid})}

        Drag.hotSpot.x : image.width / 2

        Drag.hotSpot.y : image.height / 2

        Image
        {
            cache: true

            width : parent.width

            height: parent.height

            visible: (hover || (pid && currentItem === pid)) && !dragArea.drag.active

            source: (currentItem === pid) ?  "qrc:/skin/select.png" : "qrc:/skin/focus.png"

            anchors.verticalCenter: parent.verticalCenter

            anchors.horizontalCenter: parent.horizontalCenter
        }

        Image
        {
            id: image

            cache: true

            scale: parent.width / 40

            visible: !parent.Drag.active && !hide

            anchors.verticalCenter: parent.verticalCenter

            anchors.horizontalCenter: parent.horizontalCenter
        }

        Image
        {
            x : 26

            y : 24

            source : "qrc:/skin/000032.png"

            cache: true

            scale: parent.width / 40

            visible: image.visible && locked
        }

        MouseArea
        {
            id : dragArea

            anchors.fill: parent

            drag.target: image;

            hoverEnabled: true

            acceptedButtons: Qt.LeftButton | Qt.RightButton

            onEntered: {
                showTip(true)
                hover = true
            }

            onExited: {
                showTip(false)
                hover = false
            }

            onPressed: {

                if(!enableEvent)
                {
                    mouse.accepted = false

                    return
                }

                if(mouse.button === Qt.RightButton)
                {
                    mouse.accepted = false

                    useItem(pid)

                    return
                }

                if(currentItem === pid)
                    currentItem = null
                else
                    currentItem = pid
            }

            onReleased: {

                parent.x = 0;

                parent.y = 0;
            }

            onCanceled  :
            {
                parent.x = 0;

                parent.y = 0;
            }
        }
    }

    DropArea {

        enabled: enableEvent

        anchors.fill: parent;

        onEntered : {
            hover = true
        }

        onExited: {
            hover = false
        }

        onDropped:
        {
            if(drop.hasText)
            {
                var json = JSON.parse(drop.text)

                if(json)
                {
                    itemBoxManage[json.pid].hide = true

                    var buf = Socket.requestSwapItem(json.pid, json.iid, pid, iid, function(result)
                    {
                        itemBoxManage[json.pid].hide = false

                        if(result.code === 1)
                            swapItem(json.pid)
                    })

                    client.write(buf);
                }
            }
        }

    }  

    function isNull()
    {
        return item.iid === null
    }

    function clearItem()
    {
        item.name = ""

        item.iid = null

        item.locked = false
    }

    function setItem(name,iid, locked)
    {
        item.name = name

        item.iid = iid

        item.locked = locked

        if(iid)
            image.source = ItemIcon.getIcon(name)
        else
            image.source = ""
    }

    function swapItem(pid)
    {
        var name = item.name

        var iid = item.iid

        var locked = item.locked

        setItem(itemBoxManage[pid].name,itemBoxManage[pid].iid,itemBoxManage[pid].locked)

        itemBoxManage[pid].setItem(name, iid, locked);
    }

    function useItem()
    {
        var buf = Socket.requestUerItem(pid, iid, 0, function(result)
        {
            if(result.code === 1)
            {
                if(result.swap)
                    swapItem(result.swap);
            }
        })

        client.write(buf);
    }

    function sellItem(money, mode)
    {
        enableEvent = false;

        var buf = Socket.requestSellItem(money, mode, function(result)
        {
            if(result.code === 1)
                clearItem();

            enableEvent = true;
        })

        client.write(buf);
    }

    function lockItem()
    {
        if(pid && iid)
        {
            var buf = Socket.requestLockItem(pid, iid, locked ? 0 : 1, function(result)
            {
                if(result.code === 1)
                    locked = result.locked === 1
            })

            client.write(buf);
        }
    }

    function updateTip()
    {
        var pty = itemProperty[iid]

        if(pty)
        {           
            tip.name = pty.show

            tip.money = pty.money

            tip.headerModel.clear();

            if(pty.wparam === "装备")
            {
                var sex = "通用";

                if(pty.sex === 0)
                    sex = "男"
                else if(pty.sex === 1)
                    sex = "女"

                var carerr = "通用";

                if(pty.carerr === 0)
                    carerr = "战士"
                else if(pty.sex === 1)
                    carerr = "法师"
                else if(pty.sex === 2)
                    carerr = "道士"

                tip.image = ItemIcon.getIcon(pty.name)

                tip.headerModel.append({title : "类型 ：" + pty.lparam})

                tip.headerModel.append({title : "职业 ：" + carerr})

                tip.headerModel.append({title : "性别 ：" + sex})

                tip.headerModel.append({title : "等级 ：" + pty.level})

                tip.propertyModel.clear();

                if(pty.dcMin > 0 || pty.dcMax > 0)
                    tip.propertyModel.append({title : "物理伤害 ：" + pty.dcMin + " - " +  pty.dcMax});

                if(pty.mcMin > 0 || pty.mcMax > 0)
                    tip.propertyModel.append({title : "魔法伤害 ：" + pty.mcMin + " - " +  pty.mcMax});

                if(pty.scMin > 0 || pty.scMax > 0)
                    tip.propertyModel.append({title : "道术伤害 ：" + pty.scMin + " - " +  pty.scMax});

                if(pty.acMin > 0 || pty.acMax > 0)
                    tip.propertyModel.append({title : "物理防御 ：" + pty.acMin + " - " +  pty.acMax});

                if(pty.macMin > 0 || pty.macMax > 0)
                    tip.propertyModel.append({title : "魔法防御 ：" + pty.macMin + " - " +  pty.macMax});

                if(pty.hp > 0)
                    tip.propertyModel.append({title : "生命上限 + " + pty.hp})

                if(pty.hit > 0)
                    tip.propertyModel.append({title : "命中 + " + pty.hit});

                if(pty.dedge > 0)
                    tip.propertyModel.append({title : "躲避 + " + pty.dedge});

                if(pty.crtical > 0)
                    tip.propertyModel.append({title : "暴击 + " + pty.crtical});
            }

        }
    }

    function showTip(show)
    {
        if(show && iid)
           tip.open()
        else
           tip.close();

        if(show && iid)
        {
            updateTip();

            if (pos == 1)
                tip.x = -tip.width - 10
            else
                tip.x = width + 10

            //  检测道具是否存在更新

            var buf = Socket.requestGetItemData(pid, iid, function(result)
            {
                if(result.code === 1)
                {
                    var index = 0;

                    var t = {};

                    t.id        =   result.data[index++];
                    t.uid       =   result.data[index++];
                    t.pid       =   result.data[index++];
                    t.name      =   result.data[index++];
                    t.wparam    =   result.data[index++];
                    t.lparam    =   result.data[index++];
                    t.money     =   result.data[index++];
                    t.sex       =   result.data[index++];
                    t.carerr    =   result.data[index++];
                    t.level     =   result.data[index++];
                    t.hp        =   result.data[index++];
                    t.dcMin     =   result.data[index++];
                    t.dcMax     =   result.data[index++];
                    t.mcMin     =   result.data[index++];
                    t.mcMax     =   result.data[index++];
                    t.scMin     =   result.data[index++];
                    t.scMax     =   result.data[index++];
                    t.acMin     =   result.data[index++];
                    t.acMax     =   result.data[index++];
                    t.macMin    =   result.data[index++];
                    t.macMax    =   result.data[index++];
                    t.hit       =   result.data[index++];
                    t.dedge     =   result.data[index++];
                    t.crtical   =   result.data[index++];
                    t.locked    =   result.data[index++];

                    t.show = t.name

                    t.show = t.show.replace("男","")

                    t.show = t.show.replace("女","")

                    itemProperty[t.id] = t;

                    updateTip();
                }
            })

            client.write(buf);
        }
    }

}
