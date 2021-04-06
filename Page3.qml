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
                text: qsTr("Connection page")
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

        Image {
            id: background
            source: "images/black.jpg"
            width: 1500
            height: 750
        }

        ButtonPart {
            buttons_x: 150
            buttons_y: 150
        }

        AxisPart {
            id: axisPart
            fields_xAxis: 680
            firstField_yAxis: 150
            spaceBetweenAxises: 50
        }

        PIDvalues {
            borderX: 935
            borderY: 150
        }
    }
}
