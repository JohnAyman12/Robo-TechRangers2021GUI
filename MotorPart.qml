import QtQuick 2.12
import QtQuick.Controls 2.15
import io.qt.examples.backend 1.0

Item {
    BackEnd {
        id: backend
    }

    property int horizontalMotor: backend.horizontalMotor
    property int verticalMotor: backend.verticalMotor
    property int microMotor: backend.microMotor
    property int frontRightDir: backend.frontRightMotorDir
    property int frontLeftDir: backend.frontLeftMotorDir
    property int backRightDir: backend.backRightMotorDir
    property int backLeftDir: backend.backLeftMotorDir
    property int microMotorDir: backend.microMotorDir
    property bool visibleMotor:true
    property int firstDial_xAxis
    property int firstDial_yAxis
    property int spaceBetweenMotorsX
    property int spaceBetweenMotorsY

    // front-right motor


    Motor {
        id: horizontalMotorsID
        lableText: "Horizontal Motors"
        motorVisible: visibleMotor
        motorValue: horizontalMotor
        motorDirection: frontRightDir
        x: firstDial_xAxis
        y: firstDial_yAxis + (spaceBetweenMotorsY * 0)
    }

    // up/down-front motor

    Motor {
        id:verticalMotors
        lableText: "Vertical Motors"
        motorVisible: visibleMotor
        valueFieldWidth: 50
        motorValue: verticalMotor
        awayFromCenter: 8
        dialMinimum: 1000
        dialMaximum: 2000
        x: firstDial_xAxis+ spaceBetweenMotorsX
        y: firstDial_yAxis + (spaceBetweenMotorsY * 0)
    }

    // micro motor

    Motor {
        id:microMotors
        lableText: "Micro Motor"
        motorVisible: !visibleMotor
        motorValue: microMotor
        awayFromCenter: -11
        x: firstDial_xAxis+ 0.5*spaceBetweenMotorsX
        y: firstDial_yAxis + (spaceBetweenMotorsY * 0)
    }

    Column {
        x:firstDial_xAxis + 60
        y: firstDial_yAxis + (spaceBetweenMotorsY * 0.8)
        spacing: 8

        Label {
            id: maximumSpeedLable
            text: "Maximum speed"
            font.bold : true
            font.pixelSize: 18
        }

        SpinBox {
            editable: true
            to:255
            value: 255
            stepSize: 15
            x: maximumSpeedLable.x - 25
            onValueChanged:
            {
                backend.getMaxSpeed(value)
            }
        }
        Row {
            spacing: 5
            x:-35
            visible: visibleMotor

            Label {
                id:frontRight
                text: "Front Right: " + frontRightDir
                font.pixelSize: 17
                font.bold: true
            }

            Label {
                text: "Front Left:   " + frontLeftDir
                font.pixelSize: 17
                font.bold: true
            }
        }

        Row {
            spacing: 5
            x:-35
            visible: visibleMotor

            Label {
                text: "Back Right:  " + backRightDir
                font.pixelSize: 17
                font.bold: true
                x: frontRight.x
            }

            Label {
                text: "Back Left:    " + backLeftDir
                font.pixelSize: 17
                font.bold: true
            }
        }



        Label {
            text: "Micro: " + microMotorDir
            font.pixelSize: 17
            font.bold: true
            visible: !visibleMotor
            x: 40
        }
    }
}
