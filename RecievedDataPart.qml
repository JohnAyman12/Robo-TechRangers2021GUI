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
        dataValue: 40
        xAll: firstLable_xAxis
        yAll: firstLable_yAxis + (spaceBetweenLablesY * 0)
    }

    RecievedData {
        dataName: "Data 1"
        dataValue: 80
        xAll: firstLable_xAxis
        yAll: firstLable_yAxis + (spaceBetweenLablesY * 1)
    }

    RecievedData {
        dataName: "Data 2"
        dataValue: 120
        xAll: firstLable_xAxis
        yAll: firstLable_yAxis + (spaceBetweenLablesY * 2)
    }

    RecievedData {
        dataName: "Data 3"
        dataValue: 160
        xAll: firstLable_xAxis
        yAll: firstLable_yAxis + (spaceBetweenLablesY * 3)
    }

    RecievedData {
        dataName: "Data 4"
        dataValue: 200
        xAll: firstLable_xAxis
        yAll: firstLable_yAxis + (spaceBetweenLablesY * 4)
    }

    RecievedData {
        dataName: "Data 5"
        dataValue: 240
        xAll: firstLable_xAxis
        yAll: firstLable_yAxis + (spaceBetweenLablesY * 5)
    }
}
