import QtQuick 2.12
import QtQuick.Controls 2.15

Item {
    property int buttons_x
    property int buttons_y
    property color textColor
    property int armDC: backend.DC_arm
    property int armDirDC: backend.DC_armDir
    property int armPneumatic: backend.pnu5

    Rectangle{
        id: buttonsBorder
        x:buttons_x
        y:buttons_y
        color: "transparent"
        width: 205
        height: 175
        border.color: "deeppink"
        border.width: 2
        radius: 10
    }

    Label{
        id:armsLbl
        text: "Arms & Flashes"
        font.bold : true
        font.pixelSize: 20
        color: "white"
        x:buttons_x + 40
        y:buttons_y - 24
    }

    Image {
        id: arm
        x:armsLbl.x - 42
        y:armsLbl.y - 20
        source: "images/arm.png"
        width: 42
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
            id: eelTrap
            checked: backend.pnu1
            text: "<font color=\"white\">Eel Trap force<font>"
            font.bold: true
        }
    }

    Label {
        id:pneumaticArmLbl
        x: buttons_x + 16
        y: buttons_y + 100
        text: "Penumatic Arm: "
        color: "white"
        font.pixelSize: 16
        font.bold: true
    }

    Image {
        id: pneumaticArm
        source: if (armPneumatic == 0) {"images/closed.png";}
                else if (armPneumatic == 1){"images/opened.png";}
        width: 50
        height: pneumaticArm.width
        anchors.centerIn: pneumaticArmLbl
        anchors.horizontalCenterOffset: 90
        onSourceChanged: if (armPneumatic == 0) {pneumaticArm.width = 50;}
                         else if (armPneumatic == 1){pneumaticArm.width = 80;}
    }


    Row{
        x: buttons_x
        y: buttons_y + 144
        spacing: 5
        leftPadding: 18

        Label {
            text: "DC Arm: "
            color: "white"
            font.pixelSize: 16
            font.bold: true
        }

        Image {
            source: if (armDC == 0) {"images/hold.png"}
                    else if (armDirDC == 0){"images/clockwise.jpeg"}
                    else if (armDirDC == 1){"images/anticlockwise.png"}
            width: 25
            height: 25
            y: -4
        }

        Label {
            text: if (armDC == 0) {""}
                  else if (armDirDC == 0){"Opening"}
                  else if (armDirDC == 1){"Closing"}
            color: "white"
            font.pixelSize: 16
            font.bold: true
        }
    }
}

