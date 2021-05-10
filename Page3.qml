import QtQuick 2.0
import QtQuick.Window 2.12
import QtQuick.Controls 2.15
import io.qt.examples.backend 1.0

Item {
    Page {
        id:connectionPage
        width: mainWindow.width
        height: mainWindow.height

        header:
            Image {
            id: headerBackground
            source: "images/about.jpeg"
            height: 60
            Label {
                text: qsTr("Control page")
                font.pixelSize: Qt.application.font.pixelSize * 2
                padding: 10
                color:"white"
            }

            Label {
                id: timerLabel
                text: "Remaining time\n          "+ timeMins + " : " + timeSecs
                color: "white"
                font.bold : true
                font.pixelSize: 20
                x: 1120
                y: 10
            }

            Label {
                id: points
                text:"Total points\n           " + pointsCounter
                font.bold : true
                font.pixelSize: 20
                color: "white"
                x: 980
                y: 10
            }
        }

        BackEnd {
            id: backend
        }

        Image {
            id: background
            source: "images/black.jpg"
            width: 1500
            height: 750
        }

        ButtonPart {
            buttons_x: 150
            buttons_y: 110
        }

        Rectangle{
            id: horizontalMaxSpeedBorder
            x: 900
            y: 277.5
            color: "transparent"
            width: 264
            height: 95
            border.color: "deeppink"
            border.width: 2
            radius: 10
        }

        Column {
            spacing: 5
            x: horizontalMaxSpeedBorder.x + 22
            y: horizontalMaxSpeedBorder.y + 7

            Label {
                text: "Horizontal max speed"
                color:"white"
                font.bold : true
                font.pixelSize: 18
                x: 18
            }

            SpinBox {
                editable: true
                to:255
                value: 180
                stepSize: 15
                font.bold: true
                enabled: !flyTransect
                onValueChanged: {backend.getPilgeMaxSpeed(value)}
                background: Rectangle {
                    implicitWidth: 220
                    implicitHeight: 20
                    radius: 2
                }
            }
        }


        Rectangle{
            id: verticalMaxSpeedBorder
            x: 900
            y: 400
            color: "transparent"
            width: 264
            height: 95
            border.color: "deeppink"
            border.width: 2
            radius: 10
        }

        Column {
            spacing: 5
            x: verticalMaxSpeedBorder.x + 22
            y: verticalMaxSpeedBorder.y + 7

            Label {
                text: "Vertical max speed"
                color:"white"
                font.bold : true
                font.pixelSize: 18
                x: 28
            }

            SpinBox {
                editable: true
                to: 400
                value: 400
                stepSize: 15
                font.bold: true
                enabled: !flyTransect
                onValueChanged: {backend.getT100MaxSpeed(value)}
                background: Rectangle {
                    implicitWidth: 220
                    implicitHeight: 20
                    radius: 2
                }
            }
        }
        AxisPart {
            id: axisPart
            fields_xAxis: 685
            firstField_yAxis: 110
            spaceBetweenAxises: 50
        }

        PIDvalues {
            borderX: 935
            borderY: 110
        }
    }
}
