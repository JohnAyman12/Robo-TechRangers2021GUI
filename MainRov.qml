import QtQuick 2.12
import QtQuick.Controls 2.15

Item {
    property int frontRightDir: backend.frontRightMotorDir
    property int frontLeftDir: backend.frontLeftMotorDir
    property int backRightDir: backend.backRightMotorDir
    property int backLeftDir: backend.backLeftMotorDir

    property int mainROV_x
    property int mainROV_y
    property color textColor: "white"

    // Main ROV

    Rectangle {
        id:rovBorder
        x: mainROV_x
        y: mainROV_y
        width: 300
        height: 420
        color: "transparent"
        border.color: "deeppink"
        border.width: 2
        radius: 10
    }

    Label {
        id: mainLbl
        text: "ROV Propulsion Motors"
        font.bold : true
        font.pixelSize: 20
        color: "white"
        x:mainROV_x + 41
        y:mainROV_y - 26
    }

    Image {
        id: mainImg
        x: mainLbl.x - 45
        y: mainLbl.y - 22
        source: "images/propulsion.png"
        width: 55
        height: mainImg.width + 2
    }

    Motor { // front right motor
        name: "Front Right Pilge"
        value: backend.horizontalMotor * backend.frontRightMotorDir
        motorMinimum: -255
        xAll: rovBorder.x + 174
        yAll: rovBorder.y + 32
    }

    Motor { // front left motor
        name: "Front Left Pilge"
        value: backend.horizontalMotor * backend.frontLeftMotorDir
        motorMinimum: -255
        xAll: rovBorder.x + 30
        yAll: rovBorder.y + 32
    }

    Motor { // back right motor
        name: "Back Right Pilge"
        value: backend.horizontalMotor * backend.backRightMotorDir
        motorMinimum: -255
        xAll: rovBorder.x + 174
        yAll: rovBorder.y + 170
    }

    Motor {  // back left motor
        name: "Back Left Pilge"
        value: backend.horizontalMotor * backend.backLeftMotorDir
        motorMinimum: -255
        xAll: rovBorder.x + 30
        yAll: rovBorder.y + 170
    }

    Motor { // vertical motor 1
        id:verticalMotor1
        name: "Front T200"
        value: backend.verticalMotor1
        xAll: rovBorder.x + 30
        yAll: rovBorder.y + 308
        motorSpeedFieldWidth: 50
        motorMinimum: 1100
        motorMaxmum: 1900
        motorIamgeSource: "images/pinkDialT100.png"
    }

    Motor { // vertical motor 2
        id:verticalMotor2
        name: "Back T200"
        value: backend.verticalMotor2
        xAll: rovBorder.x + 174
        yAll: rovBorder.y + 308

        motorSpeedFieldWidth: 50
        motorMinimum: 1100
        motorMaxmum: 1900
        motorIamgeSource: "images/pinkDialT100.png"
    }
}
