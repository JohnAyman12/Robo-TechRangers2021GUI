import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.15
//import ":/items"

Item {

    property int axis0: backend.pureAxis0
    property int axis1: backend.pureAxis1
    property int axis2: backend.pureAxis2
    property int axis3: backend.pureAxis3
    property int axis4: backend.pureAxis4
    property int axis5: backend.pureAxis5
    property int axis6: backend.pureAxis6
    property int axis7: backend.pureAxis7
    property int fields_xAxis
    property int firstField_yAxis
    property int spaceBetweenAxises


    Rectangle{
        id: axisBorder
        x:fields_xAxis - 58
        y:firstField_yAxis
        color: "transparent"
        width: 150
        height: 386
        border.color: "deeppink"
        border.width: 2
        radius: 10
    }

    Label{
        id: axisLbl
        text: "Axises"
        font.bold : true
        font.pixelSize: 20
        color: "white"
        x: axisBorder.x + 42
        y: axisBorder.y - 24
    }

    Image {
        id: axis
        x: axisLbl.x - 38
        y: axisLbl.y - 14
        source: "images/axis.png"
        width: 35
        height:axis.width
    }

    Axis {
        lableText: "axis 0"
        xAll: fields_xAxis
        yAll: firstField_yAxis + (spaceBetweenAxises * 0)
        axisValue: axis0
    }

    Axis {
        lableText: "axis 1"
        xAll: fields_xAxis
        yAll: firstField_yAxis + (spaceBetweenAxises * 1)
        axisValue: axis1
    }

    Axis {
        lableText: "axis 2"
        xAll: fields_xAxis
        yAll: firstField_yAxis + (spaceBetweenAxises * 2)
        axisValue: axis2
    }

    Axis {
        lableText: "axis 3"
        xAll: fields_xAxis
        yAll: firstField_yAxis + (spaceBetweenAxises * 3)
        axisValue: axis3
    }

    Axis {
        lableText: "axis 4"
        xAll: fields_xAxis
        yAll: firstField_yAxis + (spaceBetweenAxises * 4)
        axisValue: axis4
    }

    Axis {
        lableText: "axis 5"
        xAll: fields_xAxis
        yAll: firstField_yAxis + (spaceBetweenAxises * 5)
        axisValue: axis5
    }

    Axis {
        lableText: "axis 6"
        xAll: fields_xAxis
        yAll: firstField_yAxis + (spaceBetweenAxises * 6)
        axisValue: axis6
    }

    Axis {
        lableText: "axis 7"
        xAll: fields_xAxis
        yAll: firstField_yAxis + (spaceBetweenAxises * 7)
        axisValue: axis7
    }
}

/*##^##
    Designer {
        D{i:0;formeditorZoom:1.75}
    }
    ##^##*/

