#include "backend.h"
#include "QDebug"
#include "joystickreader.h"
#include<pthread.h>
#include<QProcess>
#include <map>

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
    number = event.number;
    valueIn = event.value;
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

    // choosing the axes textbox

    if(event.isAxis())
    {
        valuePilgeDC = abs(valueIn) * 255 / 32767;
        valueT1001 = 1000 + (((-valueIn + 32767) * 500) / 32767);
        valueT1002 = 1000 + (((valueIn + 32767) * 500) / 32767);
        axisNum[number] = valuePilgeDC;
        if (number == 2 or number == 3)
        {
            axisNum[number] = valueT1001;
        }
        if (valueIn == 0)
        {
            motorValues["front-right"] = 0;
            motorValues["front-left"] = 0;
            motorValues["back-right"] = 0;
            motorValues["back-left"] = 0;
            motorValues["up/down-front"] = 1500;
            motorValues["up/down-back"] = 1500;
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
            if (number == 0)
            {// right left (sway degree of freedom)
                motorValues["front-right"] = axisNum[0];
                motorValues["front-left"] = axisNum[0];
                motorValues["back-right"]  = axisNum[0];
                motorValues["back-left"] = axisNum[0];
                motorDirections["front-right"] = direction;
                motorDirections["back-left"] = direction;
                motorDirections["back-right"] =  -1 * direction;
                motorDirections["front-left"] = -1 * direction;
            }
            else if (number == 1)
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
            else if (number == 2)
            { // up down (heave degree of freedom)
                motorValues["up/down-front"] = axisNum[2];
                motorValues["up/down-back"] = axisNum[2];
                motorDirections["up/down-front"] = direction;
                motorDirections["up/down-back"] = direction;
            }
            else if (number == 3)
            {// up down (roll degree of freedom)
                motorValues["up/down-front"] = valueT1001;
                motorValues["up/down-back"] = valueT1002;
                motorDirections["up/down-front"] = -1 * direction;
                motorDirections["up/down-back"] = direction;
            }
            else if(number == 4)
            { // right left (sway degree of freedom)
                motorValues["front-right"] = axisNum[4];
                motorValues["front-left"] = axisNum[4];
                motorValues["back-right"]  = axisNum[4];
                motorValues["back-left"] = axisNum[4];
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
    }
    frontRightMotor();
    frontLeftMotor();
    backRightMotor();
    backLeftMotor();
    up_downFrontMotor();
    up_downBackMotor();
    socket->send(QString::number(valueIn));
}

// axises

int BackEnd::axis0()
{
    emit userNameChanged();
    return axisNum[0];
}

int BackEnd::axis1()
{
    emit userNameChanged();
    return axisNum[1];
}

int BackEnd::axis2()
{
    emit userNameChanged();
    return axisNum[2];
}

int BackEnd::axis3()
{
    emit userNameChanged();
    return axisNum[3];
}

int BackEnd::axis4()
{
    emit userNameChanged();
    return axisNum[4];
}

int BackEnd::axis5()
{
    emit userNameChanged();
    return axisNum[5];
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
