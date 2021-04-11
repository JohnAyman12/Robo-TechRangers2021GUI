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

bool motorArd[4] = {1};
bool button[12] = {false};
short verticalMotorsVar = 0;

// variables related to the front end
int maxSpeed = 255;
int microValue = 0;
int microDirection = 0;
int microArmValue = 0;
int microArmDirection = 0;
int rollerValue = 0;
int rollerDirection = 0;
bool flyTransactState = false;
float P_const = 0;
float I_const = 0;
float D_const = 0;

BackEnd::BackEnd(QObject *parent) :
    QObject(parent)
{
    qRegisterMetaType<JoystickEvent>("JoystickEvent");
    // pthread_t thread;
    reader=new joystickreader();
    reader->moveToThread(&thread);
    thread.start();
    socket = new myUDP();
    connect(this, SIGNAL(readjoy()), reader, SLOT(read()));
    connect(reader, SIGNAL(send(JoystickEvent)), this, SLOT(call(JoystickEvent)));
    connect(this, SIGNAL(sendData()), this, SLOT(prepareData()));
    connect(socket, SIGNAL(gotSensors(std::vector<int>)), this, SLOT(sensors(std::vector<int>)));
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
    if (!flyTransactState){
        if(event.isAxis())
        {
            valueT100 = 1100 + (((-valueIn + 32767) * 400) / 32767);
            valuePilgeDC = abs(valueIn) * maxSpeed / 32767;
            pureAxis[number] = valueIn;

            if (valueIn == 0)
            {
                for (counter = 0; counter <=3; counter++)
                {
                    horizontalMotorsVar = 0;
                    motorDirections[counter + 6] = 0;
                }
                verticalMotorsVar = 1500;
            }
            else
            {
                if (valueIn > 0){direction = -1;}
                else {direction = 1;}
                if (number == 4) // up down (heave degree of freedom)
                {
                    verticalMotorsVar = valueT100;
                }
                if(abs(pureAxis[1]) > abs(pureAxis[0]))//forward back(surge degree of freedom)
                {
                    if (direction == -1){
                        motorArd[frontRight] = motorArd[frontLeft]
                                =  motorArd[backRight] = motorArd[backLeft] = 0;}
                    else if (direction == 1){
                        motorArd[frontRight] = motorArd[frontLeft]
                                =  motorArd[backRight] = motorArd[backLeft] = 1;}
                    horizontalMotorsVar = valuePilgeDC;
                    for (counter = 0; counter <=3; counter++)
                    {
                        motorDirections[counter + 6] = direction;
                    }
                }
                else if(abs(pureAxis[0]) > abs(pureAxis[1]))//right left (sway degree of freedom)
                {
                    if (direction == -1){
                        motorArd[frontRight] = motorArd[backLeft] = 1;
                        motorArd[backRight] = motorArd[frontLeft] = 0;
                    }
                    else if (direction == 1){
                        motorArd[frontRight] = motorArd[backLeft] = 0;
                        motorArd[backRight] = motorArd[frontLeft] = 1;
                    }
                    horizontalMotorsVar = valuePilgeDC;
                    motorDirections[frontRightDir] = direction;
                    motorDirections[frontLeftDir] = -1 * direction;
                    motorDirections[backRightDir] =  -1 * direction;
                    motorDirections[backLeftDir] = direction;
                }
                else if(number == 6) // clockwise anticlockwise (sway degree of freedom)
                {
                    if (direction == -1){
                        motorArd[frontRight] = motorArd[backRight] = 1;
                        motorArd[frontLeft] = motorArd[backLeft] = 0;
                    }
                    else if (direction == 1){
                        motorArd[frontRight] = motorArd[backRight] = 0;
                        motorArd[frontLeft] = motorArd[backLeft] = 1;
                    }
                    horizontalMotorsVar = valuePilgeDC;
                    motorDirections[frontRightDir] = direction;
                    motorDirections[frontLeftDir] = -1 * direction;
                    motorDirections[backRightDir] = direction;
                    motorDirections[backLeftDir] = -1 * direction;
                }
            }
        }

        if(event.isButton())
        {
            // Pneumatic arm
            if (valueIn == 1 and number == 5)
            {
                pnu[number] = !pnu[number];
            }
            // DC arm
            if (valueIn == 1 and number == 4)
            {
                DC_armValue = 255; DC_armDirection = 0;
            }
            else if (valueIn == 1 and number == 6)
            {
                DC_armValue = 255; DC_armDirection = 1;
            }
            else if (valueIn == 0 and (number == 4 or number == 6))
            {
                DC_armValue = 0;
            }
        }
        emit frontEnd();
    }
    else
    {
        for (counter = 0; counter <=3; counter++)
        {
            motorDirections[counter + 6] = 0;
        }
        horizontalMotorsVar = 0;
        verticalMotorsVar = 1500;
    }

    if(event.isButton())
    {
        if(valueIn == 1 and (number == 0 or number == 1 or number == 2))
        {
            pnu[number] = !pnu[number];
        }
        button[number] = valueIn;
    }

    emit sendData();
}

void BackEnd::getMaxSpeed(int speed){maxSpeed = speed;}

void BackEnd::getMicro(int value, int direction)
{
    microValue = value;
    if(direction == 1){ microDirection = 1;}
    else if(direction == -1){microDirection = 0;}
    emit sendData();
}

void BackEnd::getRoller(int value, int direction)
{
    rollerValue = value;
    if(direction == 1){ rollerDirection = 1;}
    else if(direction == -1){rollerDirection = 0;}
    emit sendData();
}

