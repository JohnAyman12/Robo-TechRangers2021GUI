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
        id:axis0
        text: backend.axis0
        readOnly : true
        anchors.verticalCenterOffset: -125
//        anchors.horizontalCenterOffset: 125
        placeholderText: qsTr("axis0")
        anchors.centerIn: parent
    }

    TextField {
        id:axis1
        text: backend.axis1
        readOnly : true
        anchors.verticalCenterOffset: -75
//        anchors.horizontalCenterOffset: 125
        placeholderText: qsTr("axis1")
        anchors.centerIn: parent
    }

    TextField {
        id:axis2
        text: backend.axis2
        readOnly : true
        anchors.verticalCenterOffset: -25
//        anchors.horizontalCenterOffset: 125
        placeholderText: qsTr("axis2")
        anchors.centerIn: parent
    }

    TextField {
        id:axis3
        text: backend.axis3
        readOnly : true
        anchors.verticalCenterOffset: 25
//        anchors.horizontalCenterOffset: 125
        placeholderText: qsTr("axis3")
        anchors.centerIn: parent
    }

    TextField {
        id:axis4
        text: backend.axis4
        readOnly : true
        anchors.verticalCenterOffset: 75
//        anchors.horizontalCenterOffset: 125
        placeholderText: qsTr("axis4")
        anchors.centerIn: parent
    }

    TextField {
        id:axis5
        text: backend.axis5
        readOnly : trueBackEnd
        anchors.verticalCenterOffset: 125
//        anchors.horizontalCenterOffset: 125
        placeholderText: qsTr("axis5")
        anchors.centerIn: parent
    }
}
