// -------------------------------------------------------
// 回调事件
// -------------------------------------------------------

function callback(json)
{
    if(callbackManage[json.callback])
    {
        callbackManage[json.callback](json)

        callbackManage[json.callback] = null

        return true;
    }

    return false;
}

// -------------------------------------------------------
// 同步事件回调
// -------------------------------------------------------

function syncEvent(evt, json)
{
    var t = syncEventManage[evt];

    if(t)
    {
        for(var i=0;i<t.length;++i)
            t[i](json);
    }
}

// -------------------------------------------------------
// 注册同步事件回调
// -------------------------------------------------------

function registerEvent(evt, cb)
{
    var t = syncEventManage[evt];

    if(!t)
    {
        t = []

        syncEventManage[evt] = t;
    }

    t.push(cb);
}

// -------------------------------------------------------
// 登陆
// -------------------------------------------------------

function requestLogin(username, password , cb)
{
    callbackManage.push(cb)

    return JSON.stringify(
        {
            "method" : "login",
            "username" : username,
            "password" : password,
            "callback" : callbackManage.length - 1
        }
    );
}

// -------------------------------------------------------
// 注册
// -------------------------------------------------------

function requestRegister(username, password , phone , gamename, cb)
{
    callbackManage.push(cb)

    return JSON.stringify(
        {
            "method" : "register",
            "username" : username,
            "password" : password,
            "phone" : phone,
            "gamename" : gamename,
            "callback" : callbackManage.length - 1
        }
    );
}

// -------------------------------------------------------
// 加载数据
// -------------------------------------------------------

function requestLoader()
{
    return JSON.stringify(
        {
            "method" : "loader"
        }
    );
}

// -------------------------------------------------------
// 交换道具
// -------------------------------------------------------

function requestSwapItem(pid1, iid1, pid2, iid2, cb)
{
    callbackManage.push(cb)

    return JSON.stringify(
        {
            "method" : "swap_item",
            "pid1" : pid1,
            "iid1" : iid1,
            "pid2" : pid2,
            "iid2" : iid2,
            "callback" : callbackManage.length - 1
        }
    );
}

// -------------------------------------------------------
// 使用道具
// -------------------------------------------------------

function requestUerItem(pid, iid, carerr, cb)
{
    callbackManage.push(cb)

    return JSON.stringify(
        {
            "method" : "use_item",
            "pid" : pid,
            "iid" : iid,
            "carerr" : carerr,
            "callback" : callbackManage.length - 1
        }
    );
}

// -------------------------------------------------------
// 锁定/解锁道具
// -------------------------------------------------------

function requestLockItem(pid, iid, locked, cb)
{
    callbackManage.push(cb)

    return JSON.stringify(
        {
            "method" : "lock_item",
            "pid" : pid,
            "iid" : iid,
            "locked" : locked,
            "callback" : callbackManage.length - 1
        }
    );
}

// -------------------------------------------------------
// 获取道具数据
// -------------------------------------------------------

function requestGetItemData(pid, iid, cb)
{
    callbackManage.push(cb)

    return JSON.stringify(
        {
            "method" : "get_item_data",
            "pid" : pid,
            "iid" : iid,
            "callback" : callbackManage.length - 1
        }
    );
}

// -------------------------------------------------------
// 寄售道具
// -------------------------------------------------------

function requestSellItem(money, mode, cb)
{
    callbackManage.push(cb)

    return JSON.stringify(
        {
            "method" : "sell_item",
            "money" : money,
            "mode" : mode,
            "callback" : callbackManage.length - 1
        }
    );
}
