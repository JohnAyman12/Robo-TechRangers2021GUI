import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.15

Item {

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

        MicroRov {
            id: microPart
            microROV_x: 120
            microROV_y: 68
        }

        TimerPart {
            id: timer
            borderX: 120
            borderY: 445
        }

        MainRov {
            id: mainPart
            mainROV_x: 434
            mainROV_y:  microPart.microROV_y
            //            anchors.centerIn: parent
            //            anchors.verticalCenterOffset: -254
            //            anchors.horizontalCenterOffset: -210
        }

        SpeedMode {
            borderX: 455
            borderY: 525
        }

        //        CheckBox {
        //            id:flyTransectCheckbox
        //            x: 484
        //            y: 525
        //            text: "<font color=\"white\"><b>Fly transact mode"
        //            font.pixelSize: 17
        //            onCheckStateChanged:{
        //                flyTransect = flyTransectCheckbox.checkState;
        //                backend.getFlyTransactState(flyTransect);
        //            }
        //            background: Rectangle {
        //                x: 9
        //                y: 17
        //                width: 16
        //                height: 16
        //                radius: 2
        //                color: "white"
        //            }

        //            Rectangle {
        //                x: -4
        //                y: 10
        //                width: 200
        //                height: 30
        //                color: "transparent"
        //                border.color: "deeppink"
        //                border.width: 2
        //                radius: 10
        //            }
        //        }

        //        RecievedDataPart {
        //            id:recievedDataPart
        //            firstLable_xAxis: 790
        //            firstLable_yAxis: microPart.microROV_y
        //            spaceBetweenLablesY: 30
        //        }

        MaxSpeed {
            id: horizontalMaxSpeed
            borderX: 910
            borderY: microPart.microROV_y
            text: "Pilge Max Speed"
            from: 0
            to: 255
            value: 255
            stepSize: 10
            selectFunction: true
        }

        MaxSpeed {
            id: verticalMaxSpeed
            borderX: 910
            borderY: 215
            text: "T100 Max Speed"
            from: 100
            to: 500
            value: 400
            stepSize: 10
            selectFunction: false
        }

        MainDirection {
            mainDirection_X: 757
            mainDirection_Y: 376
        }

        ArmPart {
            buttons_x: 970
            buttons_y: 390
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.9;height:480;width:640}
}
##^##*/
