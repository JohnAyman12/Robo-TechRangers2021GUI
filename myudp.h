#ifndef MYUDP_H
#define MYUDP_H

#include <QObject>
#include <QUdpSocket>
#include <QString>
#include <QTcpSocket>

using namespace std;


class myUDP:public QObject
{
    Q_OBJECT
public:
    explicit myUDP(QObject *parent = 0);

    typedef union{
        char bytes[2];
        short num;
    }SHORT;

    typedef union{
        char bytes[4];
        float num;
    }FLOAT;

    QByteArray data;

signals:
    void gotSensors(std::vector<float>);

public slots:
    void processPendingDatagrams();
    void send(unsigned char*,int);

private:
    QUdpSocket *socket;
    QTcpSocket *newSocket;

};

#endif // MYUDP_H
