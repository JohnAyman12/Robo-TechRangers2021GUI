import QtQuick 2.12
import QtQuick.Controls 2.15
import io.qt.examples.backend 1.0

Item {
    property int buttons_x
    property int buttons_y
    property color textColor

    BackEnd {
        id: backend
    }

    Rectangle{
        id: buttonsBorder
        x:buttons_x
        y:buttons_y
        color: "transparent"
        width: 205
        height: 192
        border.color: "deeppink"
        border.width: 2
        radius: 10
    }

    Label{
        id:armsLbl
        text: "Arms &\nCameras"
        font.bold : true
        font.pixelSize: 20
        color: "white"
        x:buttons_x + 5
        y:buttons_y - 48
    }

    Image {
        id: arm
        x:armsLbl.x + 70
        y:armsLbl.y - 22
        source: "images/arm.png"
        width: 70
        height:arm.width
    }

    // Buttons
    Row{
        x:buttons_x
        y:buttons_y

        Column {

            SwitchDelegate {
                id: button0ID
                checked: backend.pnu0
                text: "<font color=\"white\">Front Camera<font>"
                font.bold: true
            }

            SwitchDelegate {
                id: button1ID
                checked: backend.pnu1
                text: "<font color=\"white\">Bottom Camera<font>"
                font.bold: true
            }

            SwitchDelegate {
                id: button5ID
                checked: backend.pnu5
                text: "<font color=\"white\">Pnumatic Arm<font>"
                font.bold: true
            }

            SwitchDelegate {
                id: button6ID
                checked: backend.button6
                text: "<font color=\"white\">DC Arm<font>"
                font.bold: true
            }
        }
    }
}
