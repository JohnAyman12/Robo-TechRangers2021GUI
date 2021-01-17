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

    Q_PROPERTY(int axis0 READ axis0 NOTIFY userNameChanged)
    Q_PROPERTY(int axis1 READ axis1 NOTIFY userNameChanged)
    Q_PROPERTY(int axis2 READ axis2 NOTIFY userNameChanged)
    Q_PROPERTY(int axis3 READ axis3 NOTIFY userNameChanged)
    Q_PROPERTY(int axis4 READ axis4 NOTIFY userNameChanged)
    Q_PROPERTY(int axis5 READ axis5 NOTIFY userNameChanged)

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

    // motors values properties
    Q_PROPERTY(int frontRightMotor READ frontRightMotor NOTIFY userNameChanged)
    Q_PROPERTY(int frontLeftMotor READ frontLeftMotor NOTIFY userNameChanged)
    Q_PROPERTY(int backRightMotor READ backRightMotor NOTIFY userNameChanged)
    Q_PROPERTY(int backLeftMotor READ backLeftMotor NOTIFY userNameChanged)
    Q_PROPERTY(int up_downFrontMotor READ up_downFrontMotor NOTIFY userNameChanged)
    Q_PROPERTY(int up_downBackMotor READ up_downBackMotor NOTIFY userNameChanged)

    // motors directions properties
    Q_PROPERTY(int frontRightMotorDir READ frontRightMotorDir NOTIFY userNameChanged)
    Q_PROPERTY(int frontLeftMotorDir READ frontLeftMotorDir NOTIFY userNameChanged)
    Q_PROPERTY(int backRightMotorDir READ backRightMotorDir NOTIFY userNameChanged)
    Q_PROPERTY(int backLeftMotorDir READ backLeftMotorDir NOTIFY userNameChanged)

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

    QString button[12];
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

    int direction;
    int axisPriority;
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

public slots:
    void call(JoystickEvent);

signals:
    void userNameChanged();
    void readjoy();

private:
    QString m_userName = "jo";
};

#endif // BACKEND_H
