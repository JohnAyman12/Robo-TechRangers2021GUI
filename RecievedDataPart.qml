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
        width: 383
        height: 248
        border.color: "deeppink"
        border.width: 2
        radius: 10
    }

    Label{
        id: sensorsLbl
        text: "Sensors"
        font.bold : true
        font.pixelSize: 20
        color: "white"
        x: firstLable_xAxis + 5
        y: firstLable_yAxis - 30
    }

    Image {
        id: sensorsImg
        x: sensorsLbl.x + 70
        y: sensorsLbl.y - 33
        source: "images/sensors.png"
        width: 75
        height: sensorsImg.width
    }

    RecievedData {
        dataName: "Tempreature"
        dataValue: 20
        xAll: dataBorder.x + 10
        yAll: dataBorder.y + (spaceBetweenLablesY * 0.4)
    }

    RecievedData {
        dataName: "Humidity"
        dataValue: 0
        xAll: dataBorder.x + 10
        yAll: dataBorder.y + (spaceBetweenLablesY * 1.4)
        dataNameX: 17
    }

    RecievedData {
        dataName: "X-axis"
        dataValue: 90
        xAll: dataBorder.x + 10
        yAll: dataBorder.y + (spaceBetweenLablesY * 2.4)
        dataNameX: 27
    }

    RecievedData {
        dataName: "Y-axis"
        dataValue: 0
        xAll: dataBorder.x + 10
        yAll: dataBorder.y + (spaceBetweenLablesY * 3.4)
        dataNameX: 27
    }

    RecievedData {
        dataName: "Z-axis"
        dataValue: 0
        xAll: dataBorder.x + 10
        yAll: dataBorder.y + (spaceBetweenLablesY * 4.4)
        dataNameX: 27
    }

    Column {
        id: column // maximum speed spinbox
        spacing: 5
        x: firstLable_xAxis + 112
        y: firstLable_yAxis + (spaceBetweenLablesY * 5.2)

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
