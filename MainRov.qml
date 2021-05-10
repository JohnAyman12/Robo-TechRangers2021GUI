import QtQuick 2.12
import QtQuick.Controls 2.15
import io.qt.examples.backend 1.0

Item {
    property int horizontalMotor: backend.horizontalMotor

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
        height: 488
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
        x:mainROV_x + 50
        y:mainROV_y - 24
    }

    Image {
        id: mainImg
        x: mainLbl.x - 54
        y: mainLbl.y - 27
        source: "images/main.png"
        width: 55
        height: mainImg.width
    }

//    Motor { // horizontal motors
//        id: horizontalMotorsID
//        name: "Horizontal Motors"
//        value: horizontalMotor
//        motorMinimum: 0
//        motorEnable:  !flyTransect
//        xAll: rovBorder.x + 30
//        yAll: rovBorder.y + 32
//        motorDirectionVisible: false
//    }

    Motor { // vertical motor 1
        id:verticalMotor1
        name: "Vertical Front"
        value: backend.verticalMotor1
        motorEnable:  !flyTransect
        xAll: rovBorder.x + 30
        yAll: rovBorder.y + 32

        motorDirectionVisible: false
        motorSpeedFieldWidth: 50
        motorMinimum: 1100
        motorMaxmum: 1900
        motorIamgeSource: "images/pinkDialT100.png"
    }

    Motor { // vertical motor 2
        id:verticalMotor2
        name: "Vertical Back"
        value: backend.verticalMotor2
        motorEnable:  !flyTransect
        xAll: rovBorder.x + 174
        yAll: rovBorder.y + 32

        motorDirectionVisible: false
        motorSpeedFieldWidth: 50
        motorMinimum: 1100
        motorMaxmum: 1900
        motorIamgeSource: "images/pinkDialT100.png"
    }

        Motor { // horizontal motors
            id: horizontalMotorsID
            name: "Horizontal Motors"
            value: horizontalMotor
            motorMinimum: 0
            motorEnable:  !flyTransect
            xAll: rovBorder.x + 30
            yAll: rovBorder.y + 170
            motorDirectionVisible: false
        }

//    Label {
//        id:horizontalMotorsDirLbl
//        text: "Horizontal Motors"
//        color: textColor
//        anchors.centerIn: rovBorder
//        anchors.verticalCenterOffset: -98
//        font.pixelSize: 20
//        font.bold: true
//    }

//    PilgeMotors {
//        itemX: horizontalMotorsDirLbl.x + 21
//        itemY: horizontalMotorsDirLbl.y + 30
//        lableText: "Front Right: " + frontRightDir
//        imgSource: if (frontRightDir == 0) {"images/hold.png"}
//                   else if (frontRightDir == 1){"images/clockwise.jpeg"}
//                   else {"images/anticlockwise.png"}
//    }

//    PilgeMotors {
//        itemX: horizontalMotorsDirLbl.x + 21
//        itemY: horizontalMotorsDirLbl.y + 60
//        lableText: "Front Left:   " + frontLeftDir
//        imgSource: if (frontLeftDir == 0) {"images/hold.png"}
//                   else if (frontLeftDir == 1){"images/clockwise.jpeg"}
//                   else {"images/anticlockwise.png"}
//    }

//    PilgeMotors {
//        itemX: horizontalMotorsDirLbl.x + 21
//        itemY: horizontalMotorsDirLbl.y + 90
//        lableText: "Back Right:  " + backRightDir
//        imgSource: if (backRightDir == 0) {"images/hold.png"}
//                   else if (backRightDir == 1){"images/clockwise.jpeg"}
//                   else {"images/anticlockwise.png"}
//    }

//    PilgeMotors {
//        itemX: horizontalMotorsDirLbl.x + 21
//        itemY: horizontalMotorsDirLbl.y + 120
//        lableText: "Back Left:    " + backLeftDir
//        imgSource: if (backLeftDir == 0) {"images/hold.png"}
//                   else if (backLeftDir == 1){"images/clockwise.jpeg"}
//                   else {"images/anticlockwise.png"}
//    }

    // main ROV images

    Label {
        id:mainRovDirectionLbl
        text: "Main Rov Direction"
        color: textColor
        anchors.centerIn: rovBorder
        anchors.verticalCenterOffset: 50
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
        width: 165
        height: 165
        anchors.centerIn: mainRovDirectionLbl
        anchors.verticalCenterOffset: 100
    }
}
