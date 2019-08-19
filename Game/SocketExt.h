//#ifndef SocketExt_H
//#define SocketExt_H

//#include <QObject>
//#include <QString>
//#include <QMutex>
//#include <vector>
//#include "uv.h"
//#include "buffer.h"

////  by      CHENJUNYU
////  new  2018/06/06

//class SocketExt : public QObject
//{
//    Q_OBJECT

//public:

//    explicit SocketExt(QObject *parent = 0);

//    static void afterAlloc(uv_handle_t* handle, size_t suggested_size, uv_buf_t* buf);

//    static void afterWrite(uv_async_t * handle);

//	static void afterConnect(uv_async_t * handle);

//    static void afterWrite(uv_write_t* w, int status);

//    static void tcpRecv(uv_stream_t* handle, ssize_t nread, const uv_buf_t* buf);

//public slots:

//    void connect();

//    void write(QString buf);

//Q_SIGNALS:

//    void connected(bool status);

//    void recved(QString buffer);

//    void closeed();

// public:

//    int id;

//    uv_loop_t * loop;

//    uv_tcp_t client;

//    uv_mutex_t mutex;

//	uv_connect_t req;

//    uv_async_t async_write;

//	uv_async_t async_connect;

//    std::vector<send_package *> sendManage;

//};

//#endif // SocketExt_H
