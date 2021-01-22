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
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.9;height:480;width:640}
}
##^##*/
