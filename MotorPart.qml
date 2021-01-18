import QtQuick 2.12
import QtQuick.Controls 2.15
import io.qt.examples.backend 1.0

Item {

    BackEnd {
        id: backend
    }

    property int frontRight: backend.frontRightMotor
    property int frontLeft: backend.frontLeftMotor
    property int backRight: backend.backRightMotor
    property int backLeft: backend.backLeftMotor
    property int up_downFront: backend.up_downFrontMotor
    property int up_downBack: backend.up_downBackMotor
    property int frontRightDir: backend.frontRightMotorDir
    property int frontLeftDir: backend.frontLeftMotorDir
    property int backRightDir: backend.backRightMotorDir
    property int backLeftDir: backend.backLeftMotorDir
    property int fields_xAxis
    property int firstField_yAxis
    property int spaceBetweenMotorsX
    property int spaceBetweenMotorsY

    // front-right motor

    Motor {
        lableText: "front right"
        motorValue: frontRight
        motorDirection: frontRightDir
        x: fields_xAxis
        y: firstField_yAxis + (spaceBetweenMotorsY * 0)
    }

    // front-left motor

    Motor {
        lableText: "front left"
        motorValue: frontLeft
        motorDirection: frontLeftDir
        x: fields_xAxis
        y: firstField_yAxis + (spaceBetweenMotorsY * 1)
    }

    // back-right motor

    Motor {
        lableText: "back right"
        motorValue: backRight
        motorDirection: backRightDir
        x: fields_xAxis
        y: firstField_yAxis + (spaceBetweenMotorsY * 2)
    }

    // back-left motor

    Motor {
        lableText: "back left"
        motorValue: backLeft
        motorDirection: backLeftDir
        x: fields_xAxis
        y: firstField_yAxis + (spaceBetweenMotorsY * 3)
    }

    // up/down-front motor

    Motor {
        lableText: "up/down front"
        valueFieldWidth: 40
        directionvisibility: false
        motorValue: up_downFront
        farFromLable1: 30
        farFromLable2: 10
        dialMinimum: 1000
        dialMaximum: 2000
        x: fields_xAxis+ spaceBetweenMotorsX
        y: firstField_yAxis + (spaceBetweenMotorsY * 0)
    }

    // up/down-back motor

    Motor {
        lableText: "up/down back"
        valueFieldWidth: 40
        directionvisibility: false
        motorValue: up_downBack
        farFromLable1: 28
        farFromLable2: 10
        dialMinimum: 1000
        dialMaximum: 2000
        x: fields_xAxis+ spaceBetweenMotorsX
        y: firstField_yAxis + (spaceBetweenMotorsY * 1)
    }

}