import QtQuick 2.12
import QtQuick.Controls 2.5
import io.qt.examples.backend 1.0

Page {
    width: mainWindow.width
    height: mainWindow.height

    header: Label {
        text: qsTr("Motor page")
        font.pixelSize: Qt.application.font.pixelSize * 2
        padding: 10
    }

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
    property int fields_xAxis: 370
    property int firstField_yAxis: 192
    property int spaceBetweenFields: 50

    // front-right motor

    Motor {
        lableText: "front-right motor"
        motorValue: frontRight
        motorDirection: frontRightDir
        x: fields_xAxis
        y: firstField_yAxis + (spaceBetweenFields * 0)
    }

    // front-left motor

    Motor {
        lableText: "front-left motor"
        motorValue: frontLeft
        motorDirection: frontLeftDir
        x: fields_xAxis
        y: firstField_yAxis + (spaceBetweenFields * 1)
    }

    // back-right motor

    Motor {
        lableText: "back-right motor"
        motorValue: backRight
        motorDirection: backRightDir
        x: fields_xAxis
        y: firstField_yAxis + (spaceBetweenFields * 2)
    }

    // back-left motor

    Motor {
        lableText: "back-left motor"
        motorValue: backLeft
        motorDirection: backLeftDir
        x: fields_xAxis
        y: firstField_yAxis + (spaceBetweenFields * 3)
    }

    // up/down-front motor

    Motor {
        lableText: "up/down-front motor"
        valueFieldWidth: 40
        directionvisibility: false
        motorValue: up_downFront
        farFromLable1: 30
        farFromLable2: 10
        x: fields_xAxis + 55
        y: firstField_yAxis + (spaceBetweenFields * 4)
    }

    // up/down-back motor

    Motor {
        lableText: "up/down-back motor"
        valueFieldWidth: 40
        directionvisibility: false
        motorValue: up_downBack
        farFromLable1: 28
        farFromLable2: 10
        x: fields_xAxis + 55
        y: firstField_yAxis + (spaceBetweenFields * 5)
    }
}
