import QtQuick 2.0
import QtQuick.Controls 2.15


Item {
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
        height: 168
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
        x: firstLable_xAxis + 38
        y: firstLable_yAxis - 24
    }

    Image {
        id: sensorsImg
        x: sensorsLbl.x - 34
        y: sensorsLbl.y - 10
        source: "images/sensors.jpeg"
        width: 32
        height: sensorsImg.width
    }

    RecievedData {
        dataName: "Tempreature"
        dataValue: backend.tempreature
        xAll: dataBorder.x + 10
        yAll: dataBorder.y + (spaceBetweenLablesY * 0.4)
    }

    RecievedData {
        dataName: "Humidity"
        dataValue: backend.humidity
        xAll: dataBorder.x + 10
        yAll: dataBorder.y + (spaceBetweenLablesY * 1.4)
        dataNameX: 17
    }

    RecievedData {
        dataName: "X-axis"
        dataValue: Math.round(backend.yaw * 100) / 100
        xAll: dataBorder.x + 10
        yAll: dataBorder.y + (spaceBetweenLablesY * 2.4)
        dataNameX: 27
    }

    RecievedData {
        dataName: "Y-axis"
        dataValue: Math.round(backend.pitch * 100) / 100
        xAll: dataBorder.x + 10
        yAll: dataBorder.y + (spaceBetweenLablesY * 3.4)
        dataNameX: 27
    }

    RecievedData {
        dataName: "Z-axis"
        dataValue: Math.round(backend.roll * 100) / 100
        xAll: dataBorder.x + 10
        yAll: dataBorder.y + (spaceBetweenLablesY * 4.4)
        dataNameX: 27
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
