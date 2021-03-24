import QtQuick 2.12
import QtQuick.Controls 2.15
import io.qt.examples.backend 1.0

Item {
    property int buttons_x
    property int buttons_y

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
                text: qsTr("button 0")
            }

            SwitchDelegate {
                id: button1ID
                checked: backend.button1
                text: qsTr("button 1")
            }

            SwitchDelegate {
                id: button2ID
                checked: backend.button2
                text: qsTr("button 2")
            }

            SwitchDelegate {
                id: button3ID
                checked: backend.button3
                text: qsTr("button 3")
            }

            SwitchDelegate {
                id: button4ID
                checked: backend.button4
                text: qsTr("button 4")
            }

            SwitchDelegate {
                id: button5ID
                checked: backend.button5
                text: qsTr("button 5")
            }
        }
        Column {
            SwitchDelegate {
                id: button6ID
                checked: backend.button6
                text: qsTr("button 6")
            }

            SwitchDelegate {
                id: button7ID
                checked: backend.button7
                text: qsTr("button 7")
            }

            SwitchDelegate {
                id: button8ID
                checked: backend.button8
                text: qsTr("button 8")
            }

            SwitchDelegate {
                id: button9ID
                checked: backend.button9
                text: qsTr("button 9")
            }

            SwitchDelegate {
                id: button10ID
                checked: backend.button10
                text: qsTr("button 10")
            }

            SwitchDelegate {
                id: button11ID
                checked: backend.button11
                text: qsTr("button 11")
            }
        }
    }
}
