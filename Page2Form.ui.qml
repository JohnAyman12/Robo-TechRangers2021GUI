import QtQuick 2.12
import QtQuick.Controls 2.5
import io.qt.examples.backend 1.0

Page {
    width: mainWindow.width
    height: mainWindow.height

    header: Label {
        text: qsTr("Button page")
        font.pixelSize: Qt.application.font.pixelSize * 2
        padding: 10
    }

    BackEnd {
        id: backend
    }

    // Buttons

    TextField {
        id:button0
        text: backend.button0
        readOnly : true
        anchors.verticalCenterOffset: -300
//        anchors.horizontalCenterOffset: -125
        placeholderText: qsTr("button0")
        anchors.centerIn: parent
    }

    TextField {
        id:button1
        text: backend.button1
        readOnly : true
        anchors.verticalCenterOffset: -250
//        anchors.horizontalCenterOffset: -125
        placeholderText: qsTr("button1")
        anchors.centerIn: parent
    }

    TextField {
        id:button2
        text: backend.button2
        readOnly : true
        anchors.verticalCenterOffset: -200
//        anchors.horizontalCenterOffset: -125
        placeholderText: qsTr("button2")
        anchors.centerIn: parent
    }

    TextField {
        id:button3
        text: backend.button3
        readOnly : true
        anchors.verticalCenterOffset: -150
//        anchors.horizontalCenterOffset: -125
        placeholderText: qsTr("button3")
        anchors.centerIn: parent
    }

    TextField {
        id:button4
        text: backend.button4
        readOnly : true
        anchors.verticalCenterOffset: -100
//        anchors.horizontalCenterOffset: -125
        placeholderText: qsTr("button4")
        anchors.centerIn: parent
    }

    TextField {
        id:button5
        text: backend.button5
        readOnly : true
        anchors.verticalCenterOffset: -50
//        anchors.horizontalCenterOffset: -125
        placeholderText: qsTr("button5")
        anchors.centerIn: parent
    }

    TextField {
        id:button6
        text: backend.button6
        readOnly : true
        anchors.verticalCenterOffset: 0
//        anchors.horizontalCenterOffset: -125
        placeholderText: qsTr("button6")
        anchors.centerIn: parent
    }

    TextField {
        id:button7
        text: backend.button7
        readOnly : true
        anchors.verticalCenterOffset: 50
//        anchors.horizontalCenterOffset: -125
        placeholderText: qsTr("button7")
        anchors.centerIn: parent
    }

    TextField {
        id:button8
        text: backend.button8
        readOnly : true
        anchors.verticalCenterOffset: 100
//        anchors.horizontalCenterOffset: -125
        placeholderText: qsTr("button8")
        anchors.centerIn: parent
    }

    TextField {
        id:button9
        text: backend.button9
        readOnly : true
        anchors.verticalCenterOffset: 150
//        anchors.horizontalCenterOffset: -125
        placeholderText: qsTr("button9")
        anchors.centerIn: parent
    }

    TextField {
        id:button10
        text: backend.button10
        readOnly : true
        anchors.verticalCenterOffset: 200
//        anchors.horizontalCenterOffset: -125
        placeholderText: qsTr("button10")
        anchors.centerIn: parent
    }

    TextField {
        id:button11
        text: backend.button11
        readOnly : true
        anchors.verticalCenterOffset: 250
//        anchors.horizontalCenterOffset: -125
        placeholderText: qsTr("button11")
        anchors.centerIn: parent
    }
}
