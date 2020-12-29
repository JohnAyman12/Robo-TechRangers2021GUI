#include "myudp.h"

myUDP::myUDP(QObject *parent) :
    QObject(parent)
{
    socket = new QUdpSocket(this);
    socket->bind(4321);
    connect(socket,SIGNAL(readyRead()),this,SLOT(readyRead()));
}

void myUDP::send(QString myData)
{
    qDebug() << myData;
    QByteArray data;
    data.append(myData);
    socket->writeDatagram(data,QHostAddress("192.168.1.7"),4321);
}

void myUDP::readyRead()
{
    QByteArray buffer;
    buffer.resize(socket->pendingDatagramSize());
    QHostAddress sender;
    quint16 senderport;
    socket->readDatagram(buffer.data(), buffer.size(), &sender, &senderport);
    qDebug() << "message from: " << sender.toString();
    qDebug() << "message port: " << senderport;
    qDebug() << "message: " << buffer;
}
