#ifndef BACKEND_H
#define BACKEND_H

#include <QQmlEngine>
#include <QQmlProperty>
#include <QQuickItem>
#include <QQuickView>

#include <QObject>
#include <QString>
#include <qqml.h>
#include <QThread>
#include <QMap>
#include "joystickreader.h"
#include "myudp.h"
#include <QQuickView>

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
    Q_PROPERTY(int axis6 READ axis6 NOTIFY frontEnd)
    Q_PROPERTY(int axis7 READ axis7 NOTIFY frontEnd)

    Q_PROPERTY(int pureAxis0 READ pureAxis0 NOTIFY frontEnd)
    Q_PROPERTY(int pureAxis1 READ pureAxis1 NOTIFY frontEnd)
    Q_PROPERTY(int pureAxis2 READ pureAxis2 NOTIFY frontEnd)
    Q_PROPERTY(int pureAxis3 READ pureAxis3 NOTIFY frontEnd)
    Q_PROPERTY(int pureAxis4 READ pureAxis4 NOTIFY frontEnd)
    Q_PROPERTY(int pureAxis5 READ pureAxis5 NOTIFY frontEnd)
    Q_PROPERTY(int pureAxis6 READ pureAxis6 NOTIFY frontEnd)
    Q_PROPERTY(int pureAxis7 READ pureAxis7 NOTIFY frontEnd)

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
    Q_PROPERTY(bool button12 READ button12 NOTIFY frontEnd)

    Q_PROPERTY(bool pnu0 READ pnu0 NOTIFY frontEnd)
    Q_PROPERTY(bool pnu1 READ pnu1 NOTIFY frontEnd)
    Q_PROPERTY(bool pnu2 READ pnu2 NOTIFY frontEnd)
    Q_PROPERTY(bool pnu3 READ pnu3 NOTIFY frontEnd)
    Q_PROPERTY(bool pnu4 READ pnu4 NOTIFY frontEnd)
    Q_PROPERTY(bool pnu5 READ pnu5 NOTIFY frontEnd)
    Q_PROPERTY(bool pnu6 READ pnu6 NOTIFY frontEnd)
    Q_PROPERTY(bool pnu7 READ pnu7 NOTIFY frontEnd)
    Q_PROPERTY(bool pnu8 READ pnu8 NOTIFY frontEnd)
    Q_PROPERTY(bool pnu9 READ pnu9 NOTIFY frontEnd)
    Q_PROPERTY(bool pnu10 READ pnu10 NOTIFY frontEnd)
    Q_PROPERTY(bool pnu11 READ pnu11 NOTIFY frontEnd)
    Q_PROPERTY(bool pnu12 READ pnu11 NOTIFY frontEnd)

    // motors values properties
    Q_PROPERTY(int horizontalMotor READ horizontalMotors NOTIFY frontEnd)
    Q_PROPERTY(int verticalMotor1 READ verticalMotor1 NOTIFY frontEnd)
    Q_PROPERTY(int verticalMotor2 READ verticalMotor2 NOTIFY frontEnd)

    // motors directions properties
    Q_PROPERTY(int frontRightMotorDir READ frontRightMotorDir NOTIFY frontEnd)
    Q_PROPERTY(int frontLeftMotorDir READ frontLeftMotorDir NOTIFY frontEnd)
    Q_PROPERTY(int backRightMotorDir READ backRightMotorDir NOTIFY frontEnd)
    Q_PROPERTY(int backLeftMotorDir READ backLeftMotorDir NOTIFY frontEnd)

    // DC_Arm
    Q_PROPERTY(int DC_arm READ DC_arm NOTIFY frontEnd)
    Q_PROPERTY(bool DC_armDir READ DC_armDir NOTIFY frontEnd)

    //sesnors
    Q_PROPERTY(double tempreature READ tempreature NOTIFY frontEnd)
    Q_PROPERTY(double humidity READ humidity NOTIFY frontEnd)
    Q_PROPERTY(double yaw READ yawAxis NOTIFY frontEnd)
    Q_PROPERTY(double pitch READ pitchAxis NOTIFY frontEnd)
    Q_PROPERTY(double roll READ rollAxis NOTIFY frontEnd)

public:

    typedef union{
        char bytes[2];
        short num;
    }SHORT;

    typedef union{
        char bytes[4];
        float num;
    }FLOAT;

    joystickreader *reader;
    explicit BackEnd(QObject *parent = nullptr);
    QThread thread;
    QThread communication;

    myUDP *socket;

    int number;  // axis or button number
    int valueIn;  // axis or button value
    bool usingAxis;
    bool usingButton;

    // axises variables and functions
\
    int axis[8] = {0};
    int pureAxis[8] = {0};
    int axises[8] = {0};
    int axis0();
    int axis1();
    int axis2();
    int axis3();
    int axis4();
    int axis5();
    int axis6();
    int axis7();
    int pureAxis0();
    int pureAxis1();
    int pureAxis2();
    int pureAxis3();
    int pureAxis4();
    int pureAxis5();
    int pureAxis6();
    int pureAxis7();
    int valuePilgeDC = 0;  // the output of mapping evaluation for pilge motors
    int valueT100 = 1500;  // the output of mapping evaluation for T100 motors

    //buttons variables and functions
    bool pnu[13] = {false};
    bool pnu0();
    bool pnu1();
    bool pnu2();
    bool pnu3();
    bool pnu4();
    bool pnu5();
    bool pnu6();
    bool pnu7();
    bool pnu8();
    bool pnu9();
    bool pnu10();
    bool pnu11();
    bool pnu12();
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
    bool button12();

    // motors variables and functions

    int direction;
    int counter;

    short horizontalMotorsVar = 0;
    int horizontalMotors();
    int frontRightMotor();
    int frontLeftMotor();
    int backRightMotor();
    int backLeftMotor();
    int verticalMotor1();
    int verticalMotor2();

    int motorDirections[4];
    int frontRightMotorDir();
    int frontLeftMotorDir();
    int backRightMotorDir();
    int backLeftMotorDir();
    int microMotorDir();
    int rollerMotorDir();

    short directions[4] = {0}; // motors directions values in the display formate

    int DC_armValue = 0;
    bool DC_armDirection = 0;
    int DC_arm();
    bool DC_armDir();

    FLOAT tempreatureUnion;
    double tempreatureValue = 35.6;
    double tempreature();

    FLOAT humidityUnion;
    double humidityValue = 0    ;
    double humidity();

    FLOAT yaw;
    double yawValue = 0.14;
    double yawAxis();

    FLOAT pitch;
    double pitchValue = 0.6;
    double pitchAxis();

    FLOAT roll;
    double rollValue = 1;
    double rollAxis();

public slots:
    void call(JoystickEvent);
    void getPilgeMaxSpeed(int);
    void getT100MaxSpeed(int);
    void getMicro(int, int);
    void getMicroArm(int, int);
    void getRoller(int, int);
    void getFlyTransactState(bool);
    void prepareData();
    void prepareSensors(std::vector<float>);

signals:
    void frontEnd();
    void readjoy();
    void sendData();
    void syncSignal();
    void sendToArduino(unsigned char* myData,int length);
};

#endif // BACKEND_H
