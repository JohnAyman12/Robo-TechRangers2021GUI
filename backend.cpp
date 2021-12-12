#include "backend.h"
#include "QDebug"
#include"unistd.h"

// defines to use them in the the arrays
#define frontRight 0
#define frontLeft 1
#define backRight 2
#define backLeft 3

#define frontRightDir 0
#define frontLeftDir 1
#define backRightDir 2
#define backLeftDir 3

// used in the logic & communicating with front end
short motorArdValues[4] = {1};
bool motorArdDirections[4] = {1};
bool button[13] = {false};
short verticalMotorsVar1 = 0;
short verticalMotorsVar2 = 0;

int pilgeMaxSpeed = 255;
int T100MaxSpeed = 400;
bool hasSpeedControl = false;
int microValue = 0;
int microDirection = 0;
int microArmValue = 0;
int microArmDirection = 0;
int rollerValue = 0;
int rollerDirection = 0;
bool flyTransactState = false;

int circuralDeadzone = 10000;
int linearDeadzone = 10000;

BackEnd::BackEnd(QObject *parent) :
    QObject(parent)
{
    qRegisterMetaType<JoystickEvent>("JoystickEvent");
    reader = new joystickreader();
    reader->moveToThread(&thread);
    thread.start();
    socket = new myUDP();

    // connects the backend & the joystickreader
    connect(this, SIGNAL(readjoy()), reader, SLOT(read()));
    // to get data from joystick
    connect(reader, SIGNAL(eventDetected(JoystickEvent)), this, SLOT(call(JoystickEvent)));
    // to prepare data to be sent arduino
    connect(this, SIGNAL(sendData()), this, SLOT(prepareData()));
    // to get data from the arduino
    connect(socket, SIGNAL(gotSensors(std::vector<float>)), this, SLOT(prepareSensors(std::vector<float>)));
    emit readjoy(); // to get in the infinity loop of the UI
}

