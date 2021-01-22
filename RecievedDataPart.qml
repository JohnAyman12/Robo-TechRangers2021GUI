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

    RecievedData {
        dataName: "Data 0"
        dataValue: 0
        xAll: firstLable_xAxis
        yAll: firstLable_yAxis + (spaceBetweenLablesY * 0)
    }

    RecievedData {
        dataName: "Data 1"
        dataValue: 20
        xAll: firstLable_xAxis
        yAll: firstLable_yAxis + (spaceBetweenLablesY * 1)
    }

    RecievedData {
        dataName: "Data 2"
        dataValue: 40
        xAll: firstLable_xAxis
        yAll: firstLable_yAxis + (spaceBetweenLablesY * 2)
    }

    RecievedData {
        dataName: "Data 3"
        dataValue: 60
        xAll: firstLable_xAxis
        yAll: firstLable_yAxis + (spaceBetweenLablesY * 3)
    }

    RecievedData {
        dataName: "Data 4"
        dataValue: backend.axis3
        xAll: firstLable_xAxis
        yAll: firstLable_yAxis + (spaceBetweenLablesY * 4)
    }

    RecievedData {
        dataName: "Current"
        dataValue: current
        xAll: firstLable_xAxis
        yAll: firstLable_yAxis + (spaceBetweenLablesY * 5)
        lableVisible: true
    }

    SpinBox {
        to:255
        value: 255
        stepSize: 10
        onValueChanged:
        {
            backend.getMaxSpeed(value)
        }
    }
}
