import QtQuick 2.12
import QtQuick.Controls 2.5
import io.qt.examples.backend 1.0

Page {
    width: mainWindow.width
    height: mainWindow.height

    header: Label {
        text: qsTr("Axis page")
        font.pixelSize: Qt.application.font.pixelSize * 2
        padding: 10
    }

    BackEnd {
        id: backend
    }

    // axises TextFields
    TextField {
        id:frontLeftMotor
        text: backend.frontLeftMotor
        width: 200
        readOnly : true
        anchors.verticalCenterOffset: -125
        placeholderText: qsTr("frontLeft")
        anchors.centerIn: parent
    }

    TextField {
        id:frontRightMotor
        text: backend.frontRightMotor
        width: 200
        readOnly : true
        anchors.verticalCenterOffset: -75
        placeholderText: qsTr("frontRight")
        anchors.centerIn: parent
    }

    TextField {
        id:backLeftMotor
        text: backend.backLeftMotor
        width: 200
        readOnly : true
        anchors.verticalCenterOffset: -25
        placeholderText: qsTr("backLeft")
        anchors.centerIn: parent
    }

    TextField {
        id:backRightMotor
        text: backend.backRightMotor
        width: 200
        readOnly : true
        anchors.verticalCenterOffset: 25
        placeholderText: qsTr("backRight")
        anchors.centerIn: parent
    }

    TextField {
        id:up_downFrontMotor
        text: backend.up_downFrontMotor
        width: 200
        readOnly : true
        anchors.verticalCenterOffset: 75
        placeholderText: qsTr("up/downFront")
        anchors.centerIn: parent
    }

    TextField {
        id:up_downBackMotor
        text: backend.up_downBackMotor
        width: 200
        readOnly : true
        anchors.verticalCenterOffset: 125
        placeholderText: qsTr("up/downBack")
        anchors.centerIn: parent
    }
}
