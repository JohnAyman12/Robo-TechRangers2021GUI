#include "backend.h"
#include "QDebug"

#define frontRight 0
#define frontLeft 1
#define backRight 2
#define backLeft 3

#define frontRightDir 0
#define frontLeftDir 1
#define backRightDir 2
#define backLeftDir 3

short motorArdValues[4] = {1};
bool motorArdDirections[4] = {1};
bool button[13] = {false};
short verticalMotorsVar1 = 0;
short verticalMotorsVar2 = 0;

// variables related to the front end
int pilgeMaxSpeed = 180;
int T100Max = 400;
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
    reader = new joystickreader();
    reader->moveToThread(&thread);
    thread.start();
    socket = new myUDP();

//    socket->moveToThread(&communication);
//    communication.start();

    // connects the backend & the joystickreader
    connect(this, SIGNAL(readjoy()), reader, SLOT(read()));
    // to get data from joystick
    connect(reader, SIGNAL(eventDetected(JoystickEvent)), this, SLOT(call(JoystickEvent)));
    // to prepare data to be sent arduino
    connect(this, SIGNAL(sendData()), this, SLOT(prepareData()));
    // to get data from the arduino
    connect(socket, SIGNAL(gotSensors(std::vector<float>)), this, SLOT(prepareSensors(std::vector<float>)));
    // to sync data with arduino using network
//    connect(this, SIGNAL(syncSignal()), socket, SLOT(syncWithArduino()));
    // to send data to arduino
//    connect(this, SIGNAL(sendToArduino(unsigned char*, int)), socket, SLOT(send(unsigned char*, int)));

//    emit syncSignal();
    emit readjoy(); // to get in the infinity loop of the UI
}

