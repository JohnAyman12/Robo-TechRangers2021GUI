#ifndef BACKEND_H
#define BACKEND_H

#include <QObject>
#include <QString>
#include <qqml.h>
#include<QThread>
#include "joystickreader.h"
#include"myudp.h"

class BackEnd : public QObject
{
    Q_OBJECT
    QML_ELEMENT

    // axises properties
    Q_PROPERTY(QString axis0 READ axis0 WRITE setUserName NOTIFY userNameChanged)
    Q_PROPERTY(QString axis1 READ axis1 WRITE setUserName NOTIFY userNameChanged)
    Q_PROPERTY(QString axis2 READ axis2 WRITE setUserName NOTIFY userNameChanged)
    Q_PROPERTY(QString axis3 READ axis3 WRITE setUserName NOTIFY userNameChanged)
    Q_PROPERTY(QString axis4 READ axis4 WRITE setUserName NOTIFY userNameChanged)
    Q_PROPERTY(QString axis5 READ axis5 WRITE setUserName NOTIFY userNameChanged)

    // buttons properties

    Q_PROPERTY(QString button0 READ button0 WRITE setUserName NOTIFY userNameChanged)
    Q_PROPERTY(QString button1 READ button1 WRITE setUserName NOTIFY userNameChanged)
    Q_PROPERTY(QString button2 READ button2 WRITE setUserName NOTIFY userNameChanged)
    Q_PROPERTY(QString button3 READ button3 WRITE setUserName NOTIFY userNameChanged)
    Q_PROPERTY(QString button4 READ button4 WRITE setUserName NOTIFY userNameChanged)
    Q_PROPERTY(QString button5 READ button5 WRITE setUserName NOTIFY userNameChanged)
    Q_PROPERTY(QString button6 READ button6 WRITE setUserName NOTIFY userNameChanged)
    Q_PROPERTY(QString button7 READ button7 WRITE setUserName NOTIFY userNameChanged)
    Q_PROPERTY(QString button8 READ button8 WRITE setUserName NOTIFY userNameChanged)
    Q_PROPERTY(QString button9 READ button9 WRITE setUserName NOTIFY userNameChanged)
    Q_PROPERTY(QString button10 READ button10 WRITE setUserName NOTIFY userNameChanged)
    Q_PROPERTY(QString button11 READ button11 WRITE setUserName NOTIFY userNameChanged)


public:
    joystickreader *reader;
    explicit BackEnd(QObject *parent = nullptr);
    QThread thread;

    myUDP *socket;

    int number;  // axis or button number
    int valueIn;  // axis or button value

    // axises variables and functions

    QString axis_0;
    QString axis_1;
    QString axis_2;
    QString axis_3;
    QString axis_4;
    QString axis_5;
    QString axis0();
    QString axis1();
    QString axis2();
    QString axis3();
    QString axis4();
    QString axis5();
    int joyMax = 32767;  // joystick maximum
    int joyMini = -32767;  // joystick minimum
    int ourMax = 2000;  // our targeted maximum
    int ourMini = 1000;  // our targeted minimum
    int valueOut;  // the output of mapping evaluation


    //buttons variables and functions

    QString button_0;
    QString button_1;
    QString button_2;
    QString button_3;
    QString button_4;
    QString button_5;
    QString button_6;
    QString button_7;
    QString button_8;
    QString button_9;
    QString button_10;
    QString button_11;
    QString button0();
    QString button1();
    QString button2();
    QString button3();
    QString button4();
    QString button5();
    QString button6();
    QString button7();
    QString button8();
    QString button9();
    QString button10();
    QString button11();
    void setUserName(const QString &userName);

public slots:
    void call(JoystickEvent);

signals:
    void userNameChanged();
    void readjoy();

private:
    QString m_userName = "jo";
};

#endif // BACKEND_H
