import QtQuick 2.0
import QtQuick.Controls 2.15

Item {
    id: item
    property int borderX
    property int borderY
    property string text
    property int from
    property int to
    property int value
    property int stepSize
    property bool selectFunction

    Rectangle{
        id: maxSpeedBorder
        x: item.borderX
        y: item.borderY
        color: "transparent"
        width: 264
        height: 95
        border.color: "deeppink"
        border.width: 2
        radius: 10
    }

//    Column {
//        spacing: 5
//        x: maxSpeedBorder.x + 22
//        y: maxSpeedBorder.y + 7

        Label {
            text: item.text
            color:"white"
            font.bold : true
            font.pixelSize: 18
            anchors.centerIn: maxSpeedBorder
            anchors.verticalCenterOffset: -30
        }

        SpinBox {
            id: spinBox
            editable: true
            from: item.from
            to: item.to
            value: item.value
            stepSize: item.stepSize
            font.bold: true
            onValueChanged:
            {
                if(item.selectFunction){backend.getPilgeMaxSpeed(spinBox.value)}
                else{backend.getT100MaxSpeed(spinBox.value)}
            }
            background: Rectangle {
                implicitWidth: 220
                implicitHeight: 20
                radius: 2
            }
            anchors.centerIn: maxSpeedBorder
            anchors.verticalCenterOffset: 10
        }
    }
//}
