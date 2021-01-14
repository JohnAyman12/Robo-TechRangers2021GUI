#include "backend.h"
#include "QDebug"
#include "joystickreader.h"
#include<pthread.h>
#include<QProcess>

BackEnd::BackEnd(QObject *parent) :
    QObject(parent)
{
    qRegisterMetaType<JoystickEvent>("JoystickEvent");
    // pthread_t thread;
    reader=new joystickreader();
    reader->moveToThread(&thread);
    thread.start();
    socket = new myUDP();
    connect(this,SIGNAL(readjoy()),reader,SLOT(read()));
    connect(reader,SIGNAL(send(JoystickEvent)),this,SLOT(call(JoystickEvent)));
    emit readjoy();
}

void BackEnd::call(JoystickEvent event)
{
    motorValues["front-right"];
    motorValues["front-left"];
    motorValues["back-right"];
    motorValues["back-left"];
    motorValues["up/down-front"];
    motorValues["up/down-back"];
    motorDirections["front-right"];
    motorDirections["front-left"];
    motorDirections["back-right"];
    motorDirections["back-left"];
    motorDirections["up/down-front"];
    motorDirections["up/down-back"];
    number = event.number;
    valueIn = event.value;

    // choosing the axes textbox

    if(event.isAxis())
    {
        valueOut = abs(valueIn) * 255 / 32767;
        axisNum[number] = valueOut;
        if (valueIn == 0)
        {
            motorValues["front-right"] = 0;
            motorValues["front-left"] = 0;
            motorValues["back-right"] = 0;
            motorValues["back-left"] = 0;
            motorValues["up/down-front"] = 0;
            motorValues["up/down-back"] = 0;
            motorDirections["front-right"] = 0;
            motorDirections["front-left"] = 0;
            motorDirections["back-right"] = 0;
            motorDirections["back-left"] = 0;
            motorDirections["up/down-front"] = 0;
            motorDirections["up/down-back"]  = 0;
        }
        else
        {
            if (valueIn > 0)
            {
                direction = -1;
            }
            else
            {
                direction = 1;
            }
            if (axisNum[1] > axisNum[0])
            { // forward back (surge degree of freedom)
                motorValues["front-right"] = axisNum[1];
                motorValues["front-left"] = axisNum[1];
                motorValues["back-right"] = axisNum[1];
                motorValues["back-left"] = axisNum[1];
                motorDirections["front-right"] = direction;
                motorDirections["front-left"] = direction;
                motorDirections["back-right"] = direction;
                motorDirections["back-left"] = direction;
            }
            else if (axisNum[1] < axisNum[0])
            { // right left (sway degree of freedom)
                motorValues["front-right"] = axisNum[0];
                motorValues["front-left"] = axisNum[0];
                motorValues["back-right"]  = axisNum[0];
                motorValues["back-left"] = axisNum[0];
                motorDirections["front-right"] = direction;
                motorDirections["back-left"] = direction;
                motorDirections["back-right"] =  -1 * direction;
                motorDirections["front-left"] = -1 * direction;
            }
            else if (axisNum[2] > axisNum[3])
            { // up down (heave degree of freedom)
                motorDirections["front-right"] = 0;
                motorDirections["front-left"] = 0;
                motorDirections["back-right"] = 0;
                motorDirections["back-left"] = 0;

                motorValues["up/down-front"] = axisNum[2];
                motorValues["up/down-back"] = axisNum[2];
                motorDirections["up/down-front"] = direction;
                motorDirections["up/down-back"] = direction;
            }
            else if (axisNum[2] < axisNum[3])
            { // right left (sway degree of freedom)
                motorValues["front-right"] = axisNum[3];
                motorValues["front-left"] = axisNum[3];
                motorValues["back-right"]  = axisNum[3];
                motorValues["back-left"] = axisNum[3];
                motorDirections["front-right"] = direction;
                motorDirections["back-right"] = direction;
                motorDirections["front-left"] = -1 * direction;
                motorDirections["back-left"] =  -1 * direction;
            }
        }
    }
    // chossing the button textbox

    if(event.isButton())
    {
        button[number] = "button " + QString::number(number) + " is " + QString::number(valueIn);
        if(number == 0)
        {
            button0();
        }
        if(number == 1)
        {
            button1();
        }
        if(number == 2)
        {
            button2();
        }
        if(number == 3)
        {
            button3();
        }
        if(number == 4)
        {
            button4();
        }
        if(number == 5)
        {
            button5();
        }
        if(number == 6)
        {
            button6();
        }

        if(number == 7)
        {
            button7();
        }

        if(number == 8)
        {
            button8();
        }

        if(number == 9)
        {
            button9();
        }

        if(number == 10)
        {
            button10();
        }

        if(number == 11)
        {
            button11();
        }
    }
    frontRightMotor();
    frontLeftMotor();
    backRightMotor();
    backLeftMotor();
    up_downFrontMotor();
    up_downBackMotor();

    //    frontRightMotorDir();
    //    frontLeftMotorDir();
    //    backRightMotorDir();
    //    backLeftMotorDir();
    //    up_downFrontMotorDir();
    //    up_downBackMotorDir();
    socket->send(QString::number(valueIn));
}

