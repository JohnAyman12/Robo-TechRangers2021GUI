import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.15
import io.qt.examples.backend 1.0

Item {

    BackEnd {
        id: backend
    }

    property int axis0: backend.axis0
    property int axis1: backend.axis1
    property int axis2: backend.axis2
    property int axis3: backend.axis3
    property int axis4: backend.axis4
    property int axis5: backend.axis5
    property int name: backend.speed
    property int fields_xAxis
    property int firstField_yAxis
    property int spaceBetweenFAxises


    Axis {
        lableText: "axis 0"
        xAll: fields_xAxis
        yAll: firstField_yAxis + (spaceBetweenFAxises * 0)
        axisValue: axis0
    }

    Axis {
        lableText: "axis 1"
        xAll: fields_xAxis
        yAll: firstField_yAxis + (spaceBetweenFAxises * 1)
        axisValue: axis1
    }

    Axis {
        lableText: "axis 2"
        fieldWidth: 40
        xAll: fields_xAxis
        yAll: firstField_yAxis + (spaceBetweenFAxises * 2)
        axisValue: axis2
    }

    Axis {
        lableText: "axis 3"
        fieldWidth: 40
        xAll: fields_xAxis
        yAll: firstField_yAxis + (spaceBetweenFAxises * 3)
        axisValue: axis3
    }

    Axis {
        lableText: "axis 4"
        xAll: fields_xAxis
        yAll: firstField_yAxis + (spaceBetweenFAxises * 4)
        axisValue: axis4
    }

    Axis {
        lableText: "axis 5"
        xAll: fields_xAxis
        yAll: firstField_yAxis + (spaceBetweenFAxises * 5)
        axisValue: axis5
    }
}

/*##^##
    Designer {
        D{i:0;formeditorZoom:1.75}
    }
    ##^##*/
