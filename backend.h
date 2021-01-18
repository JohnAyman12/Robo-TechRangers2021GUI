#ifndef BACKEND_H
#define BACKEND_H

#include <QObject>
#include <QString>
#include <qqml.h>
#include<QThread>
#include <QMap>
#include "joystickreader.h"
#include"myudp.h"
using namespace std;
class BackEnd : public QObject
{
    Q_OBJECT
    QML_ELEMENT

    // axises properties

    Q_PROPERTY(int axis0 READ axis0 NOTIFY frontEnd)
    Q_PROPERTY(int axis1 READ axis1 NOTIFY frontEnd)
    Q_PROPERTY(int axis2 READ axis2 NOTIFY frontEnd)
    Q_PROPERTY(int axis3 READ axis3 NOTIFY frontEnd)
    Q_PROPERTY(int axis4 READ axis4 NOTIFY frontEnd)
    Q_PROPERTY(int axis5 READ axis5 NOTIFY frontEnd)

    // buttons properties

    Q_PROPERTY(bool button0 READ button0 NOTIFY frontEnd)
    Q_PROPERTY(bool button1 READ button1 NOTIFY frontEnd)
    Q_PROPERTY(bool button2 READ button2 NOTIFY frontEnd)
    Q_PROPERTY(bool button3 READ button3 NOTIFY frontEnd)
    Q_PROPERTY(bool button4 READ button4 NOTIFY frontEnd)
    Q_PROPERTY(bool button5 READ button5 NOTIFY frontEnd)
    Q_PROPERTY(bool button6 READ button6 NOTIFY frontEnd)
    Q_PROPERTY(bool button7 READ button7 NOTIFY frontEnd)
    Q_PROPERTY(bool button8 READ button8 NOTIFY frontEnd)
    Q_PROPERTY(bool button9 READ button9 NOTIFY frontEnd)
    Q_PROPERTY(bool button10 READ button10 NOTIFY frontEnd)
    Q_PROPERTY(bool button11 READ button11 NOTIFY frontEnd)

    // motors values properties
    Q_PROPERTY(int frontRightMotor READ frontRightMotor NOTIFY frontEnd)
    Q_PROPERTY(int frontLeftMotor READ frontLeftMotor NOTIFY frontEnd)
    Q_PROPERTY(int backRightMotor READ backRightMotor NOTIFY frontEnd)
    Q_PROPERTY(int backLeftMotor READ backLeftMotor NOTIFY frontEnd)
    Q_PROPERTY(int up_downFrontMotor READ up_downFrontMotor NOTIFY frontEnd)
    Q_PROPERTY(int up_downBackMotor READ up_downBackMotor NOTIFY frontEnd)

    // motors directions properties
    Q_PROPERTY(int frontRightMotorDir READ frontRightMotorDir NOTIFY frontEnd)
    Q_PROPERTY(int frontLeftMotorDir READ frontLeftMotorDir NOTIFY frontEnd)
    Q_PROPERTY(int backRightMotorDir READ backRightMotorDir NOTIFY frontEnd)
    Q_PROPERTY(int backLeftMotorDir READ backLeftMotorDir NOTIFY frontEnd)

//    Q_PROPERTY(int speed READ getSpeed WRITE setSpeed NOTIFY frontEnd)

public:
    joystickreader *reader;
    explicit BackEnd(QObject *parent = nullptr);
    QThread thread;

    myUDP *socket;

    int number;  // axis or button number
    double valueIn;  // axis or button value

    // axises variables and functions

    int axisNum[6];
    int axis0();
    int axis1();
    int axis2();
    int axis3();
    int axis4();
    int axis5();
    int valuePilgeDC;  // the output of mapping evaluation for pilge motors
    int valueT1001;  // the output of mapping evaluation for T100 motors
    int valueT1002;  // the output of mapping evaluation for T100 motors

    //buttons variables and functions

    bool button[12];
    bool button0();
    bool button1();
    bool button2();
    bool button3();
    bool button4();
    bool button5();
    bool button6();
    bool button7();
    bool button8();
    bool button9();
    bool button10();
    bool button11();

    // motors variables and functions

    int direction;
    QMap<QString, int> motorValues;
    QMap<QString, int> motorDirections;
    int frontRightDir[2];
    int frontLeftDir[2];
    int backRightDir[2];
    int backLeftDir[2];
    int frontRightMotor();
    int frontLeftMotor();
    int backRightMotor();
    int backLeftMotor();
    int up_downFrontMotor();
    int up_downBackMotor();

    int frontRightMotorDir();
    int frontLeftMotorDir();
    int backRightMotorDir();
    int backLeftMotorDir();


//    QString getSpeed();
//    void setSpeed(const QString &speed);

public slots:
    void call(JoystickEvent);

signals:
    void frontEnd();
    void readjoy();

private:
    QString m_speed;
};

#endif // BACKEND_H
