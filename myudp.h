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

signals:

public slots:
    void processPendingDatagrams();

private:
    QUdpSocket *socket;

};

#endif // MYUDP_H
