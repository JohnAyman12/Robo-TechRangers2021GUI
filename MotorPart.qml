import QtQuick 2.12
import QtQuick.Controls 2.15
import io.qt.examples.backend 1.0

Item {
    property int horizontalMotor: backend.horizontalMotor
    property int verticalMotor: backend.verticalMotor
//    property int microMotor: backend.microMotor
    property int microMotor: 0
    property int rollerMotor: backend.rollerMotor

    property int frontRightDir: backend.frontRightMotorDir
    property int frontLeftDir: backend.frontLeftMotorDir
    property int backRightDir: backend.backRightMotorDir
    property int backLeftDir: backend.backLeftMotorDir
    property int microMotorDir: backend.microMotorDir
    property int rollerMotorDir: backend.rollerMotorDir

    property int firstDial_xAxis
    property int firstDial_yAxis
    property int spaceBetweenMotorsX
    property int spaceBetweenMotorsY

    BackEnd { // backend data
        id: backend
    }

    Shortcut {
        id: shortcutMicroForward
        sequence: "R"
        context: Qt.ApplicationShortcut
        enabled: checkBoxMicro.checked
        onActivated:{microMotor = 255; microMotorDir = 1}
    }

    Shortcut {
        id: shortcutMicroStop
        sequence: "F"
        context: Qt.ApplicationShortcut
        enabled: checkBoxMicro.checked
        onActivated:{microMotor = 0; microMotorDir = 0}
    }

    Shortcut {
        id: shortcutMicroBack
        sequence: "C"
        context: Qt.ApplicationShortcut
        enabled: checkBoxMicro.checked
        onActivated:{microMotor = 255; microMotorDir = -1}
    }

    Motor { // horizontal motors
        id: horizontalMotorsID
        lableText: "Horizontal Motors"
        motorValue: horizontalMotor
        motorDirection: frontRightDir
        x: firstDial_xAxis
        y: firstDial_yAxis
    }

    Motor { // vertical motor
        id:verticalMotors
        lableText: "Vertical Motors"
        valueFieldWidth: 50
        motorValue: verticalMotor
        awayFromCenter: 8
        dialMinimum: 1000
        dialMaximum: 2000
        x: firstDial_xAxis + spaceBetweenMotorsX
        y: firstDial_yAxis
    }

    Column { // horizontal motors directions
        x: firstDial_xAxis + (spaceBetweenMotorsX * 0.45)
        y: firstDial_yAxis + (spaceBetweenMotorsY * 0.8)
        spacing: 8

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

    Column { // maximum speed spinbox
        spacing: 5
        x: firstDial_xAxis + (spaceBetweenMotorsX * 0.35)
        y: firstDial_yAxis + (spaceBetweenMotorsY * 1.5)

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
    }

    CheckBox { // micro mood control
        id:checkBoxMicro
        text: "Micro"
        font.pixelSize: 17
        font.bold: true
        x: firstDial_xAxis + (spaceBetweenMotorsX * 0.5)
        y: firstDial_yAxis + (spaceBetweenMotorsY * 2)
        onCheckStateChanged:
        {
            if(!checkBoxMicro.checked)
            {
                microMotor = 0
                microMotorDir = 0
            }
        }
    }

    Motor { // micro motor
        id:microMotors
        lableText: "Micro Motor"
        motorValue: microMotor
        dialEnable: checkBoxMicro.checkState
        awayFromCenter: -5
        x: firstDial_xAxis
        y: firstDial_yAxis + (spaceBetweenMotorsY * 2.5)
    }

    Motor { // roller motor
        id:bakaraMotor
        lableText: "Roller Motors"
        motorValue: rollerMotor
        dialEnable: checkBoxMicro.checkState
        awayFromCenter: -8
        x: firstDial_xAxis + spaceBetweenMotorsX
        y: firstDial_yAxis + (spaceBetweenMotorsY * 2.5)
    }

    Label { // micro motor direction
        text: "Micro: " + microMotorDir
        font.pixelSize: 17
        font.bold: true
        x: firstDial_xAxis + (spaceBetweenMotorsX * 0.13)
        y: firstDial_yAxis + (spaceBetweenMotorsY * 3.25)
    }

    Label { // roller motor direction
        text: "Roller: " + rollerMotorDir
        font.pixelSize: 17
        font.bold: true
        x: firstDial_xAxis + (spaceBetweenMotorsX * 1.13)
        y: firstDial_yAxis + (spaceBetweenMotorsY * 3.25)
    }

}
