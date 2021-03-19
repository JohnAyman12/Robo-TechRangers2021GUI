#include "backend.h"
#include "QDebug"

#define frontRight 0
#define frontLeft 1
#define backRight 2
#define backLeft 3

#define up_downFront 4
#define up_downBack 5

#define frontRightDir 6
#define frontLeftDir 7
#define backRightDir 8
#define backLeftDir 9

int m_speed = 255;

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

    motorDirections[frontRightDir];
    motorDirections[frontLeftDir];
    motorDirections[backRightDir];
    motorDirections[backLeftDir];

    // choosing the axes textbox

    if(event.isAxis())
    {
        valuePilgeDC = abs(valueIn) * m_speed / 32767;
        valueT100 = 1000 + (((-valueIn + 32767) * 500) / 32767);
        axis[number] = valuePilgeDC;
        pureAxis[number] = valueIn;
        if (number == 2)
        {
            axis[number] = valueT100;
        }
        if (valueIn == 0)
        {
            for (counter = 0; counter <=3; counter++)
            {
                horizontalMotorsVar = 0;
                motorDirections[counter + 6] = 0;
            }
            microMotorVar = 0;
            microMotorDirVar = 0;
            rollerMotorVar = 0;
            rollerMotorDirVar = 0;
            verticalMotorsVar = 1500;
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
            if (number == 0 or number == 1 or number == 4)
            {
                for (counter = 0; counter <=3; counter++)
                {
                    horizontalMotorsVar = axis[number];
                }
            }
            if (number == 3)
            {
                rollerMotorVar = axis[3];
            }
            if (number == 5)
            {
                microMotorVar = axis[5];
            }

            if (number == 0)
            {// right left (sway degree of freedom)
                if (direction == -1)
                {
                    motorArd[frontRight] = motorArd[backLeft] = 1;
                    motorArd[backRight] = motorArd[frontLeft] = 0;
                }
                else if (direction == 1)
                {
                    motorArd[frontRight] = motorArd[backLeft] = 0;
                    motorArd[backRight] = motorArd[frontLeft] = 1;
                }

                motorDirections[frontRightDir] = direction;
                motorDirections[frontLeftDir] = -1 * direction;
                motorDirections[backRightDir] =  -1 * direction;
                motorDirections[backLeftDir] = direction;
            }
            else if (number == 1)
            { // forward back (surge degree of freedom)
                if (direction == -1){
                    motorArd[frontRight] = motorArd[frontLeft]
                            =  motorArd[backRight] = motorArd[backLeft] = 0;}
                else if (direction == 1){
                    motorArd[frontRight] = motorArd[frontLeft]
                            =  motorArd[backRight] = motorArd[backLeft] = 1;}

                for (counter = 0; counter <=3; counter++)
                {
                    motorDirections[counter + 6] = direction;

                }
            }
            else if (number == 2)
            { // up down (heave degree of freedom)
                verticalMotorsVar = axis[2];
            }
            else if (number == 3) {
                rollerMotorDirVar = direction;
            }
            else if(number == 4)
            { // clockwise anticlockwise (sway degree of freedom)
                if (direction == -1){
                    motorArd[frontRight] = motorArd[backRight] = 1;
                    motorArd[frontLeft] = motorArd[backLeft] = 0;
                }
                else if (direction == 1)
                {
                    motorArd[frontRight] = motorArd[backRight] = 0;
                    motorArd[frontLeft] = motorArd[backLeft] = 1;
                }

                motorDirections[frontRightDir] = direction;
                motorDirections[frontLeftDir] = -1 * direction;
                motorDirections[backRightDir] = direction;
                motorDirections[backLeftDir] = -1 * direction;
            }
        }
    }

    if(event.isButton())
    {
        if(valueIn == 1 and number == 0)
        {
            pnu = !pnu;
        }
        button[number] = valueIn;
    }

    for (counter = 0; counter <=5; counter++)
    {
        if(motors[counter] != horizontalMotorsVar)
        {
            motors[counter] = horizontalMotorsVar;
            emit frontEnd();
        }
        if(axises[counter] != axis[counter])
        {
            axises[counter] = axis[counter];
            emit frontEnd();
        }
        if(directions[counter] != motorDirections[counter + 6] and counter > 4)
        {
            directions[counter] = motorDirections[counter+ 6];
            emit frontEnd();
        }
    }

    for (counter = 0; counter <=12; counter++)
    {
        if(buttons[counter] != button[counter])
        {
            buttons[counter] = button[counter];
            emit frontEnd();
        }
    }

//    qDebug()<< motorArd[frontRight] << ", " << motorArd[frontLeft] <<
//               ", " << motorArd[backRight] << ", " << motorArd[backLeft];

    std::vector<unsigned char> message;
    SHORT A ,*B;
    short x=1;

    A.num=horizontalMotorsVar;
    B=(SHORT*)motorArd;
    message.insert(message.end(), A.bytes, A.bytes + 2);
    A.num=verticalMotorsVar;
    message.insert(message.end(), B[0].bytes, B[0].bytes + 2);
    message.insert(message.end(), B[1].bytes, B[1].bytes + 2);
    message.insert(message.end(), B[2].bytes, B[2].bytes + 2);
    message.insert(message.end(), B[3].bytes, B[3].bytes + 2);
    message.insert(message.end(),A.bytes,A.bytes+2);
    A.num=x;
    message.insert(message.end(),A.bytes,A.bytes+2);
    socket->send(message.data(),message.size());
}

void BackEnd::getMaxSpeed(int speed){m_speed = speed;}

// axises

int BackEnd::axis0(){return axis[0];}

int BackEnd::axis1(){return axis[1];}

int BackEnd::axis2(){return axis[2];}

int BackEnd::axis3(){return axis[3];}

int BackEnd::axis4(){return axis[4];}

int BackEnd::axis5(){return axis[5];}

int BackEnd::pureAxis0(){return pureAxis[0];}

int BackEnd::pureAxis1(){return pureAxis[1];}

int BackEnd::pureAxis2(){return pureAxis[2];}

int BackEnd::pureAxis3(){return pureAxis[3];}

int BackEnd::pureAxis4(){return pureAxis[4];}

int BackEnd::pureAxis5(){return pureAxis[5];}

// buttons

bool BackEnd::button0(){return pnu;}

bool BackEnd::button1(){return button[1];}

bool BackEnd::button2(){return button[2];}

bool BackEnd::button3(){return button[3];}

bool BackEnd::button4(){return button[4];}

bool BackEnd::button5(){return button[5];}

bool BackEnd::button6(){return button[6];}

bool BackEnd::button7(){return button[7];}

bool BackEnd::button8(){return button[8];}

bool BackEnd::button9(){return button[9];}

bool BackEnd::button10(){return button[10];}

bool BackEnd::button11(){return button[11];}

//motors

int BackEnd::horizontalMotors(){ return horizontalMotorsVar;}

int BackEnd::verticalMotors(){ return verticalMotorsVar;}

int BackEnd::microMotor(){return microMotorVar;}

int BackEnd::rollerMotor(){return rollerMotorVar;}

int BackEnd::frontRightMotorDir(){return motorDirections[frontRightDir];}

int BackEnd::frontLeftMotorDir(){return motorDirections[frontLeftDir];}

int BackEnd::backRightMotorDir(){return motorDirections[backRightDir];}

int BackEnd::backLeftMotorDir(){return motorDirections[backLeftDir];}

int BackEnd::microMotorDir(){return microMotorDirVar;}

int BackEnd::rollerMotorDir(){return rollerMotorDirVar;}
