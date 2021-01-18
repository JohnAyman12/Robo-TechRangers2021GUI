#include "backend.h"
#include "QDebug"
#include<QProcess>
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

//QString BackEnd::getSpeed()
//{
//    return m_speed;
//}

//void BackEnd::setSpeed(const QString &speed)
//{
//    m_speed = speed;
//    emit frontEnd();
//}

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
                frontRightDir[0] = 0; frontRightDir[1] = 1;
                motorDirections["front-left"] = -1 * direction;
                frontLeftDir[0] = 1; frontLeftDir[1] = 0;
                motorDirections["back-right"] =  -1 * direction;
                backRightDir[0] = 1; backRightDir[1] = 0;
                motorDirections["back-left"] = direction;
                backLeftDir[0] = 0; backLeftDir[1] = 1;
            }
            else if (number == 1)
            { // forward back (surge degree of freedom)
                motorValues["front-right"] = axisNum[1];
                motorValues["front-left"] = axisNum[1];
                motorValues["back-right"] = axisNum[1];
                motorValues["back-left"] = axisNum[1];
                motorDirections["front-right"] = direction;
                frontRightDir[0] = 0; frontRightDir[1] = 1;
                motorDirections["front-left"] = direction;
                frontLeftDir[0] = 0; frontLeftDir[1] = 1;
                motorDirections["back-right"] = direction;
                backRightDir[0] = 0; backRightDir[1] = 1;
                motorDirections["back-left"] = direction;
                backLeftDir[0] = 0; backLeftDir[1] = 1;
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
            { // clockwise anticlockwise (sway degree of freedom)
                motorValues["front-right"] = axisNum[4];
                motorValues["front-left"] = axisNum[4];
                motorValues["back-right"]  = axisNum[4];
                motorValues["back-left"] = axisNum[4];
                motorDirections["front-right"] = direction;
                frontRightDir[0] = 0; frontRightDir[1] = 1;
                motorDirections["front-left"] = -1 * direction;
                frontLeftDir[0] = 1; frontLeftDir[1] = 0;
                motorDirections["back-right"] = direction;
                backRightDir[0] = 0; backRightDir[1] = 1;
                motorDirections["back-left"] = -1 * direction;
                backLeftDir[0] = 1; backLeftDir[1] = 0;
            }
        }
    }
    // chossing the button textbox

    if(event.isButton())
    {
        if (valueIn == 0){
            button[number] = false;
        }
        else
        {
            button[number] = true;
        }
        //        button[number] = "button " + QString::number(number) + " is " + QString::number(valueIn);
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
    emit frontEnd();
    return axisNum[0];
}

int BackEnd::axis1()
{
    emit frontEnd();
    return axisNum[1];
}

int BackEnd::axis2()
{
    emit frontEnd();
    return axisNum[2];
}

int BackEnd::axis3()
{
    emit frontEnd();
    return axisNum[3];
}

int BackEnd::axis4()
{
    emit frontEnd();
    return axisNum[4];
}

int BackEnd::axis5()
{
    emit frontEnd();
    return axisNum[5];
}

// buttons

bool BackEnd::button0()
{
    emit frontEnd();
    return button[0];
}

bool BackEnd::button1()
{
    emit frontEnd();
    return button[1];
}

bool BackEnd::button2()
{
    emit frontEnd();
    return button[2];
}

bool BackEnd::button3()
{
    emit frontEnd();
    return button[3];
}

bool BackEnd::button4()
{
    emit frontEnd();
    return button[4];
}

bool BackEnd::button5()
{
    emit frontEnd();
    return button[5];
}

bool BackEnd::button6()
{
    emit frontEnd();
    return button[6];
}

bool BackEnd::button7()
{
    emit frontEnd();
    return button[7];
}

bool BackEnd::button8()
{
    emit frontEnd();
    return button[8];
}

bool BackEnd::button9()
{
    emit frontEnd();
    return button[9];
}

bool BackEnd::button10()
{
    emit frontEnd();
    return button[10];
}

bool BackEnd::button11()
{
    emit frontEnd();
    return button[11];
}

//motors

int BackEnd::frontRightMotor()
{
    emit frontEnd();
    return motorValues["front-right"];
}

int BackEnd::frontLeftMotor()
{
    emit frontEnd();
    return motorValues["front-left"];
}

int BackEnd::backRightMotor()
{
    emit frontEnd();
    return motorValues["back-right"];
}

int BackEnd::backLeftMotor()
{
    emit frontEnd();
    return motorValues["back-left"];
}

int BackEnd::up_downFrontMotor()
{
    emit frontEnd();
    return motorValues["up/down-front"];
}

int BackEnd::up_downBackMotor()
{
    emit frontEnd();
    return motorValues["up/down-back"];
}

int BackEnd::frontRightMotorDir(){
    emit frontEnd();
    return motorDirections["front-right"];
}

int BackEnd::frontLeftMotorDir(){
    emit frontEnd();
    return motorDirections["front-left"];
}

int BackEnd::backRightMotorDir(){
    emit frontEnd();
    return motorDirections["back-right"];
}

int BackEnd::backLeftMotorDir(){
    emit frontEnd();
    return motorDirections["back-left"];
}
