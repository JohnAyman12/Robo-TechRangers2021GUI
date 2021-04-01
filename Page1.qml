import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.15
import io.qt.examples.backend 1.0

Item {
    Page {
        id:mainPage
        width: mainWindow.width
        height: mainWindow.height

        header:
            Image {
            id: headerBackground
            source: "/images/main.jpeg"
            height: 60
            Label {
                text: qsTr("Main page")
                font.pixelSize: Qt.application.font.pixelSize * 2
                padding: 10
                color: "white"
            }

            Label {
                id: points
                text:"Total points\n           " + pointsCounter
                font.bold : true
                font.pixelSize: 20
                color: "white"
                x: 1150
                y: 10
            }
        }

        Image {
            id: background
            source: "images/black.jpg"
            width: 1500
            height: 750
        }

        BackEnd {
            id:backend
        }

        MotorPart {
            id:motorPart
            mainROV_x: 450
            mainROV_y: 60
            microROV_x:120
            microROV_y: 60
        }

        ArmPart {
            buttons_x: 885
            buttons_y: 386


//            buttons_x: 120
        }

        RecievedDataPart {
            id:recievedDataPart
            firstLable_xAxis: 790
            firstLable_yAxis: 60
            spaceBetweenLablesY: 30
        }

        TimerPart {
            borderX: 130
            borderY: 410


//            borderX: 918
//            borderY: 483
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.9;height:480;width:640}
}
##^##*/
