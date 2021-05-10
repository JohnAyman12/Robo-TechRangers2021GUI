import QtQuick 2.0
import QtQuick.Window 2.12
import QtQuick.Controls 2.15


Item {

    Rectangle{
        id: maxSpeedBorder
        x: 120
        y: 466
        color: "transparent"
        width: 264
        height: 95
        border.color: "deeppink"
        border.width: 2
        radius: 10
    }

    Column {
        id: column // maximum speed spinbox
        spacing: 5
        x: maxSpeedBorder.x + 48
        y: maxSpeedBorder.y + 7

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
            value: 220
            stepSize: 15
            x: maximumSpeedLable.x - 25
            font.bold: true
            enabled: !flyTransect
            onValueChanged: {backend.getMaxSpeed(value)}
            background: Rectangle {
                implicitWidth: 220
                implicitHeight: 20
                radius: 2
            }
        }
    }

}
