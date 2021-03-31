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
        width: 300
        height: 290
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
        x:buttons_x + 5
        y:buttons_y - 24
    }

    Image {
        id: arm
        x:armsLbl.x + 142
        y:armsLbl.y - 46
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
                text: "<font color=\"white\">Pilote<font>"
                font.bold: true
            }

            SwitchDelegate {
                id: button1ID
                checked: backend.pnu1
                text: "<font color=\"white\">Image<font>"
                font.bold: true
            }

            SwitchDelegate {
                id: button2ID
                checked: backend.button2
                text: "<font color=\"white\">button 2<font>"
                font.bold: true
            }

            SwitchDelegate {
                id: button3ID
                checked: backend.button3
                text: "<font color=\"white\">Button 3<font>"
                font.bold: true
            }

            SwitchDelegate {
                id: button4ID
                checked: backend.button4
                text: "<font color=\"white\">Button 4<font>"
                font.bold: true
            }

            SwitchDelegate {
                id: button5ID
                checked: backend.pnu5
                text: "<font color=\"white\">Pnumatic<font>"
                font.bold: true
            }
        }
        Column {
            SwitchDelegate {
                id: button6ID
                checked: backend.button6
                text: "<font color=\"white\">Button 6<font>"
                font.bold: true
            }

            SwitchDelegate {
                id: button7ID
                checked: backend.button7
                text: "<font color=\"white\">Button 7<font>"
                font.bold: true
            }

            SwitchDelegate {
                id: button8ID
                checked: backend.button8
                text: "<font color=\"white\">Button 8<font>"
                font.bold: true
            }

            SwitchDelegate {
                id: button9ID
                checked: backend.button9
                text: "<font color=\"white\">Button 9<font>"
                font.bold: true
            }

            SwitchDelegate {
                id: button10ID
                checked: backend.button10
                text: "<font color=\"white\">Button 10<font>"
                font.bold: true
            }

            SwitchDelegate {
                id: button11ID
                checked: backend.button11
                text: "<font color=\"white\">Button 11<font>"
                font.bold: true
            }
        }
    }
}