void BackEnd::call(JoystickEvent event)
{
    number = event.number;
    valueIn = event.value;

    if(valueIn == 0 and event.isAxis())
    {
        verticalMotorsVar1 = 1500;
        verticalMotorsVar2 = 1500;
        horizontalMotorsVar = 0;
        for (counter = 0; counter <=3; counter++){
            motorDirections[counter] = 0;
            motorArdValues[counter] = 0;
            motorArdDirections[counter] = 0;
        }
    }
    if(valueIn == 0 and event.isButton())
    {
        DC_armValue = 0;
    }

    if(event.isButton()){button[number] = valueIn;}
    if(event.isAxis()){pureAxis[number] = valueIn;}
    if (event.isAxis() and abs((pureAxis[4])) > circuralDeadzone and
            abs(abs(pureAxis[4]) - abs(pureAxis[3])) > linearDeadzone and !button[12])
        // up down (heave degree of freedom)
    {
        pureAxis[4] > 0 ? direction = -1 : direction = 1;
        if(pnu[1])
        {
            verticalMotorsVar1 = (int)((-pureAxis[4] / 32767.0) * 500) + 1500;
            verticalMotorsVar2 = (int)((-pureAxis[4] / 32767.0) * 500) + 1500;
        }
        else
        {
            if(direction == 1)
            {
                verticalMotorsVar1 = (int)((-pureAxis[4] / 32767.0) * T100MaxSpeed - 75) + 1500;
                verticalMotorsVar2 = (int)((-pureAxis[4] / 32767.0) * T100MaxSpeed + 75) + 1500;
            }
            else if(direction == -1)
            {
                verticalMotorsVar1 = (int)((-pureAxis[4] / 32767.0) * T100MaxSpeed) + 1500;
                verticalMotorsVar2 = (int)((-pureAxis[4] / 32767.0) * T100MaxSpeed + 50) + 1500;
            }
        }
    }
    if (event.isAxis() and pureAxis[5] > 0)
        // up down with angel back (pitch degree of freedom)
    {
        verticalMotorsVar1 = (int)((pureAxis[5] / 32767.0) * T100MaxSpeed) + 1500;
        verticalMotorsVar2 = (int)((-pureAxis[5] / 32767.0) * T100MaxSpeed) + 1500;
    }
    if (event.isAxis() and pureAxis[2] > 0)
        // up down with angel forward (pitch degree of freedom)
    {
        verticalMotorsVar1 = (int)((-pureAxis[2] / 32767.0) * T100MaxSpeed) + 1500;
        verticalMotorsVar2 = (int)((pureAxis[2] / 32767.0) * T100MaxSpeed) + 1500;
    }
    if (event.isAxis() and abs(pureAxis[3]) > abs(pureAxis[0]) and abs(pureAxis[3]) > abs(pureAxis[1])
            and abs(pureAxis[3]) > circuralDeadzone and !button[12] and
            abs(abs(pureAxis[4]) - abs(pureAxis[3])) > linearDeadzone)
        // clockwise anticlockwise (yaw degree of freedom)
    {
        pureAxis[3] > 0 ? direction = -1 : direction = 1;
        horizontalMotorsVar = abs(pureAxis[3]) * pilgeMaxSpeed / 32767;
        motorDirections[frontRightDir] = direction; motorDirections[frontLeftDir] = -1 * direction;
        motorDirections[backRightDir] = direction; motorDirections[backLeftDir] = -1 * direction;
        if (direction == -1){ // clockwise
            motorArdDirections[frontRight] = 1; motorArdDirections[frontLeft] = 1;
            motorArdDirections[backRight] = 0; motorArdDirections[backLeft] = 0;
        }
        else if (direction == 1){ // anticlockwise
            motorArdDirections[frontRight] = 0; motorArdDirections[frontLeft] = 0;
            motorArdDirections[backRight] = 1; motorArdDirections[backLeft] = 1;
        }
    }
    if(event.isAxis() and abs(pureAxis[1]) > abs(pureAxis[0]) and abs(pureAxis[1]) > circuralDeadzone
            and abs(abs(pureAxis[1]) - abs(pureAxis[0])) > linearDeadzone and !button[11])
        //forward back(surge degree of freedom)
    {
        pureAxis[1] > 0 ? direction = -1 : direction = 1;
        horizontalMotorsVar = abs(pureAxis[1]) * pilgeMaxSpeed / 32767;
        for (counter = 0; counter <=3; counter++){motorDirections[counter] = direction;}
        if (direction == 1){ // forward
            motorArdDirections[frontRight] = 1; motorArdDirections[frontLeft] = 0;
            motorArdDirections[backRight] = 0; motorArdDirections[backLeft] = 1;
        }
        else if (direction == -1){ // back
            motorArdDirections[frontRight] = 0; motorArdDirections[frontLeft] = 1;
            motorArdDirections[backRight] = 1; motorArdDirections[backLeft] = 0;
        }
    }
    if(event.isAxis() and abs(pureAxis[0]) > abs(pureAxis[1]) and abs(pureAxis[0]) > circuralDeadzone
            and abs(abs(pureAxis[0]) - abs(pureAxis[1])) > linearDeadzone and !button[11])
        //right left (sway degree of freedom)
    {
        pureAxis[0] > 0 ? direction = -1 : direction = 1;
        horizontalMotorsVar = abs(pureAxis[0]) * pilgeMaxSpeed / 32767;
        motorDirections[frontRightDir] = direction; motorDirections[frontLeftDir] = -1 * direction;
        motorDirections[backLeftDir] = direction; motorDirections[backRightDir] =  -1 * direction;
        if (direction == 1){ // left
            motorArdDirections[frontRight] = 0; motorArdDirections[frontLeft] = 0;
            motorArdDirections[backRight] = 0; motorArdDirections[backLeft] = 0;
        }
        else if (direction == -1){ // right
            motorArdDirections[frontRight] = 1; motorArdDirections[frontLeft] = 1;
            motorArdDirections[backRight] = 1; motorArdDirections[backLeft] = 1;
        }
    }
    if (event.isButton() and valueIn == 1
            and (number == 1 or number == 2 or number == 4 or number == 5))
    {
        pnu[number] = !pnu[number];
    }
    if (event.isButton() and valueIn == 1 and number == 4)
    {
        hasSpeedControl = true;
    }
    if (event.isButton() and valueIn == 1 and number == 0)
    {
        DC_armDirection = 1; DC_armValue = 255;
    }
    if (event.isButton() and valueIn == 1 and number == 3)
    {
        DC_armDirection = 0; DC_armValue = 255;
    }
    if (event.isButton() and valueIn == 0 and (number == 3 or number == 0))
    {
        DC_armValue = 0;
    }
    if(hasSpeedControl)
    {
        if(pnu[4]){pilgeMaxSpeed = 150; T100MaxSpeed = 250;}
        else{pilgeMaxSpeed = 200; T100MaxSpeed = 400;}
    }
    emit frontEnd();
    emit sendData();
}

