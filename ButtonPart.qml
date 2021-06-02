import QtQuick 2.12
import QtQuick.Controls 2.15

Item {
    property int buttons_x
    property int buttons_y
    property color textColor

    Rectangle{
        id: buttonsBorder
        x:buttons_x
        y:buttons_y
        color: "transparent"
        width: 312
        height: 334
        border.color: "deeppink"
        border.width: 2
        radius: 10
    }

    Label{
        id: btnLbl
        text: "Buttons"
        font.bold : true
        font.pixelSize: 20
        color: "white"
        x:buttons_x + 42
        y:buttons_y - 24
    }

    Image {
        id: button
        x: btnLbl.x - 98
        y: btnLbl.y - 82
        source: "images/button.png"
        width: 150
        height:button.width
    }

    // Buttons
    Row{
        x:buttons_x
        y:buttons_y

        Column {

            SwitchDelegate {
                id: button0ID
                checked: backend.button0
                text: "<font color=\"white\">Button 0<font>"
                font.bold: true
            }

            SwitchDelegate {
                id: button1ID
                checked: backend.button1
                text: "<font color=\"white\">Button 1<font>"
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
                checked: backend.button5
                text: "<font color=\"white\">Button 5<font>"
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

            SwitchDelegate {
                id: button12ID
                x: -1 * ((buttonsBorder.width / 2) - (button12ID.width / 2))
                checked: backend.button12
                text: "<font color=\"white\">Button 12<font>"
                font.bold: true
            }
        }
    }
}