void BackEnd::call(JoystickEvent event)
{
    number = event.number;
    valueIn = event.value;

    horizontalMotorsVar = 0;
    for (counter = 0; counter <=3; counter++){
        motorDirections[counter] = 0;
        motorArdValues[counter] = 0;
        motorArdDirections[counter] = 0;
    }
    DC_armValue = 0;

    if (pureAxis[4] == 0 or pureAxis[7] == 0){verticalMotorsVar1 = verticalMotorsVar2 = 1500;}
    if (event.isButton()){button[number] = valueIn;}
    // choosing the axes textbox
    if (!flyTransactState){
        if(event.isAxis())
        {
            pureAxis[number] = valueIn;
            if (abs(pureAxis[4]) > abs(pureAxis[0]) and abs(pureAxis[4]) > abs(pureAxis[1]) and
                    abs(pureAxis[4]) > 10000 and !button[12])
                // up down (heave degree of freedom)
            {
                verticalMotorsVar1 = (int)((-pureAxis[4] / 32767.0) * T100Max) + 1500;
                verticalMotorsVar2 = (int)((pureAxis[4] / 32767.0) * T100Max) + 1500;
            }
            else if (abs(pureAxis[3]) > abs(pureAxis[0]) and abs(pureAxis[3]) > abs(pureAxis[1]) and
                     abs(pureAxis[3]) > 10000 and axisState and !button[12])
                // up down with angel (pitch degree of freedom)
            {
                verticalMotorsVar1 = (int)((pureAxis[3] / 32767.0) * T100Max) + 1500;
                verticalMotorsVar2 = (int)((pureAxis[3] / 32767.0) * T100Max) + 1500;
            }
            else if(abs(pureAxis[1]) > abs(pureAxis[0]) and abs(pureAxis[1]) > 10000
                    and abs(abs(pureAxis[1]) - abs(pureAxis[0])) > 10000 and !button[11])
                //forward back(surge degree of freedom)
            {
                pureAxis[1] > 0 ? direction = -1 : direction = 1;
                horizontalMotorsVar = abs(pureAxis[1]) * pilgeMaxSpeed / 32767;
                for (counter = 0; counter <=3; counter++){motorDirections[counter] = direction;}
                if (direction == -1){
                    motorArdDirections[frontRight] = 1; motorArdValues[frontRight] = horizontalMotorsVar;
                    motorArdDirections[frontLeft] = 1; motorArdValues[frontLeft] = 255;
                    motorArdDirections[backRight] = 0; motorArdValues[backRight] = horizontalMotorsVar;
                    motorArdDirections[backLeft] = 0; motorArdValues[backLeft] = horizontalMotorsVar;
                }
                else if (direction == 1){
                    motorArdDirections[frontRight] = 0; motorArdValues[frontRight] = horizontalMotorsVar;
                    motorArdDirections[frontLeft] = 0; motorArdValues[frontLeft] = 255;
                    motorArdDirections[backRight] = 1; motorArdValues[backRight] = horizontalMotorsVar;
                    motorArdDirections[backLeft] = 1; motorArdValues[backLeft] = horizontalMotorsVar;
                }
            }
            else if(abs(pureAxis[0]) > abs(pureAxis[1]) and abs(pureAxis[0]) > 10000
                    and abs(abs(pureAxis[0]) - abs(pureAxis[1])) > 10000 and !button[11])
                //right left (sway degree of freedom)
            {
                pureAxis[0] > 0 ? direction = -1 : direction = 1;
                horizontalMotorsVar = abs(pureAxis[0]) * pilgeMaxSpeed / 32767;
                motorDirections[frontRightDir] = direction; motorDirections[frontLeftDir] = -1 * direction;
                motorDirections[backLeftDir] = direction; motorDirections[backRightDir] =  -1 * direction;
                if (direction == -1){
                    motorArdDirections[frontRight] = 1; motorArdValues[frontRight] = horizontalMotorsVar;
                    motorArdDirections[frontLeft] = 0; motorArdValues[frontLeft] = 255;
                    motorArdDirections[backRight] = 1; motorArdValues[backRight] = horizontalMotorsVar;
                    motorArdDirections[backLeft] = 0; motorArdValues[backLeft] = horizontalMotorsVar;
                }
                else if (direction == 1){
                    motorArdDirections[frontRight] = 0; motorArdValues[frontRight] = horizontalMotorsVar;
                    motorArdDirections[frontLeft] = 1; motorArdValues[frontLeft] = 255;
                    motorArdDirections[backRight] = 0; motorArdValues[backRight] = horizontalMotorsVar;
                    motorArdDirections[backLeft] = 1; motorArdValues[backLeft] = horizontalMotorsVar;
                }
            }
            else if(abs(pureAxis[6]) > abs(pureAxis[0]) and abs(pureAxis[6]) > abs(pureAxis[1]) and
                    abs(pureAxis[6]) > 10000)
                // clockwise anticlockwise (sway degree of freedom)
            {
                pureAxis[6] > 0 ? direction = -1 : direction = 1;
                horizontalMotorsVar = abs(pureAxis[6]) * pilgeMaxSpeed / 32767;
                motorDirections[frontRightDir] = direction; motorDirections[frontLeftDir] = -1 * direction;
                motorDirections[backRightDir] = direction; motorDirections[backLeftDir] = -1 * direction;
                if (direction == -1){
                    motorArdDirections[frontRight] = 1; motorArdValues[frontRight] = horizontalMotorsVar;
                    motorArdDirections[frontLeft] = 0; motorArdValues[frontLeft] = 255;
                    motorArdDirections[backRight] = 0; motorArdValues[backRight] = horizontalMotorsVar;
                    motorArdDirections[backLeft] = 1; motorArdValues[backLeft] = horizontalMotorsVar;
                }
                else if (direction == 1){
                    motorArdDirections[frontRight] = 0; motorArdValues[frontRight] = horizontalMotorsVar;
                    motorArdDirections[frontLeft] = 1; motorArdValues[frontLeft] = 255;
                    motorArdDirections[backRight] = 1; motorArdValues[backRight] = horizontalMotorsVar;
                    motorArdDirections[backLeft] = 0; motorArdValues[backLeft] = horizontalMotorsVar;
                }
            }
            else if(abs(pureAxis[3]) > abs(pureAxis[4])and abs(abs(pureAxis[3]) - abs(pureAxis[4])) > 10000
                    and !axisState)
            {
                pureAxis[3] > 0 ? DC_armDirection = 1 : DC_armDirection = 0;
                DC_armValue = abs(pureAxis[3]) * pilgeMaxSpeed / 32767;

            }
        }

        if(event.isButton())
        {
            // Pneumatic arm this is a different change
//            if (valueIn == 1 and number == 5)
//            {
//                pnu[5] = !pnu[5];
//            }
            if (valueIn == 1 and number == 4)
            {
                axisState = !axisState;
            }
        }
        emit frontEnd();
    }
    else
    {
        verticalMotorsVar1 = 1500;
        verticalMotorsVar2 = 1500;
        horizontalMotorsVar = 0;
        for (counter = 0; counter <=3; counter++){
            motorDirections[counter] = 0;
            motorArdValues[counter] = 0;
            motorArdDirections[counter] = 0;
        }
        DC_armValue = 0;
    }

    if(event.isButton())
    {
        if(valueIn == 1 and (number == 4 or number == 1 or number == 2))
        {
            pnu[number] = !pnu[number];
        }
        button[number] = valueIn;
    }
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

void BackEnd::getPilgeMaxSpeed(int speed){pilgeMaxSpeed = speed;}

void BackEnd::getT100MaxSpeed(int speed){T100Max = speed;}

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

void BackEnd::prepareData()
{
    std::vector<unsigned char> message;
    SHORT V1;
    V1.num = verticalMotorsVar1;
    SHORT V2;
    V2.num = verticalMotorsVar2;
    FLOAT P;
    P.num = P_const;
    FLOAT I;
    I.num = I_const;
    FLOAT D;
    D.num = D_const;

    message.insert(message.end(), P.bytes, P.bytes + 4); // index 0:3 in QByteArray & 0 in FLOAT union (P in PID)
    message.insert(message.end(), I.bytes, I.bytes + 4); // index 4:7 in QByteArray & 1 in FLOAT union (I in PID)
    message.insert(message.end(), D.bytes, D.bytes + 4); // index 8:11 in QByteArray & 2 in FLOAT union (D in PID)
    message.insert(message.end(), V1.bytes, V1.bytes+2); // index 12,13 in QByteArray & 6 in SHORT union
    message.insert(message.end(), V2.bytes, V2.bytes+2); // index 14,15 in QByteArray & 7 in SHORT union
    message.push_back(motorArdValues[frontRight]); // index 16
    message.push_back(motorArdValues[frontLeft]); // index 17
    message.push_back(motorArdValues[backRight]); // index 18
    message.push_back(motorArdValues[backLeft]); // index 19
    message.push_back(motorArdDirections[frontRight]); // index 20
    message.push_back(motorArdDirections[frontLeft]); // index 21
    message.push_back(motorArdDirections[backRight]); // index 22
    message.push_back(motorArdDirections[backLeft]); // index 23
    message.push_back(pnu[2]); // index 24 --> front camera flash
    message.push_back(pnu[1]); // index 25 --> bottom camera flash
    message.push_back(pnu[5]); // index 26 --> pneumatic arm
    message.push_back(DC_armValue); // index 27 --> DC arm value
    message.push_back(DC_armDirection); // index 28 --> DC arm direction
    message.push_back(microValue); // index 29 --> micro motor value
    message.push_back(microDirection); // index 30 --> micro motor direction
    message.push_back(microArmValue); // index 31  --> micro arm value
    message.push_back(microArmDirection); // index 32 --> micro arm direction
    message.push_back(rollerValue); // index 33 --> roller motor value
    message.push_back(rollerDirection); // index 34 --> roller motor direction
    message.push_back(flyTransactState); // index 35 --> fly transact mood control (a.k.a pid mood)
    socket->send(message.data(),message.size());
//    emit sendToArduino(message.data(), message.size());
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
