import QtQuick 2.12
import QtQuick.Controls 2.15
import io.qt.examples.backend 1.0

Item {
    property int horizontalMotor: backend.horizontalMotor
    property int verticalMotor: backend.verticalMotor
    //    property int microMotor: backend.microMotor
    property int microMotor: 0
    //    property int rollerMotor: backend.rollerMotor
    property int rollerMotor: 0

    property int frontRightDir: backend.frontRightMotorDir
    property int frontLeftDir: backend.frontLeftMotorDir
    property int backRightDir: backend.backRightMotorDir
    property int backLeftDir: backend.backLeftMotorDir
    //    property int microMotorDir: backend.microMotorDir
    property int microMotorDir: 0
    //    property int rollerMotorDir: backend.rollerMotorDir
    property int rollerMotorDir: 0

    property int microArm: 0

    property int mainROV_x
    property int mainROV_y
    property int microROV_x
    property int microROV_y
    property int spaceBetweenMotorsX: 150
    property int spaceBetweenMotorsY: 150

    BackEnd { // backend data
        id: backend
    }

    // controling shortcuts

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

    Shortcut {
        id: shortcutRollerForward
        sequence: "I"
        context: Qt.ApplicationShortcut
        enabled: checkBoxMicro.checked
        onActivated:{rollerMotor = 255; rollerMotorDir = 1}
    }

    Shortcut {
        id: shortcutRollerStop
        sequence: "J"
        context: Qt.ApplicationShortcut
        enabled: checkBoxMicro.checked
        onActivated:{rollerMotor = 0; rollerMotorDir = 0}
    }

    Shortcut {
        id: shortcutRollerBack
        sequence: "M"
        context: Qt.ApplicationShortcut
        enabled: checkBoxMicro.checked
        onActivated:{rollerMotor = 255; rollerMotorDir = -1}
    }

    Shortcut {
        id: shortcutMicroArm
        sequence: "O"
        context: Qt.ApplicationShortcut
        enabled: checkBoxMicro.checked
        onActivated:{
            microArm = !microArm;
            console.log(col.x + " , " + col.y)
        }
    }

    // Main ROV

    Rectangle{
        id:rovBorder
        x: mainROV_x
        y: mainROV_y
        width: 300
        height: 520
        color: "transparent"
        border.color: "deeppink"
        border.width: 2
        radius: 10
    }

    Motor { // horizontal motors
        id: horizontalMotorsID
        lableText: "Horizontal Motors"
        motorValue: horizontalMotor
        x: rovBorder.x + (rovBorder.width * 0.13)
        y: rovBorder.y + 32
    }

    Motor { // vertical motor
        id:verticalMotors
        lableText: "Vertical Motors"
        valueFieldWidth: 50
        motorValue: verticalMotor
        awayFromCenter: 8
        dialMinimum: 1000
        dialMaximum: 2000
        x: rovBorder.x + (rovBorder.width * 0.59)
        y: horizontalMotorsID.y
    }

    Label {
        id:horizontalMotorsDirLbl
        text: "Horizontal Motors"
        anchors.centerIn: horizontalMotorsDir
        anchors.verticalCenterOffset: -68
        font.pixelSize: 20
        font.bold: true
    }

    Column { // horizontal motors directions
        id:horizontalMotorsDir
        anchors.centerIn: rovBorder
        anchors.verticalCenterOffset: -40
        spacing: 8

        Row{
            spacing: 5
            Label {
                id:frontRight
                text: "Front Right: " + frontRightDir
                font.pixelSize: 17
                font.bold: true
            }

            Image {
                id: frontRightImg
                source: if (frontRightDir == 0) {"/images/hold.png"}
                        else if (frontRightDir == 1){"/images/clockwise.png"}
                        else {"images/anticlockwise.png"}
                width: 20
                height: 20
            }
        }

        Row{
            spacing: 5
            Label {
                text: "Front Left:   " + frontLeftDir
                font.pixelSize: 17
                font.bold: true
            }

            Image {
                id: frontLeftImg
                source: if (frontLeftDir == 0) {"/images/hold.png"}
                        else if (frontLeftDir == 1){"/images/clockwise.png"}
                        else {"images/anticlockwise.png"}
                width: 20
                height: 20
            }
        }

        Row {
            spacing: 5
            Label {
                text: "Back Right:  " + backRightDir
                font.pixelSize: 17
                font.bold: true
                x: frontRight.x
            }

            Image {
                id: backRightImg
                source: if (backRightDir == 0) {"/images/hold.png"}
                        else if (backRightDir == 1){"/images/clockwise.png"}
                        else {"images/anticlockwise.png"}
                width: 20
                height: 20
            }
        }

        Row{
            spacing: 5
            Label {
                text: "Back Left:    " + backLeftDir
                font.pixelSize: 17
                font.bold: true
            }

            Image {
                id: backLeftImg
                source: if (backLeftDir == 0) {"/images/hold.png"}
                        else if (backLeftDir == 1){"/images/clockwise.png"}
                        else {"images/anticlockwise.png"}
                width: 20
                height: 20
            }
        }
    }

    //  MICRO ROV

    Rectangle{
        id:microBorder
        x: microROV_x
        y: microROV_y
        color: "transparent"
        width: 290
        height: 230
        border.color: "deeppink"
        border.width: 2
        radius: 10
    }

    CheckBox { // micro mood control
        id:checkBoxMicro
        text: "Micro"
        font.pixelSize: 17
        font.bold: true
        x: microBorder.x + 100
        y: microBorder.y
        onCheckStateChanged:
        {
            if(!checkBoxMicro.checked)
            {
                microMotor = 0
                microMotorDir = 0
                rollerMotor = 0
                rollerMotorDir = 0
                microArm = 0
            }
        }
    }

    Motor { // micro motor
        id:microMotorID
        lableText: "Micro Motor"
        motorValue: microMotor
        dialEnable: checkBoxMicro.checkState
        awayFromCenter: -5
        x: microBorder.x + 15
        y: microBorder.y + 60
    }

    Motor { // roller motor
        id:rollerMotorID
        lableText: "Roller Motors"
        motorValue: rollerMotor
        dialEnable: checkBoxMicro.checkState
        awayFromCenter: -8
        x: microBorder.x + 165
        y: microBorder.y + 60
    }

    Row{ // micro motor direction
        spacing: 5
        x: microBorder.x + 34.5
        y: microBorder.y + 172.5

        Label { // micro motor direction
            id:microMotorLbl
            text: "Micro: " + microMotorDir
            font.pixelSize: 17
            font.bold: true
        }

        Image {
            id: microMotorImg
            source: if (microMotorDir == 0) {"/images/hold.png"}
                    else if (microMotorDir == 1){"/images/clockwise.png"}
                    else {"/images/anticlockwise.png"}
            width: 20
            height: 20
        }
    }

    Row{ // roller motor direction
        spacing: 5
        x: microBorder.x + 184.5
        y: microBorder.y + 172.5
        Label { // roller motor direction
            id:rollerMotorLbl
            text: "Roller: " + rollerMotorDir
            font.pixelSize: 17
            font.bold: true
        }

        Image {
            id: rollerMotorImg
            source: if (rollerMotorDir == 0) {"/images/hold.png"}
                    else if (rollerMotorDir == 1){"/images/clockwise.png"}
                    else {"/images/anticlockwise.png"}
            width: 20
            height: 20
        }
    }

    Label { // micro arm
        id:microArmLbl
        text: "Arm: " + microArm
        font.pixelSize: 17
        font.bold: true
        x: microBorder.x + 118.5
        y: microBorder.y + 195
    }

    // main ROV images

    Label {
        id:mainRovDirectionLbl
        text: "Main Rov Direction"
        anchors.centerIn: mainRovDirectionImg
        anchors.verticalCenterOffset: -120
        font.pixelSize: 20
        font.bold: true
    }

    Image {
        id:mainRovDirectionImg
        source:
            if (frontRightDir == 1 && frontLeftDir == 1 && backRightDir == 1){"/images/forward.png"}
            else if (frontRightDir == -1 && frontLeftDir == -1 && backRightDir == -1){"/images/back.png"}
            else if (frontRightDir == -1 && frontLeftDir == 1 && backRightDir == 1){"/images/right.png"}
            else if (frontRightDir == 1 && frontLeftDir == -1 && backRightDir == -1){"/images/left.png"}
            else if (frontRightDir == -1 && frontLeftDir == 1 && backRightDir == -1){"/images/clockwise.png"}
            else if (frontRightDir == 1 && frontLeftDir == -1 && backRightDir == 1){"/images/anticlockwise.png"}
            else {"images/hold.png"}
        width: 200
        height: 200
        anchors.centerIn: rovBorder
        anchors.verticalCenterOffset: 150
        x: rovBorder.x + 46
        y: rovBorder.y + 300
    }
}
