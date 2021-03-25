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
        x:buttons_x
        y:buttons_y
        color: "transparent"
        width: 300
        height: 290
        border.color: "deeppink"
        border.width: 2
        radius: 10
    }

    // Buttons
    Row{
        x:buttons_x
        y:buttons_y
        Column {
            SwitchDelegate {
                id: button0ID
                checked: backend.pnu0
                text: "<font color=\"white\">Button 0<font>"
                font.bold: true
//                Component.onCompleted: this.color = 'white'
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
                text: "<font color=\"white\">Button 2<font>"
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
        }
    }
}
