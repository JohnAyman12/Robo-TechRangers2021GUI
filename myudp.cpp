#include "myudp.h"

myUDP::myUDP(QObject *parent) :
    QObject(parent)
{
    socket = new QUdpSocket(this);
    socket->bind(QHostAddress::Any,8888);
    connect(socket,SIGNAL(readyRead()),this,SLOT(processPendingDatagrams()));
}
typedef union{
    char bytes[2];
    short num;
}SHORT;

void myUDP::send(unsigned char* myData,int length)
{
    QByteArray data;
    data.append((const char*)myData,length);
    socket->writeDatagram(data,QHostAddress("192.168.0.7"),8888);
    unsigned char buffer[data.size()];
    std::copy(data.begin(),data.end(),buffer);
    SHORT *A=(SHORT*)buffer;
    qDebug()<<A[0].num;
    QString sentData = "";
    for(int i = 2; i < data.size(); i++){sentData += QString::number((int)buffer[i]) + " :: ";}
    qDebug()<< sentData;
}

void myUDP::processPendingDatagrams()
{
    QHostAddress sender;
    quint16 senderport;
    while (socket->hasPendingDatagrams()){
        QByteArray buffer1;
        buffer1.resize(socket->pendingDatagramSize());
        socket->readDatagram(buffer1.data(), buffer1.size(), &sender, &senderport);
        std::vector<unsigned char> buffer(buffer1.size());
        std::copy(buffer1.begin(), buffer1.end(), buffer.begin());
        QString sensors = "";
        for(int i = 0; i < buffer.size(); i++){sensors+= QString::number((int)buffer[i]) + " :: ";}
        //        qDebug()<< "recieved" << sensors;
        temp = (int)buffer[0];
        //        qDebug()<< "temp: " << temp;
    }
}

