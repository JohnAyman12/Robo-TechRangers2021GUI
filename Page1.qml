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
            buttons_yAxis: 130
        }

        MotorPart {
            id:motorPart
            firstDial_xAxis: 530
            firstDial_yAxis: 45
            spaceBetweenMotorsX: 150
            spaceBetweenMotorsY: 150
        }

        RecievedDataPart {
            id:recievedDataPart
            firstLable_xAxis: 820
            firstLable_yAxis: 180
            spaceBetweenLablesY: 30
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.9;height:480;width:640}
}
##^##*/
