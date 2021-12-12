import QtQuick 2.0
import QtQuick.Window 2.12
import QtQuick.Controls 2.15

Item {
    property int borderX
    property int borderY

    Rectangle {
        id: speedMode
        x: borderX
        y: borderY
        width: 262
        height: 30
        color: "transparent"
        border.color: "deeppink"
        border.width: 2
        radius: 10
    }

    Label {
        id: mainLbl
        text: "Speed Mode"
        font.bold : true
        font.pixelSize: 20
        color: "white"
        x:speedMode.x + 50
        y:speedMode.y - 23
    }

    Image {
        id: imgPID
        x: mainLbl.x - 45
        y: mainLbl.y
        source: "images/speedMode.png"
        width: 42
        height: imgPID.width * 0.5
    }

    CheckBox {
        id: highSpeed
        x: speedMode.x + 6
        y: speedMode.y - 10
        text: "<font color=\"white\"><b>High Speed"
        checked: !backend.pnu4
        font.pixelSize: 17
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
        id: lowSpeed
        x: highSpeed.x + 123
        y: highSpeed.y
        text: "<font color=\"white\"><b>Low Speed"
        checked: backend.pnu4
        font.pixelSize: 17
        background: Rectangle {
            x: 9
            y: 17
            width: 16
            height: 16
            radius: 2
            color: "white"
        }
        onCheckStateChanged:
        {
            if(lowSpeed.checked){horizontalMaxSpeed.value = 150; verticalMaxSpeed.value = 250}
            else{horizontalMaxSpeed.value = 255; verticalMaxSpeed.value = 400}
        }
    }

}
