import QtQuick 2.12
import QtQuick.Controls 2.15
import io.qt.examples.backend 1.0

Item {
    property bool button0: backend.button0
    property int buttons_xAxis
    property int buttons_yAxis

    BackEnd {
        id: backend
    }

    // Buttons
    Row{
        x:buttons_xAxis
        y:buttons_yAxis

        Column {
            SwitchDelegate {
                id: button0ID
                checked: button0
                text: qsTr("button 0")
            }

            SwitchDelegate {
                id: button1
                checked: backend.button1
                text: qsTr("button 1")
            }

            SwitchDelegate {
                id: button2
                checked: backend.button2
                text: qsTr("button 2")
            }

            SwitchDelegate {
                id: button3
                checked: backend.button3
                text: qsTr("button 3")
            }

            SwitchDelegate {
                id: button4
                checked: backend.button4
                text: qsTr("button 4")
            }

            SwitchDelegate {
                id: button5
                checked: backend.button5
                text: qsTr("button 5")
            }
        }
        Column {
            SwitchDelegate {
                id: button6
                checked: backend.button6
                text: qsTr("button 6")
            }

            SwitchDelegate {
                id: button7
                checked: backend.button7
                text: qsTr("button 7")
            }

            SwitchDelegate {
                id: button8
                checked: backend.button8
                text: qsTr("button 8")
            }

            SwitchDelegate {
                id: button9
                checked: backend.button9
                text: qsTr("button 9")
            }

            SwitchDelegate {
                id: button10
                checked: backend.button10
                text: qsTr("button 10")
            }

            SwitchDelegate {
                id: button11
                checked: backend.button11
                text: qsTr("button 11")
            }
        }
    }
}
