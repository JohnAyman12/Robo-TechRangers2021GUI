import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import io.qt.examples.backend 1.0

Item {
    property int firstCheckBoxY: 60
    property int spaceBetweenChackBoxes: 40
    property int plasticDerbis1Value: 0
    property int plasticDerbis2Value: 0
    property bool task1Visibilty: true

    visible: task1Visibilty


    Label {
        text: "Task 1"
        font.bold : true
        font.pixelSize: 20
        color: textColor
        x: 20
        y: 10
    }

    Column{
        x: 25
        y: 40

        Label {
            text: "Seabin:"
            font.bold : true
            font.pixelSize: 18
            color: textColor
        }

        CheckBox {
            text: "<font color=\"white\">Disconnecting the old power connector to the recently installed Seabin</font>"
            font.pixelSize: 17
            onCheckStateChanged:
            {
                if (checkState != 0) {pointsCounter += 5}
                else if (checkState == 0) {pointsCounter -= 5}
            }
        }

        CheckBox {
            text: "<font color=\"white\">Removing a previously installed Seabin’s mesh catch bag</font>"
            font.pixelSize: 17
            onCheckStateChanged:
            {
                if (checkState != 0) {pointsCounter += 10}
                else if (checkState == 0) {pointsCounter -= 10}
            }
        }

        CheckBox {
            text: "<font color=\"white\">Installing a new mesh catch bag into the Seabin</font>"
            font.pixelSize: 17
            onCheckStateChanged:
            {
                if (checkState != 0) {pointsCounter += 10}
                else if (checkState == 0) {pointsCounter -= 10}
            }
        }

        CheckBox {
            text: "<font color=\"white\">Reconnecting a new power connector to the recently installed Seabin</font>"
            font.pixelSize: 17
            onCheckStateChanged:
            {
                if (checkState != 0) {pointsCounter += 20}
                else if (checkState == 0) {pointsCounter -= 20}
            }
        }
    }

    Column {
        x: 620
        y: 40
        spacing: 0.5

        Label {
            text: "Remediation:"
            font.bold : true
            font.pixelSize: 18
            color: textColor
        }
        Row{
            Label {
                id: plasticDerbisCheckBox1
                text: "Removing floating plastic debris from the surface"
                color: textColor
                font.pixelSize: 17
                y: 18
            }

            SpinBox {
                id: plasticDerbisSpinBox1
                to: 6
                width: 140
                onValueChanged:
                {
                    pointsCounter -= plasticDerbis1Value
                    var curretValue = plasticDerbisSpinBox1.value
                    var finalValue = 0
                    if(curretValue === 0){finalValue = 0}
                    else if(curretValue === 1 || curretValue === 2)
                    {finalValue = 5}
                    else if(curretValue === 3 || curretValue === 4 || curretValue === 5)
                    {finalValue = 10}
                    else if(curretValue === 6)
                    {finalValue = 15}
                    pointsCounter += finalValue
                    plasticDerbis1Value = finalValue

                }
            }
        }

        CheckBox {
            text: "<font color=\"white\">Pulling a pin to simulate cutting the ghost net free</font>"
            font.pixelSize: 17
            onCheckStateChanged:
            {
                if (checkState != 0) {pointsCounter += 10}
                else if (checkState == 0) {pointsCounter -= 10}
            }
        }

        CheckBox {
            text: "<font color=\"white\">Removing the ghost net from the water</font>"
            font.pixelSize: 17
            onCheckStateChanged:
            {
                if (checkState != 0) {pointsCounter += 10}
                else if (checkState == 0) {pointsCounter -= 10}
            }
        }


        Row{
            Label {
                id: plasticDerbisCheckBox2
                text: "<font color=\"white\">Removing plastic debris from the bottom of the Mariana Trench<font>"
                color: textColor
                font.pixelSize: 17
                y: 16
            }

            SpinBox {
                id: plasticDerbisSpinBox2
                to: 2
                width: 140
                onValueChanged:
                {
                    pointsCounter -= plasticDerbis2Value
                    var curretValue = plasticDerbisSpinBox2.value
                    var finalValue = 0
                    if(curretValue === 0){finalValue = 0}
                    else if(curretValue === 1){finalValue = 5}
                    else if(curretValue === 2){finalValue = 10}
                    pointsCounter += finalValue
                    plasticDerbis2Value = finalValue
                }
            }
        }
    }

}
