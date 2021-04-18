#ifndef MYUDP_H
#define MYUDP_H

#include <QObject>
#include <QUdpSocket>
#include <QString>


class myUDP:public QObject
{
    Q_OBJECT
public:
    explicit myUDP(QObject *parent = 0);

    void send(unsigned char*,int);

    typedef union{
        char bytes[2];
        short num;
    }SHORT;

    typedef union{
        char bytes[4];
        float num;
    }FLOAT;

signals:

public slots:
    void processPendingDatagrams();

private:
    QUdpSocket *socket;

};

#endif // MYUDP_H
