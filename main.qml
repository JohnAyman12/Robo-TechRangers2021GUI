import QtQuick 2.6
import QtQuick.Controls 2.0
import io.qt.examples.backend 1.0

ApplicationWindow {
    id: root
    width: 700
    height: 650
    visible: true

    BackEnd {
        id: backend
    }

    // axises on the right

    TextField {
        id:axis0
        text: backend.axis0
        readOnly : true
        anchors.verticalCenterOffset: -125
        anchors.horizontalCenterOffset: 125
        placeholderText: qsTr("axis0")
        anchors.centerIn: parent
    }

    TextField {
        id:axis1
        text: backend.axis1
        readOnly : true
        anchors.verticalCenterOffset: -75
        anchors.horizontalCenterOffset: 125
        placeholderText: qsTr("axis1")
        anchors.centerIn: parent
    }

    TextField {
        id:axis2
        text: backend.axis2
        readOnly : true
        anchors.verticalCenterOffset: -25
        anchors.horizontalCenterOffset: 125
        placeholderText: qsTr("axis2")
        anchors.centerIn: parent
    }

    TextField {
        id:axis3
        text: backend.axis3
        readOnly : true
        anchors.verticalCenterOffset: 25
        anchors.horizontalCenterOffset: 125
        placeholderText: qsTr("axis3")
        anchors.centerIn: parent
    }

    TextField {
        id:axis4
        text: backend.axis4
        readOnly : true
        anchors.verticalCenterOffset: 75
        anchors.horizontalCenterOffset: 125
        placeholderText: qsTr("axis4")
        anchors.centerIn: parent
    }

    TextField {
        id:axis5
        text: backend.axis5
        readOnly : true
        anchors.verticalCenterOffset: 125
        anchors.horizontalCenterOffset: 125
        placeholderText: qsTr("axis5")
        anchors.centerIn: parent
    }

    // Buttons on the left

    TextField {
        id:button0
        text: backend.button0
        readOnly : true
        anchors.verticalCenterOffset: -275
        anchors.horizontalCenterOffset: -125
        placeholderText: qsTr("button0")
        anchors.centerIn: parent
    }

    TextField {
        id:button1
        text: backend.button1
        readOnly : true
        anchors.verticalCenterOffset: -225
        anchors.horizontalCenterOffset: -125
        placeholderText: qsTr("button1")
        anchors.centerIn: parent
    }

    TextField {
        id:button2
        text: backend.button2
        readOnly : true
        anchors.verticalCenterOffset: -175
        anchors.horizontalCenterOffset: -125
        placeholderText: qsTr("button2")
        anchors.centerIn: parent
    }

    TextField {
        id:button3
        text: backend.button3
        readOnly : true
        anchors.verticalCenterOffset: -125
        anchors.horizontalCenterOffset: -125
        placeholderText: qsTr("button3")
        anchors.centerIn: parent
    }

    TextField {
        id:button4
        text: backend.button4
        readOnly : true
        anchors.verticalCenterOffset: -75
        anchors.horizontalCenterOffset: -125
        placeholderText: qsTr("button4")
        anchors.centerIn: parent
    }

    TextField {
        id:button5
        text: backend.button5
        readOnly : true
        anchors.verticalCenterOffset: -25
        anchors.horizontalCenterOffset: -125
        placeholderText: qsTr("button5")
        anchors.centerIn: parent
    }

    TextField {
        id:button6
        text: backend.button6
        readOnly : true
        anchors.verticalCenterOffset: 25
        anchors.horizontalCenterOffset: -125
        placeholderText: qsTr("button6")
        anchors.centerIn: parent
    }

    TextField {
        id:button7
        text: backend.button7
        readOnly : true
        anchors.verticalCenterOffset: 75
        anchors.horizontalCenterOffset: -125
        placeholderText: qsTr("button7")
        anchors.centerIn: parent
    }

    TextField {
        id:button8
        text: backend.button8
        readOnly : true
        anchors.verticalCenterOffset: 125
        anchors.horizontalCenterOffset: -125
        placeholderText: qsTr("button8")
        anchors.centerIn: parent
    }

    TextField {
        id:button9
        text: backend.button9
        readOnly : true
        anchors.verticalCenterOffset: 175
        anchors.horizontalCenterOffset: -125
        placeholderText: qsTr("button9")
        anchors.centerIn: parent
    }

    TextField {
        id:button10
        text: backend.button10
        readOnly : true
        anchors.verticalCenterOffset: 225
        anchors.horizontalCenterOffset: -125
        placeholderText: qsTr("button10")
        anchors.centerIn: parent
    }

    TextField {
        id:button11
        text: backend.button11
        readOnly : true
        anchors.verticalCenterOffset: 275
        anchors.horizontalCenterOffset: -125
        placeholderText: qsTr("button11")
        anchors.centerIn: parent
    }
}
