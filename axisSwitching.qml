import QtQuick 2.0
import QtQuick.Window 2.12
import QtQuick.Controls 2.15
import io.qt.examples.backend 1.0

Item {
    property int borderX
    property int borderY

    Rectangle {
        id: axis3Mode
        x: 478
        y: 538
        width: 248.5
        height: 30
        color: "transparent"
        border.color: "deeppink"
        border.width: 2
        radius: 10
    }

    Label {
        id: mainLbl
        text: "Axis 3 Mode"
        font.bold : true
        font.pixelSize: 20
        color: "white"
        x:axis3Mode.x + 50
        y:axis3Mode.y - 26
    }

    CheckBox {
        id: axis3SwitchingToPitch
        x: axis3Mode.x + 6
        y: axis3Mode.y - 10
        text: "<font color=\"white\"><b>Roll mode"
        font.pixelSize: 17
        checked: backend.axis3Mode
        background: Rectangle {
            x: 9
            y: 17
            width: 16
            height: 16
            radius: 2
            color: "white"
        }
    }

    CheckBox {
        id: axis3SwitchingToDC
        x: axis3SwitchingToPitch.x + 123
        y: axis3SwitchingToPitch.y
        text: "<font color=\"white\"><b>DC mode"
        font.pixelSize: 17
        checked: !backend.axis3Mode
        background: Rectangle {
            x: 9
            y: 17
            width: 16
            height: 16
            radius: 2
            color: "white"
        }
    }

}
