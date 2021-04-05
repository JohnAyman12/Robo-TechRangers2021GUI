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
    //qDebug()<< myData[0] << " " << myData[1];
    QByteArray data;
    data.append((const char*)myData,length);
//        qDebug()<< data[0] << " ".  << data[1]y;
    socket->writeDatagram(data,QHostAddress("192.168.0.7"),8888);
    unsigned char buffer[data.size()];
    std::copy(data.begin(),data.end(),buffer);
    SHORT *A=(SHORT*)buffer;
    qDebug()<<A[0].num << " , " << buffer[2]<< " , " << buffer[3]<< " , " << buffer[4]<< " , "
                          << buffer[5]<< " , " << buffer[6] << " , " << buffer[7];
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
        std::copy(buffer1.begin(), buffer1.end(), buffer.begin());
        QString sensors = "";
        for(int i = 0; i < buffer.size(); i++){sensors+= QString::number((int)buffer[i]) + " :: ";}
//        qDebug()<< "recieved" << sensors;
        temp = (int)buffer[0];
//        qDebug()<< "temp: " << temp;
    }
}

