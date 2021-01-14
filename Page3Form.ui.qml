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

    // motors TextFields

    // front-left motor

    Label {
        text: qsTr("front-left motor")
        font.bold : true
        anchors.verticalCenterOffset: -125
        anchors.horizontalCenterOffset: -80
        anchors.centerIn: parent
    }

    TextField {
        id:frontLeftMotor
        text: backend.frontLeftMotor
        width: 30
        readOnly : true
        anchors.verticalCenterOffset: -125
        placeholderText: qsTr("frontLeft")
        anchors.centerIn: parent
    }

    Label {
        text: qsTr("direction")
        font.bold : true
        anchors.verticalCenterOffset: -125
        anchors.horizontalCenterOffset: 50
        anchors.centerIn: parent
    }

    TextField {
        id:frontLeftMotorDir
        text: backend.frontLeftMotorDir
        width: 30
        readOnly : true
        anchors.verticalCenterOffset: -125
        anchors.horizontalCenterOffset: 100
        placeholderText: qsTr("frontLeft")
        anchors.centerIn: parent
    }

    // front-right motor

    Label {
        text: qsTr("front-right motor")
        font.bold : true
        anchors.verticalCenterOffset: -75
        anchors.horizontalCenterOffset: -80
        anchors.centerIn: parent
    }

    TextField {
        id:frontRightMotor
        text: backend.frontRightMotor
        width: 30
        readOnly : true
        anchors.verticalCenterOffset: -75
        placeholderText: qsTr("frontRight")
        anchors.centerIn: parent
    }

    Label {
        text: qsTr("direction")
        font.bold : true
        anchors.verticalCenterOffset: -75
        anchors.horizontalCenterOffset: 50
        anchors.centerIn: parent
    }

    TextField {
        id:frontRightMotorDir
        text: backend.frontRightMotorDir
        width: 30
        readOnly : true
        anchors.verticalCenterOffset: -75
        anchors.horizontalCenterOffset: 100
        placeholderText: qsTr("frontLeft")
        anchors.centerIn: parent
    }

    // back-left motor

    Label {
        text: qsTr("back-left motor")
        font.bold : true
        anchors.verticalCenterOffset: -25
        anchors.horizontalCenterOffset: -80
        anchors.centerIn: parent
    }

    TextField {
        id:backLeftMotor
        text: backend.backLeftMotor
        width: 30
        readOnly : true
        anchors.verticalCenterOffset: -25
        placeholderText: qsTr("backLeft")
        anchors.centerIn: parent
    }

    Label {
        text: qsTr("direction")
        font.bold : true
        anchors.verticalCenterOffset: -25
        anchors.horizontalCenterOffset: 50
        anchors.centerIn: parent
    }

    TextField {
        id:backLeftMotorDir
        text: backend.backLeftMotorDir
        width: 30
        readOnly : true
        anchors.verticalCenterOffset: -25
        anchors.horizontalCenterOffset: 100
        placeholderText: qsTr("frontLeft")
        anchors.centerIn: parent
    }

    // back-right motor

    Label {
        text: qsTr("back-right motor")
        font.bold : true
        anchors.verticalCenterOffset: 25
        anchors.horizontalCenterOffset: -80
        anchors.centerIn: parent
    }

    TextField {
        id:backRightMotor
        text: backend.backRightMotor
        width: 30
        readOnly : true
        anchors.verticalCenterOffset: 25
        placeholderText: qsTr("backRight")
        anchors.centerIn: parent
    }

    Label {
        text: qsTr("direction")
        font.bold : true
        anchors.verticalCenterOffset: 25
        anchors.horizontalCenterOffset: 50
        anchors.centerIn: parent
    }

    TextField {
        id:backRightMotorDir
        text: backend.backRightMotorDir
        width: 30
        readOnly : true
        anchors.verticalCenterOffset: 25
        anchors.horizontalCenterOffset: 100
        placeholderText: qsTr("frontLeft")
        anchors.centerIn: parent
    }

    // up/down front motor

    Label {
        text: qsTr("up/down front motor")
        font.bold : true
        anchors.verticalCenterOffset: 75
        anchors.horizontalCenterOffset: -90
        anchors.centerIn: parent
    }

    TextField {
        id:up_downFrontMotor
        text: backend.up_downFrontMotor
        width: 30
        readOnly : true
        anchors.verticalCenterOffset: 75
        placeholderText: qsTr("up/downFront")
        anchors.centerIn: parent
    }

    Label {
        text: qsTr("direction")
        font.bold : true
        anchors.verticalCenterOffset: 75
        anchors.horizontalCenterOffset: 50
        anchors.centerIn: parent
    }

    TextField {
        id:up_downFrontMotorDir
        text: backend.up_downFrontMotorDir
        width: 30
        readOnly : true
        anchors.verticalCenterOffset: 75
        anchors.horizontalCenterOffset: 100
        placeholderText: qsTr("frontLeft")
        anchors.centerIn: parent
    }

    // up/down back motor

    Label {
        text: qsTr("up/down back motor")
        font.bold : true
        anchors.verticalCenterOffset: 125
        anchors.horizontalCenterOffset: -90
        anchors.centerIn: parent
    }

    TextField {
        id:up_downBackMotor
        text: backend.up_downBackMotor
        width: 30
        readOnly : true
        anchors.verticalCenterOffset: 125
        placeholderText: qsTr("up/downBack")
        anchors.centerIn: parent
    }

    Label {
        text: qsTr("direction")
        font.bold : true
        anchors.verticalCenterOffset: 125
        anchors.horizontalCenterOffset: 50
        anchors.centerIn: parent
    }

    TextField {
        id:up_downBackMotorDir
        text: backend.up_downBackMotorDir
        width: 30
        readOnly : true
        anchors.verticalCenterOffset: 125
        anchors.horizontalCenterOffset: 100
        placeholderText: qsTr("frontLeft")
        anchors.centerIn: parent
    }

}
