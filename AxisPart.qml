import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.15
import io.qt.examples.backend 1.0
//import ":/items"

Item {

    BackEnd {
        id: backend
    }

    property int axis0: backend.pureAxis0
    property int axis1: backend.pureAxis1
    property int axis2: backend.pureAxis2
    property int axis3: backend.pureAxis3
    property int axis4: backend.pureAxis4
    property int axis5: backend.pureAxis5
    property int fields_xAxis
    property int firstField_yAxis
    property int spaceBetweenAxises


    Rectangle{
        id: axisBorder
        x:fields_xAxis - 58
        y:firstField_yAxis
        color: "transparent"
        width: 150
        height: 290
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
        x: axisBorder.x + 5
        y: axisBorder.y - 26
    }

    Image {
        id: axis
        x: axisLbl.x + 65
        y: axisLbl.y - 25
        source: "images/axis.png"
        width: 50
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
}

/*##^##
    Designer {
        D{i:0;formeditorZoom:1.75}
    }
    ##^##*/

