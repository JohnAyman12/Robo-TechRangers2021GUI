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

        header: Label {
            text: qsTr("Main page")
            font.pixelSize: Qt.application.font.pixelSize * 2
            padding: 10
        }

        BackEnd {
            id:backend
        }

        ButtonPart {
            buttons_xAxis: 200
            firstButton_yAxis: 20
            spaceBetweenButtons: 45
        }

        MotorPart {
            firstDial_xAxis: 440
            firstDial_yAxis: 0
            spaceBetweenMotorsX: 150
            spaceBetweenMotorsY: 150
        }

        RecievedDataPart {
            firstLable_xAxis: 800
            firstLable_yAxis: 20
            spaceBetweenLablesY: 30
        }

        Label {
            id: maximumSpeedLable
            text: "Maximum speed"
            font.bold : true
            font.pixelSize: 18
            x:570
            y:260
        }

        SpinBox {
            editable: true
            x:maximumSpeedLable.x - 22
            y:maximumSpeedLable.y + 20
            to:255
            value: 255
            stepSize: 15
            onValueChanged:
            {
                backend.getMaxSpeed(value)
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.9;height:480;width:640}
}
##^##*/
