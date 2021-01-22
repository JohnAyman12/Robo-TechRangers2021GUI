import QtQuick 2.12
import QtQuick.Controls 2.15
import io.qt.examples.backend 1.0

Item {

    BackEnd {
        id: backend
    }

    property int frontRight: backend.horizontalMotor
    property int frontLeft: backend.horizontalMotor
    property int backRight: backend.horizontalMotor
    property int backLeft: backend.horizontalMotor
    property int up_downFront: backend.verticalMotor
    property int up_downBack: backend.verticalMotor
    property int frontRightDir: backend.frontRightMotorDir
    property int frontLeftDir: backend.frontLeftMotorDir
    property int backRightDir: backend.backRightMotorDir
    property int backLeftDir: backend.backLeftMotorDir
    property int firstDial_xAxis
    property int firstDial_yAxis
    property int spaceBetweenMotorsX
    property int spaceBetweenMotorsY

    function onCurrentChanges(currentValue)
    {
        if (frontRight == 255)
        {
            current += 5
        }
        else if (frontLeft == 0)
        {
            current -= 5
        }
    }

    // front-right motor

    Motor {
        id: frontRightID
        lableText: "front right"
        motorValue: frontRight
        motorDirection: frontRightDir
        x: firstDial_xAxis
        y: firstDial_yAxis + (spaceBetweenMotorsY * 0)
    }

    // front-left motor

    Motor {
        lableText: "front left"
        motorValue: frontLeft
        motorDirection: frontLeftDir
        x: firstDial_xAxis
        y: firstDial_yAxis + (spaceBetweenMotorsY * 1)
    }

    // back-right motor

    Motor {
        lableText: "back right"
        motorValue: backRight
        motorDirection: backRightDir
        x: firstDial_xAxis
        y: firstDial_yAxis + (spaceBetweenMotorsY * 2)
    }

    // back-left motor

    Motor {
        lableText: "back left"
        motorValue: backLeft
        motorDirection: backLeftDir
        x: firstDial_xAxis
        y: firstDial_yAxis + (spaceBetweenMotorsY * 3)
    }

    // up/down-front motor

    Motor {
        lableText: "up/down front"
        valueFieldWidth: 50
        directionvisibility: false
        motorValue: up_downFront
        dialMinimum: 1000
        dialMaximum: 2000
        x: firstDial_xAxis+ spaceBetweenMotorsX
        y: firstDial_yAxis + (spaceBetweenMotorsY * 0)
    }

    // up/down-back motor

    Motor {
        lableText: "up/down back"
        valueFieldWidth: 50
        directionvisibility: false
        motorValue: up_downBack
        dialMinimum: 1000
        dialMaximum: 2000
        x: firstDial_xAxis+ spaceBetweenMotorsX
        y: firstDial_yAxis + (spaceBetweenMotorsY * 1)
    }

}