void BackEnd::getMicroArm(int value, int direction)
{
    microArmValue = value;
    if(direction == 1){ microArmDirection = 1;}
    else if(direction == -1){microArmDirection = 0;}
    emit sendData();
}

void BackEnd::getFlyTransactState(bool state){flyTransactState = state; emit sendData();}

void BackEnd::get_P_facrot(float P){P_const = P; emit sendData();}

void BackEnd::get_I_facrot(float I){I_const = I; emit sendData();}

void BackEnd::get_D_facrot(float D){D_const = D; emit sendData();}

void BackEnd::sensors(std::vector<int> sensors)
{
    tempreatureValue = sensors[0];
    qDebug()<< tempreatureValue;
    emit frontEnd();
}

void BackEnd::prepareData()
{
    std::vector<unsigned char> message;
    SHORT V;
    V.num = verticalMotorsVar;
    FLOAT P;
    P.num = P_const;
    FLOAT I;
    I.num = I_const;
    FLOAT D;
    D.num = D_const;

    message.insert(message.end(), P.bytes, P.bytes + 4); // index 0:3 in QByteArray & 0 in FLOAT union (P in PID)
    message.insert(message.end(), I.bytes, I.bytes + 4); // index 4:7 in QByteArray & 1 in FLOAT union (I in PID)
    message.insert(message.end(), D.bytes, D.bytes + 4); // index 8:11 in QByteArray & 2 in FLOAT union (D in PID)
    message.insert(message.end(), V.bytes, V.bytes+2); // index 12,13 in QByteArray & 7 in SHORT union
    message.push_back((char)horizontalMotorsVar); // index 14
    message.push_back(motorArd[0]); // index 15
    message.push_back(motorArd[1]); // index 16
    message.push_back(motorArd[2]); // index 17
    message.push_back(motorArd[3]); // index 18
    message.push_back(pnu[0]); // index 19 --> front camera flash
    message.push_back(pnu[1]); // index 20 --> bottom camera flash
    message.push_back(pnu[2]); // index 21 --> micro camera flash
    message.push_back(pnu[5]); // index 22 --> pneumatic arm
    message.push_back(DC_armValue); // index 23 --> DC arm value
    message.push_back(DC_armDirection); // index 24 --> DC arm direction
    message.push_back(microValue); // index 25 --> micro motor value
    message.push_back(microDirection); // index 26 --> micro motor direction
    message.push_back(microArmValue); // index 27 --> micro arm value
    message.push_back(microArmDirection); // index 28 --> micro arm direction
    message.push_back(rollerValue); // index 29 --> roller motor value
    message.push_back(rollerDirection); // index 30 --> roller motor direction
    message.push_back(flyTransactState); // index 31 --> fly transact mood control (a.k.a pid mood)
    socket->send(message.data(),message.size());
}
// axises

int BackEnd::axis0(){return axis[0];}

int BackEnd::axis1(){return axis[1];}

int BackEnd::axis2(){return axis[2];}

int BackEnd::axis3(){return axis[3];}

int BackEnd::axis4(){return axis[4];}

int BackEnd::axis5(){return axis[5];}

int BackEnd::axis6(){return axis[6];}

int BackEnd::axis7(){return axis[7];}

int BackEnd::pureAxis0(){return pureAxis[0];}

int BackEnd::pureAxis1(){return pureAxis[1];}

int BackEnd::pureAxis2(){return pureAxis[2];}

int BackEnd::pureAxis3(){return pureAxis[3];}

int BackEnd::pureAxis4(){return pureAxis[4];}

int BackEnd::pureAxis5(){return pureAxis[5];}

int BackEnd::pureAxis6(){return pureAxis[6];}

int BackEnd::pureAxis7(){return pureAxis[7];}

// buttons

bool BackEnd::pnu0(){return pnu[0];}

bool BackEnd::pnu1(){return pnu[1];}

bool BackEnd::pnu2(){return pnu[2];}

bool BackEnd::pnu3(){return pnu[3];}

bool BackEnd::pnu4(){return pnu[4];}

bool BackEnd::pnu5(){return pnu[5];}

bool BackEnd::pnu6(){return pnu[6];}

bool BackEnd::pnu7(){return pnu[7];}

bool BackEnd::pnu8(){return pnu[8];}

bool BackEnd::pnu9(){return pnu[9];}

bool BackEnd::pnu10(){return pnu[10];}

bool BackEnd::pnu11(){return pnu[11];}

bool BackEnd::pnu12(){return pnu[12];}

bool BackEnd::button0(){return button[0];}

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

bool BackEnd::button12(){return button[12];}

//motors

int BackEnd::horizontalMotors(){ return horizontalMotorsVar;}

int BackEnd::verticalMotors(){ return verticalMotorsVar;}

int BackEnd::frontRightMotorDir(){return motorDirections[frontRightDir];}

int BackEnd::frontLeftMotorDir(){return motorDirections[frontLeftDir];}

int BackEnd::backRightMotorDir(){return motorDirections[backRightDir];}

int BackEnd::backLeftMotorDir(){return motorDirections[backLeftDir];}

// DC arm
int BackEnd::DC_arm(){return DC_armValue; qDebug()<< DC_armValue;}

bool BackEnd::DC_armDir(){return DC_armDirection; qDebug()<< DC_armDirection;}

//sensors

int BackEnd::tempreature(){return tempreatureValue;}
