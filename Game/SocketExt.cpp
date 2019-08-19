//#include "SocketExt.h"
//#include <thread>

//SocketExt::SocketExt(QObject *parent)
//    : QObject(parent)
//{
//    std::thread th([&]() {

//        //  关联 object

//        req.data = this;

//		client.data = this;

//        async_write.data = this;

//        async_connect.data = this;

//        // 初始化libuv mutex

//        uv_mutex_init(&mutex);

//        // 初始化libuv loop

//        loop = uv_default_loop();

//        //	初始化TCP服务

//        uv_tcp_init(loop, &client);

//        //	绑定异步同步

//		uv_async_init(loop, &async_write, afterWrite);

//		uv_async_init(loop, &async_connect, afterConnect);

//        //	运行服务

//        uv_run(loop, UV_RUN_DEFAULT);

//        uv_loop_close(loop);

//        uv_loop_delete(loop);

//        uv_mutex_destroy(&mutex);

//        uv_close((uv_handle_t *)&client, [](uv_handle_t * t){});

//    });

//    th.detach();
//}

//void SocketExt::connect()
//{
//	uv_async_send(&async_connect);
//}

//void SocketExt::write(QString buf)
//{
//    ++id;

//    auto pack = (send_package *)malloc(sizeof(send_package));

//    auto str = buf.toUtf8().data();

//    auto len = strlen(str);

//    pack->size = len + 8;

//    pack->buf = (char *)malloc(pack->size);

//    memcpy(pack->buf, &id, 4);

//    memcpy(pack->buf + 4, &pack->size, 4);

//    memcpy(pack->buf + 8, str, len);

//    uv_mutex_lock(&mutex);
//    sendManage.push_back(pack);
//    uv_mutex_unlock(&mutex);

//    uv_async_send(&async_write);
//}

//void SocketExt::afterAlloc(uv_handle_t* handle, size_t suggested_size, uv_buf_t* buf)
//{
//    buf->base = new char[suggested_size];

//    buf->len = suggested_size;
//}

//void SocketExt::afterConnect(uv_async_t * handle)
//{
//	sockaddr_in addr;

//    uv_ip4_addr("192.168.1.4", 8080, &addr);

//    uv_tcp_connect(&((SocketExt*)handle->data)->req, &((SocketExt*)handle->data)->client , (const sockaddr*)&addr, [](uv_connect_t* req, int status)
//	{
//        if (status == 0)
//			uv_read_start(req->handle, afterAlloc, tcpRecv);

//        ((SocketExt*)req->data)->id = 0;

//        emit((SocketExt*)req->data)->connected(status == 0);
//	});
//}

//void SocketExt::afterWrite(uv_write_t* w, int status)
//{
//    auto pack = (send_package *)w->data;

//    free(pack->buf);

//    free(pack);

//    free(w);
//}

//void SocketExt::afterWrite(uv_async_t * handle)
//{
//    SocketExt * obj = (SocketExt *)handle->data;

//    uv_mutex_lock(&obj->mutex);

//    auto s = obj->sendManage.begin();

//    auto e = obj->sendManage.end();

//    while(s != e)
//    {
//        send_package * pack = * s;

//        auto write = (uv_write_t *)malloc(sizeof(uv_write_t));

//        write->data = pack;

//        auto buf = uv_buf_init(pack->buf, pack->size);

//        uv_write(write,(uv_stream_t *)&obj->client,&buf,1,afterWrite);

//        ++s;
//    }

//    obj->sendManage.clear();

//    uv_mutex_unlock(&obj->mutex);
//}

//void SocketExt::tcpRecv(uv_stream_t* handle, ssize_t nread, const uv_buf_t* buf)
//{
//    static recv_package * pack = new recv_package;

//    if (nread <= 0)
//    {
//        emit ((SocketExt *)handle->data)->closeed();
//    }
//    else
//    {
//        int pos = 0;

//        int lenght = 0;

//        while (pos < nread)
//        {
//            if (pack->read(buf->base + pos, nread - pos, lenght))
//            {
//                int size;

//                auto buf = pack->copy(size);

//                emit ((SocketExt *)handle->data)->recved(QString::fromUtf8(buf, size));

//                free(buf);

//                pack->reset();
//            }

//            pos += lenght;
//        }
//    }

//    free(buf->base);
//}