void BackEnd::prepareSensors(std::vector<float> buffer)
{
    std::copy(buffer.begin(), buffer.begin() + 4, yaw.bytes);
    yawValue = static_cast<double>(yaw.num);
    //    qDebug()<< yawValue;

    std::copy(buffer.begin() + 4, buffer.begin() + 8, pitch.bytes);
    pitchValue = static_cast<double>(pitch.num);
    //    qDebug()<< pitchValue;

    std::copy(buffer.begin() + 8, buffer.begin() + 12, roll.bytes);
    rollValue = static_cast<double>(roll.num);
    //    qDebug()<< rollValue;

    std::copy(buffer.begin() + 12, buffer.begin() + 16, tempreatureUnion.bytes);
    tempreatureValue = static_cast<double>(tempreatureUnion.num);
    //    qDebug()<< tempreatureValue;

    std::copy(buffer.begin() + 16, buffer.begin() + 20, humidityUnion.bytes);
    humidityValue = static_cast<double>(humidityUnion.num);
    //    qDebug()<< humidityValue;


    QString sensors = "";
    sensors += QString::number((float)yaw.num);
    sensors += " :: " + QString::number((float)pitch.num);
    sensors += " :: " + QString::number((float)roll.num);
    sensors += " :: " + QString::number((float)tempreatureUnion.num);
    sensors += " :: " + QString::number((float)humidityUnion.num);
    //    qDebug()<< "recieved" << sensors;
    emit frontEnd();
}

void BackEnd::getPilgeMaxSpeed(int speed){pilgeMaxSpeed = speed; hasSpeedControl = false;}

void BackEnd::getT100MaxSpeed(int speed){T100MaxSpeed = speed; hasSpeedControl = false;}

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

void BackEnd::prepareData()
{
    std::vector<unsigned char> message;
    SHORT V1;
    V1.num = verticalMotorsVar1;
    SHORT V2;
    V2.num = verticalMotorsVar2;

    message.push_back(horizontalMotorsVar); // index 0
    message.push_back(motorArdDirections[backRight]); // index 1
    message.push_back(motorArdDirections[frontRight]); // index 2
    message.push_back(motorArdDirections[backLeft]); // index 3
    message.push_back(motorArdDirections[frontLeft]); // index 4
    message.push_back(pnu[5]); // index 5 --> pneumatic arm
    message.insert(message.end(), V1.bytes, V1.bytes+2); // index 6,7 in QByteArray & 3 in SHORT union
    message.insert(message.end(), V2.bytes, V2.bytes+2); // index 8,9 in QByteArray & 4 in SHORT union
    message.push_back(DC_armValue); // index 10 --> DC arm value
    message.push_back(DC_armDirection); // index 11 --> DC arm direction
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

int BackEnd::verticalMotor1(){ return verticalMotorsVar1;}

int BackEnd::verticalMotor2(){ return verticalMotorsVar2;}

int BackEnd::frontRightMotorDir(){return motorDirections[frontRightDir];}

int BackEnd::frontLeftMotorDir(){return motorDirections[frontLeftDir];}

int BackEnd::backRightMotorDir(){return motorDirections[backRightDir];}

int BackEnd::backLeftMotorDir(){return motorDirections[backLeftDir];}

// DC arm
int BackEnd::DC_arm(){return DC_armValue;}

bool BackEnd::DC_armDir(){return DC_armDirection;}

//sensors

double BackEnd::tempreature(){return tempreatureValue;}

double BackEnd::humidity(){return humidityValue;}

double BackEnd::yawAxis(){return yawValue;}

double BackEnd::pitchAxis(){return pitchValue;}

double BackEnd::rollAxis(){return rollValue;}
