import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.15
import io.qt.examples.backend 1.0

Item {
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

        AxisPart {
            fields_xAxis: 100
            firstField_yAxis: 100
            spaceBetweenFAxises: 50
        }

        ButtonPart {
            buttons_xAxis: 200
            firstButton_yAxis: 20
            spaceBetweenButtons: 45
        }

        MotorPart {
            fields_xAxis: 450
            firstField_yAxis: 0
            spaceBetweenMotorsX: 150
            spaceBetweenMotorsY: 150
        }

//        TextField {
//            text: backend.speed
//            placeholderText: "Maximum speed"
//            x:400
//            y:400
//            onEditingFinished: backend.speed = text
//        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.9;height:480;width:640}
}
##^##*/
