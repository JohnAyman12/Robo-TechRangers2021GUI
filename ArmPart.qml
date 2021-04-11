import QtQuick 2.12
import QtQuick.Controls 2.15
import io.qt.examples.backend 1.0

Item {
    property int buttons_x
    property int buttons_y
    property color textColor
    property int armDC: backend.DC_arm
    property int armDirDC: backend.DC_armDir

    BackEnd {
        id: backend
    }

    Rectangle{
        id: buttonsBorder
        x:buttons_x
        y:buttons_y
        color: "transparent"
        width: 205
        height: 230
        border.color: "deeppink"
        border.width: 2
        radius: 10
    }

    Label{
        id:armsLbl
        text: "Arms & Cameras"
        font.bold : true
        font.pixelSize: 20
        color: "white"
        x:buttons_x + 40
        y:buttons_y - 24
    }

    Image {
        id: arm
        x:armsLbl.x - 42
        y:armsLbl.y - 25
        source: "images/arm.png"
        width: 46
        height:arm.width
    }

    Column {
        x:buttons_x
        y:buttons_y - 5

        SwitchDelegate {
            id: frontCamer
            checked: backend.pnu2
            text: "<font color=\"white\">Front Camera<font>"
            font.bold: true
        }

        SwitchDelegate {
            id: bottomCamera
            checked: backend.pnu1
            text: "<font color=\"white\">Bottom Camera<font>"
            font.bold: true
        }

        SwitchDelegate {
            id: microCamera
            checked: backend.pnu0
            text: "<font color=\"white\">Micro Camera<font>"
            font.bold: true
        }

        SwitchDelegate {
            id: penumaticArm
            checked: (backend.pnu5 && !flyTransect)
            enabled: !flyTransect
            text: "<font color=\"white\">Pneumatic Arm<font>"
            font.bold: true
            onCheckedChanged: {console.log(armDC)}
        }

        Row{
            spacing: 5
            leftPadding: 18

            Label {
                text: "DC Arm: "
                color: "white"
                font.pixelSize: 15
                font.bold: true
            }

            Image {
                source: if (armDC == 0) {"images/hold.png"}
                        else if (armDirDC == 0){"images/clockwise.jpeg"}
                        else if (armDirDC == 1){"images/anticlockwise.png"}
                width: 25
                height: 25
            }
        }
    }
}
