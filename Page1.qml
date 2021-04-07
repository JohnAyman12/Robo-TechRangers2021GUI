import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.15
import io.qt.examples.backend 1.0

Item {
    property bool flyTransect: false

    Page {
        id:mainPage
        width: mainWindow.width
        height: mainWindow.height

        header:
            Image {
            id: headerBackground
            source: "images/about.jpeg"
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


        MicroRov {
            id: microPart
            microROV_x:120
            microROV_y: 73
        }

        Rectangle{
            id: maxSpeedBorder
            x: 120
            y: 466
            color: "transparent"
            width: 264
            height: 95
            border.color: "deeppink"
            border.width: 2
            radius: 10
        }

        Column {
            id: column // maximum speed spinbox
            spacing: 5
            x: maxSpeedBorder.x + 48
            y: maxSpeedBorder.y + 7

            Label {
                id: maximumSpeedLable
                text: "Maximum speed"
                color:"white"
                font.bold : true
                font.pixelSize: 18
            }

            SpinBox {
                editable: true
                to:255
                value: 255
                stepSize: 15
                x: maximumSpeedLable.x - 25
                font.bold: true
                enabled: !flyTransect
                onValueChanged: {backend.getMaxSpeed(value)}
                background: Rectangle {
                    implicitWidth: 220
                    implicitHeight: 20
                    radius: 2
                }
            }
        }

        MainRov {
            id: mainPart
            mainROV_x: 450
            mainROV_y: 73
        }

        RecievedDataPart {
            id:recievedDataPart
            firstLable_xAxis: 790
            firstLable_yAxis: 73
            spaceBetweenLablesY: 30
        }

        TimerPart {
            borderX: 768
            borderY: 349
        }

        CheckBox {
            id:flyTransectCheckbox
            x: 977
            y: 239
            text: "<font color=\"white\"><b>Fly transact mood"
            font.pixelSize: 17
            onCheckStateChanged:{
                flyTransect = flyTransectCheckbox.checkState;
                backend.getFlyTransactState(flyTransect);
            }
            background: Rectangle {
                x: 9
                y: 17
                width: 16
                height: 16
                radius: 2
                color: "white"
            }
            Rectangle {
                x: -4
                y: 10
                width: 200
                height: 30
                color: "transparent"
                border.color: "deeppink"
                border.width: 2
                radius: 10
            }
        }

        ArmPart {
            buttons_x: 965
            buttons_y: 331
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.9;height:480;width:640}
}
##^##*/
