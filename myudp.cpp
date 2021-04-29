
#include "myudp.h"
#include <QtEndian>

myUDP::myUDP(QObject *parent) :
    QObject(parent)
{
    socket = new QUdpSocket(this);
    socket->bind(QHostAddress::Any,8888);
    // to get data from the UI and send it to the arduino
    connect(socket,SIGNAL(readyRead()),this,SLOT(processPendingDatagrams()));
}

void myUDP::send(unsigned char* myData,int length)
{
    QByteArray data;
    data.append((const char*)myData,length);
    socket->writeDatagram(data,QHostAddress("192.168.0.7"),8888);
    unsigned char buffer[data.size()];
    std::copy(data.begin(),data.end(),buffer);
    SHORT *V = (SHORT*)buffer;
    FLOAT *PID = (FLOAT*)buffer;
    QString sentData;
    sentData += QString::number((float)PID[0].num);
    sentData += " :: " + QString::number((float)PID[1].num);
    sentData += " :: " + QString::number((float)PID[2].num);
    sentData += " :: " + QString::number((int)V[6].num);
    sentData += " :: " + QString::number((int)V[7].num);
    for (int i = 16; i < data.size(); i++){sentData += " :: " + QString::number((int)buffer[i]);}
//    qDebug()<< "Sent:" << sentData;
}

void myUDP::processPendingDatagrams()
{
    QHostAddress sender;
    quint16 senderport;
    while (socket->hasPendingDatagrams()){
//        qDebug()<< "in";
        QByteArray buffer1;
        buffer1.resize(socket->pendingDatagramSize());
        socket->readDatagram(buffer1.data(), buffer1.size(), &sender, &senderport);
        std::vector<float> buffer(buffer1.size());
        std::copy(buffer1.begin(), buffer1.end(), buffer.begin());
        emit gotSensors(buffer);
    }
}
