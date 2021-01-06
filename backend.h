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

    Q_PROPERTY(QString axis0 READ axis0 NOTIFY userNameChanged)
    Q_PROPERTY(QString axis1 READ axis1 NOTIFY userNameChanged)
    Q_PROPERTY(QString axis2 READ axis2 NOTIFY userNameChanged)
    Q_PROPERTY(QString axis3 READ axis3 NOTIFY userNameChanged)
    Q_PROPERTY(QString axis4 READ axis4 NOTIFY userNameChanged)
    Q_PROPERTY(QString axis5 READ axis5 NOTIFY userNameChanged)

    // buttons properties

    Q_PROPERTY(QString button0 READ button0 NOTIFY userNameChanged)
    Q_PROPERTY(QString button1 READ button1 NOTIFY userNameChanged)
    Q_PROPERTY(QString button2 READ button2 NOTIFY userNameChanged)
    Q_PROPERTY(QString button3 READ button3 NOTIFY userNameChanged)
    Q_PROPERTY(QString button4 READ button4 NOTIFY userNameChanged)
    Q_PROPERTY(QString button5 READ button5 NOTIFY userNameChanged)
    Q_PROPERTY(QString button6 READ button6 NOTIFY userNameChanged)
    Q_PROPERTY(QString button7 READ button7 NOTIFY userNameChanged)
    Q_PROPERTY(QString button8 READ button8 NOTIFY userNameChanged)
    Q_PROPERTY(QString button9 READ button9 NOTIFY userNameChanged)
    Q_PROPERTY(QString button10 READ button10 NOTIFY userNameChanged)
    Q_PROPERTY(QString button11 READ button11 NOTIFY userNameChanged)

    // motors properties
    Q_PROPERTY(QString frontRightMotor READ frontRightMotor NOTIFY userNameChanged)
    Q_PROPERTY(QString frontLeftMotor READ frontLeftMotor NOTIFY userNameChanged)
    Q_PROPERTY(QString backRightMotor READ backRightMotor NOTIFY userNameChanged)
    Q_PROPERTY(QString backLeftMotor READ backLeftMotor NOTIFY userNameChanged)
    Q_PROPERTY(QString up_downFrontMotor READ up_downFrontMotor NOTIFY userNameChanged)
    Q_PROPERTY(QString up_downBackMotor READ up_downBackMotor NOTIFY userNameChanged)


public:
    joystickreader *reader;
    explicit BackEnd(QObject *parent = nullptr);
    QThread thread;

    myUDP *socket;

    int number;  // axis or button number
    double valueIn;  // axis or button value

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

    // motors variables and functions
    QString frontRight_Motor = "front-right motor is ";
    QString frontLeft_Motor = "front-left motor is ";
    QString backRight_Motor = "back-right motor is ";
    QString backLeft_Motor = "back-left motor is ";
    QString up_downFront_Motor = "up-down-front motor is ";
    QString up_downBack_Motor = "up-down-back motor is ";
    QString frontRightMotor();
    QString frontLeftMotor();
    QString backRightMotor();
    QString backLeftMotor();
    QString up_downFrontMotor();
    QString up_downBackMotor();

public slots:
    void call(JoystickEvent);

signals:
    void userNameChanged();
    void readjoy();

private:
    QString m_userName = "jo";
};

#endif // BACKEND_H
