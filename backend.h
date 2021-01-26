#ifndef BACKEND_H
#define BACKEND_H

#include<QQmlEngine>
#include<QQmlProperty>
#include <QQuickItem>
#include <QQuickView>

#include <QObject>
#include <QString>
#include <qqml.h>
#include<QThread>
#include <QMap>
#include "joystickreader.h"
#include"myudp.h"
#include <QQuickView>

using namespace std;
class BackEnd : public QObject
{
    Q_OBJECT
    QML_ELEMENT

    // axises properties
    int i=0;
    Q_PROPERTY(int axis0 READ axis0 NOTIFY frontEnd)
    Q_PROPERTY(int axis1 READ axis1 NOTIFY frontEnd)
    Q_PROPERTY(int axis2 READ axis2 NOTIFY frontEnd)
    Q_PROPERTY(int axis3 READ axis3 NOTIFY frontEnd)
    Q_PROPERTY(int axis4 READ axis4 NOTIFY frontEnd)
    Q_PROPERTY(int axis5 READ axis5 NOTIFY frontEnd)

    Q_PROPERTY(int pureAxis0 READ pureAxis0 NOTIFY frontEnd)
    Q_PROPERTY(int pureAxis1 READ pureAxis1 NOTIFY frontEnd)
    Q_PROPERTY(int pureAxis2 READ pureAxis2 NOTIFY frontEnd)
    Q_PROPERTY(int pureAxis3 READ pureAxis3 NOTIFY frontEnd)
    Q_PROPERTY(int pureAxis4 READ pureAxis4 NOTIFY frontEnd)
    Q_PROPERTY(int pureAxis5 READ pureAxis5 NOTIFY frontEnd)

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
    Q_PROPERTY(int horizontalMotor READ horizontalMotors NOTIFY frontEnd)
    Q_PROPERTY(int verticalMotor READ verticalMotors NOTIFY frontEnd)

    // motors directions properties
    Q_PROPERTY(int frontRightMotorDir READ frontRightMotorDir NOTIFY frontEnd)
    Q_PROPERTY(int frontLeftMotorDir READ frontLeftMotorDir NOTIFY frontEnd)
    Q_PROPERTY(int backRightMotorDir READ backRightMotorDir NOTIFY frontEnd)
    Q_PROPERTY(int backLeftMotorDir READ backLeftMotorDir NOTIFY frontEnd)

    //    Q_PROPERTY(int speed READ getSpeed WRITE setSpeed NOTIFY frontEnd)

public:

    typedef union{
        char bytes[2];
        short num;
    }SHORT;

    joystickreader *reader;
    explicit BackEnd(QObject *parent = nullptr);
    QThread thread;

    myUDP *socket;

    int number;  // axis or button number
    double valueIn;  // axis or button value

    // axises variables and functions
\
    int axis[6];
    int pureAxis[6];
    int axises[6];
    int axis0();
    int axis1();
    int axis2();
    int axis3();
    int axis4();
    int axis5();
    int pureAxis0();
    int pureAxis1();
    int pureAxis2();
    int pureAxis3();
    int pureAxis4();
    int pureAxis5();
    int valuePilgeDC;  // the output of mapping evaluation for pilge motors
    int valueT100;  // the output of mapping evaluation for T100 motors

    //buttons variables and functions
    bool button[12]={false};
    bool buttons[12];
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
    short directions[4];
    short motors[6];
    short horizontalMotorsVar=0;
    short verticalMotorsVar=0;
    QMap<int, int> motorDirections;
    int counter;
    int frontRightArd[2];
    int frontLeftArd[2];
    int backRightArd[2];
    int backLeftArd[2];
    int horizontalMotors();
    int verticalMotors();

    int frontRightMotorDir();
    int frontLeftMotorDir();
    int backRightMotorDir();
    int backLeftMotorDir();

public slots:
    void call(JoystickEvent);
    void getMaxSpeed(int);

signals:
    void frontEnd();
    void readjoy();

};

#endif // BACKEND_H
