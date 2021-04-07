import QtQuick 2.12
import QtQuick.Controls 2.15
import io.qt.examples.backend 1.0

Item {
    property int horizontalMotor: backend.horizontalMotor
    property int verticalMotor: backend.verticalMotor

    property int frontRightDir: backend.frontRightMotorDir
    property int frontLeftDir: backend.frontLeftMotorDir
    property int backRightDir: backend.backRightMotorDir
    property int backLeftDir: backend.backLeftMotorDir

    property int mainROV_x
    property int mainROV_y
    property color textColor: "white"

    BackEnd { // backend data
        id: backend
    }

    // Main ROV

    Rectangle {
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

    Label {
        id: mainLbl
        text: "Main ROV"
        font.bold : true
        font.pixelSize: 20
        color: "white"
        x:mainROV_x + 68
        y:mainROV_y - 24
    }

    Image {
        id: mainImg
        x: mainLbl.x - 70
        y: mainLbl.y - 40
        source: "images/main.png"
        width: 70
        height: mainImg.width
    }

    Motor { // horizontal motors
        id: horizontalMotorsID
        lableText: "Horizontal Motors"
        motorValue: horizontalMotor
        dialEnable:  !flyTransect
        x: rovBorder.x + (rovBorder.width * 0.13)
        y: rovBorder.y + 32
    }

    Motor { // vertical motor
        id:verticalMotors
        lableText: "Vertical Motors"
        valueFieldWidth: 50
        motorValue: verticalMotor
        dialEnable:  !flyTransect
        awayFromCenter: 8
        dialMinimum: 1100
        dialMaximum: 1900
        imgSource: "images/pinkDialT100.png"
        x: rovBorder.x + (rovBorder.width * 0.59)
        y: horizontalMotorsID.y
    }

    Label {
        id:horizontalMotorsDirLbl
        text: "Horizontal Motors"
        color: textColor
        anchors.centerIn: rovBorder
        anchors.verticalCenterOffset: -115
        font.pixelSize: 20
        font.bold: true
    }

    PilgeMotors {
        itemX: horizontalMotorsDirLbl.x + 21
        itemY: horizontalMotorsDirLbl.y + 30
        lableText: "Front Right: " + frontRightDir
        imgSource: if (frontRightDir == 0) {"images/hold.png"}
                   else if (frontRightDir == 1){"images/clockwise.jpeg"}
                   else {"images/anticlockwise.png"}
    }

    PilgeMotors {
        itemX: horizontalMotorsDirLbl.x + 21
        itemY: horizontalMotorsDirLbl.y + 60
        lableText: "Front Left:   " + frontLeftDir
        imgSource: if (frontLeftDir == 0) {"images/hold.png"}
                   else if (frontLeftDir == 1){"images/clockwise.jpeg"}
                   else {"images/anticlockwise.png"}
    }

    PilgeMotors {
        itemX: horizontalMotorsDirLbl.x + 21
        itemY: horizontalMotorsDirLbl.y + 90
        lableText: "Back Right:  " + backRightDir
        imgSource: if (backRightDir == 0) {"images/hold.png"}
                   else if (backRightDir == 1){"images/clockwise.jpeg"}
                   else {"images/anticlockwise.png"}
    }

    PilgeMotors {
        itemX: horizontalMotorsDirLbl.x + 21
        itemY: horizontalMotorsDirLbl.y + 120
        lableText: "Back Left:    " + backLeftDir
        imgSource: if (backLeftDir == 0) {"images/hold.png"}
                   else if (backLeftDir == 1){"images/clockwise.jpeg"}
                   else {"images/anticlockwise.png"}
    }

    // main ROV images

    Label {
        id:mainRovDirectionLbl
        text: "Main Rov Direction"
        color: textColor
        anchors.centerIn: mainRovDirectionImg
        anchors.verticalCenterOffset: -115
        font.pixelSize: 20
        font.bold: true
    }

    Image {
        id:mainRovDirectionImg
        source:
            if (frontRightDir == 1 && frontLeftDir == 1 && backRightDir == 1){"images/forward.png"}
            else if (frontRightDir == -1 && frontLeftDir == -1 && backRightDir == -1){"images/back.png"}
            else if (frontRightDir == -1 && frontLeftDir == 1 && backRightDir == 1){"images/right.png"}
            else if (frontRightDir == 1 && frontLeftDir == -1 && backRightDir == -1){"images/left.png"}
            else if (frontRightDir == -1 && frontLeftDir == 1 && backRightDir == -1){"images/clockwise.jpeg"}
            else if (frontRightDir == 1 && frontLeftDir == -1 && backRightDir == 1){"images/anticlockwise.png"}
            else {"images/hold.png"}
        width: 200
        height: 200
        x: rovBorder.x + 46
        y: rovBorder.y + 306
    }
}
