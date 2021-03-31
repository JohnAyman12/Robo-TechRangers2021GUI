import QtQuick 2.0
import QtQuick.Controls 2.15
import io.qt.examples.backend 1.0


Item {

    BackEnd {
        id: backend
    }

    property int firstLable_xAxis
    property int firstLable_yAxis
    property int spaceBetweenLablesX
    property int spaceBetweenLablesY

    Rectangle{
        id:dataBorder
        x: firstLable_xAxis
        y: firstLable_yAxis
        color: "transparent"
        width: 333
        height: 270
        border.color: "deeppink"
        border.width: 2
        radius: 10
    }

    RecievedData {
        dataName: "Data 0"
        dataValue: 40
        xAll: dataBorder.x + 10
        yAll: dataBorder.y + (spaceBetweenLablesY * 0.4)
    }

    RecievedData {
        dataName: "Data 1"
        dataValue: 80
        xAll: dataBorder.x + 10
        yAll: dataBorder.y + (spaceBetweenLablesY * 1.4)
    }

    RecievedData {
        dataName: "Data 2"
        dataValue: 120
        xAll: dataBorder.x + 10
        yAll: dataBorder.y + (spaceBetweenLablesY * 2.4)
    }

    RecievedData {
        dataName: "Data 3"
        dataValue: 160
        xAll: dataBorder.x + 10
        yAll: dataBorder.y + (spaceBetweenLablesY * 3.4)
    }

    RecievedData {
        dataName: "Data 4"
        dataValue: 200
        xAll: dataBorder.x + 10
        yAll: dataBorder.y + (spaceBetweenLablesY * 4.4)
    }

    RecievedData {
        dataName: "Data 5"
        dataValue: 240
        xAll: dataBorder.x + 10
        yAll: dataBorder.y + (spaceBetweenLablesY * 5.4)
    }

    Column {
        id: column // maximum speed spinbox
        spacing: 5
        x: firstLable_xAxis + 87
        y: firstLable_yAxis + (spaceBetweenLablesY * 6.2)

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
            onValueChanged: {backend.getMaxSpeed(value)}
            background: Rectangle {
                implicitWidth: 220
                implicitHeight: 20
                radius: 2
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