// axises

QString BackEnd::axis0()
{
    emit userNameChanged();
    return QString::number(axisNum[0]);
}

QString BackEnd::axis1()
{
    emit userNameChanged();
    return QString::number(axisNum[1]);
}

QString BackEnd::axis2()
{
    emit userNameChanged();
    return QString::number(axisNum[2]);
}

QString BackEnd::axis3()
{
    emit userNameChanged();
    return QString::number(axisNum[3]);
}

QString BackEnd::axis4()
{
    emit userNameChanged();
    return QString::number(axisNum[4]);
}

QString BackEnd::axis5()
{
    emit userNameChanged();
    return QString::number(axisNum[5]);
}

// buttons

QString BackEnd::button0()
{
    emit userNameChanged();
    return button[0];
}

QString BackEnd::button1()
{
    emit userNameChanged();
    return button[1];
}

QString BackEnd::button2()
{
    emit userNameChanged();
    return button[2];
}

QString BackEnd::button3()
{
    emit userNameChanged();
    return button[3];
}

QString BackEnd::button4()
{
    emit userNameChanged();
    return button[4];
}

QString BackEnd::button5()
{
    emit userNameChanged();
    return button[5];
}

QString BackEnd::button6()
{
    emit userNameChanged();
    return button[6];
}

QString BackEnd::button7()
{
    emit userNameChanged();
    return button[7];
}

QString BackEnd::button8()
{
    emit userNameChanged();
    return button[8];
}

QString BackEnd::button9()
{
    emit userNameChanged();
    return button[9];
}

QString BackEnd::button10()
{
    emit userNameChanged();
    return button[10];
}

QString BackEnd::button11()
{
    emit userNameChanged();
    return button[11];
}

//motors

int BackEnd::frontRightMotor()
{
    emit userNameChanged();
    return motorValues["front-right"];
}

int BackEnd::frontLeftMotor()
{
    emit userNameChanged();
    return motorValues["front-left"];
}

int BackEnd::backRightMotor()
{
    emit userNameChanged();
    return motorValues["back-right"];
}

int BackEnd::backLeftMotor()
{
    emit userNameChanged();
    return motorValues["back-left"];
}

int BackEnd::up_downFrontMotor()
{
    emit userNameChanged();
    return motorValues["up/down-front"];
}

int BackEnd::up_downBackMotor()
{
    emit userNameChanged();
    return motorValues["up/down-back"];
}

int BackEnd::frontRightMotorDir(){
    emit userNameChanged();
    return motorDirections["front-right"];
}

int BackEnd::frontLeftMotorDir(){
    emit userNameChanged();
    return motorDirections["front-left"];
}

int BackEnd::backRightMotorDir(){
    emit userNameChanged();
    return motorDirections["back-right"];
}

int BackEnd::backLeftMotorDir(){
    emit userNameChanged();
    return motorDirections["back-left"];
}

int BackEnd::up_downFrontMotorDir(){
    emit userNameChanged();
    return motorDirections["up/down-front"];
}

int BackEnd::up_downBackMotorDir(){
    emit userNameChanged();
    return motorDirections["up/down-back"];
}
