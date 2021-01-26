#include "myudp.h"

myUDP::myUDP(QObject *parent) :
    QObject(parent)
{
    socket = new QUdpSocket(this);
    socket->bind(QHostAddress::Any,8888);
    connect(socket,SIGNAL(readyRead()),this,SLOT(processPendingDatagrams()));
}

void myUDP::send(unsigned char* myData)
{
//   qDebug() << myData[0];
    QByteArray data;
    data.append((const char*)myData);
    socket->writeDatagram(data,QHostAddress("192.168.1.7"),8888);
}

void myUDP::processPendingDatagrams()
{
    //    u_int16_t senderport;
    QHostAddress sender;
    quint16 senderport;
    while (socket->hasPendingDatagrams()){
        QByteArray buffer1;
        buffer1.resize(socket->pendingDatagramSize());
        socket->readDatagram(buffer1.data(), buffer1.size(), &sender, &senderport);
        std::vector<unsigned char> buffer(buffer1.size());
        std::copy(buffer1.begin(), buffer1.end(), buffer1.begin());
        qDebug()<<(short)buffer1[0];
    }
}
