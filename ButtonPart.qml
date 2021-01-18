import QtQuick 2.12
import QtQuick.Controls 2.15
import io.qt.examples.backend 1.0

Item {

    BackEnd {
        id: backend
    }

    property int buttons_xAxis
    property int firstButton_yAxis
    property int spaceBetweenButtons

    // Buttons

    SwitchDelegate {
        id: button0
        x: buttons_xAxis
        y: firstButton_yAxis + (spaceBetweenButtons * 0)
        checked: backend.button0
        text: qsTr("button 0")
    }

    SwitchDelegate {
        id: button1
        x: buttons_xAxis
        y: firstButton_yAxis + (spaceBetweenButtons * 1)
        checked: backend.button1
        text: qsTr("button 1")
    }

    SwitchDelegate {
        id: button2
        x: buttons_xAxis
        y: firstButton_yAxis + (spaceBetweenButtons * 2)
        checked: backend.button2
        text: qsTr("button 2")
    }

    SwitchDelegate {
        id: button3
        x: buttons_xAxis
        y: firstButton_yAxis + (spaceBetweenButtons * 3)
        checked: backend.button3
        text: qsTr("button 3")
    }

    SwitchDelegate {
        id: button4
        x: buttons_xAxis
        y: firstButton_yAxis + (spaceBetweenButtons * 4)
        checked: backend.button4
        text: qsTr("button 4")
    }

    SwitchDelegate {
        id: button5
        x: buttons_xAxis
        y: firstButton_yAxis + (spaceBetweenButtons * 5)
        checked: backend.button5
        text: qsTr("button 5")
    }

    SwitchDelegate {
        id: button6
        x: buttons_xAxis
        y: firstButton_yAxis + (spaceBetweenButtons * 6)
        checked: backend.button6
        text: qsTr("button 6")
    }

    SwitchDelegate {
        id: button7
        x: buttons_xAxis
        y: firstButton_yAxis + (spaceBetweenButtons * 7)
        checked: backend.button7
        text: qsTr("button 7")
    }

    SwitchDelegate {
        id: button8
        x: buttons_xAxis
        y: firstButton_yAxis + (spaceBetweenButtons * 8)
        checked: backend.button8
        text: qsTr("button 8")
    }

    SwitchDelegate {
        id: button9
        x: buttons_xAxis
        y: firstButton_yAxis + (spaceBetweenButtons * 9)
        checked: backend.button9
        text: qsTr("button 9")
    }

    SwitchDelegate {
        id: button10
        x: buttons_xAxis - 5
        y: firstButton_yAxis + (spaceBetweenButtons * 10)
        checked: backend.button10
        text: qsTr("button 10")
    }

    SwitchDelegate {
        id: button11
        x: buttons_xAxis - 5
        y: firstButton_yAxis + (spaceBetweenButtons * 11)
        checked: backend.button11
        text: qsTr("button 11")
    }
}
