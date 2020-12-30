#include "backend.h"
#include "QDebug"
#include "/home/john/ROV/joystick-master/joystick.hh"
#include<pthread.h>
#include<QProcess>
//#include "unistd.h"
//#include<pthread.h>
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

// axis

QString BackEnd::axis0()
{
    emit userNameChanged();
    return axis_0;
}

QString BackEnd::axis1()
{
    emit userNameChanged();
    return axis_1;
}

QString BackEnd::axis2()
{
    emit userNameChanged();
    return axis_2;
}

QString BackEnd::axis3()
{
    emit userNameChanged();
    return axis_3;
}

QString BackEnd::axis4()
{
    emit userNameChanged();
    return axis_4;
}

QString BackEnd::axis5()
{
    emit userNameChanged();
    return axis_5;
}
// buttons

QString BackEnd::button0()
{
    emit userNameChanged();
    return button_0;
}

QString BackEnd::button1()
{
    emit userNameChanged();
    return button_1;
}

QString BackEnd::button2()
{
    emit userNameChanged();
    return button_2;
}

QString BackEnd::button3()
{
    emit userNameChanged();
    return button_3;
}

QString BackEnd::button4()
{
    emit userNameChanged();
    return button_4;
}

QString BackEnd::button5()
{
    emit userNameChanged();
    return button_5;
}

QString BackEnd::button6()
{
    emit userNameChanged();
    return button_6;
}

QString BackEnd::button7()
{
    emit userNameChanged();
    return button_7;
}

QString BackEnd::button8()
{
    emit userNameChanged();
    return button_8;
}

QString BackEnd::button9()
{
    emit userNameChanged();
    return button_9;
}

QString BackEnd::button10()
{
    emit userNameChanged();
    return button_10;
}

QString BackEnd::button11()
{
    emit userNameChanged();
    return button_11;
}


void BackEnd::setUserName(const QString &userName)
{
    if (userName == m_userName)
        return;

    m_userName = userName;
    qDebug() <<m_userName;
    emit userNameChanged();

}

void BackEnd::call(JoystickEvent event)
{
    number = event.number;
    valueIn = event.value;

    // choosing the axes textbox
    if(event.isAxis())
    {
        //        valueOut = (((valueIn - joyMax) / (joyMax - joyMini)) * ourMini) + ourMax;
        if(number == 0)
        {
            axis_0 = "axis 0 is " + QString::number(valueIn);
            axis0();
        }
        if(number == 1)
        {
            axis_1 = "axis 1 is " + QString::number(valueIn);
            axis1();
        }
        if(number == 2)
        {
            axis_2 = "axis 2 is " + QString::number(valueIn);
            axis2();
        }
        if(number == 3)
        {
            axis_3 = "axis 3 is " + QString::number(valueIn);
            axis3();
        }
        if(number == 4)
        {
            axis_4 = "axis 4 is " + QString::number(valueIn);
            axis4();
        }
        if(number == 5)
        {
            axis_5 = "axis 5 is " + QString::number(valueIn);
            axis5();
        }

    }

    // chossing the button textbox

    if(event.isButton())
    {
        if(number == 0)
        {
            button_0 = "button 0 is " + QString::number(valueIn);
            button0();
        }
        if(number == 1)
        {
            button_1 = "button 1 is " + QString::number(valueIn);
            button1();
        }
        if(number == 2)
        {
            button_2 = "button 2 is " + QString::number(valueIn);
            button2();
        }
        if(number == 3)
        {
            button_3 = "button 3 is " + QString::number(valueIn);
            button3();
        }
        if(number == 4)
        {
            button_4 = "button 4 is " + QString::number(valueIn);
            button4();
        }
        if(number == 5)
        {
            button_5 = "button 5 is " + QString::number(valueIn);
            button5();
        }
        if(number == 6)
        {
            button_6 = "button 6 is " + QString::number(valueIn);
            button6();
        }

        if(number == 7)
        {
            button_7 = "button 7 is " + QString::number(valueIn);
            button7();
        }

        if(number == 8)
        {
            button_8 = "button 8 is " + QString::number(valueIn);
            button8();
        }

        if(number == 9)
        {
            button_9 = "button 9 is " + QString::number(valueIn);
            button9();
        }

        if(number == 10)
        {
            button_10 = "button 10 is " + QString::number(valueIn);
            button10();
        }

        if(number == 11)
        {
            button_11 = "button 11 is " + QString::number(valueIn);
            button11();
        }
    }
    socket->send(QString::number(valueIn));
}
