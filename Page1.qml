import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.15
import io.qt.examples.backend 1.0

Item {

    property int current: 55

    Page {
        id:mainPage
        width: mainWindow.width
        height: mainWindow.height

        header:
            Image {
            id: headerBackground
            source: "/images/black.jpg"
            width: 1500
            height: 50

            Label {
                text: qsTr("Main page")
                font.pixelSize: Qt.application.font.pixelSize * 2
                padding: 10
                color: "white"
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

        ButtonPart {
            buttons_x: 835
            buttons_y: 100
        }

        MotorPart {
            id:motorPart
            mainROV_x: 515
            mainROV_y: 50
            microROV_x:180
            microROV_y: 50
        }

        RecievedDataPart {
            id:recievedDataPart
            firstLable_xAxis: 160
            firstLable_yAxis: 290
            spaceBetweenLablesY: 30
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.9;height:480;width:640}
}
##^##*/
