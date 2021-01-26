import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import io.qt.examples.backend 1.0

Item {
    property bool task3Visibilty: false

    visible: task3Visibilty

    Label {
        text: "Task 3"
        font.bold : true
        font.pixelSize: 20
        color: "black"
        x: 20
        y: 10
    }

    Column{
        x: 25
        y: 40

        Label {
            text: "sediment sample:"
            font.bold : true
            font.pixelSize: 18
            color: "black"
        }

        CheckBox {
            text: "Deploying a device into the pipe to collect a sediment sample"
            font.pixelSize: 17
            onCheckStateChanged:
            {
                if (checkState != 0) {pointsCounter += 25}
                else if (checkState == 0) {pointsCounter -= 25}
            }
        }

        CheckBox {
            text: "Returning the sample to the surface"
            font.pixelSize: 17
            onCheckStateChanged:
            {
                if (checkState != 0) {pointsCounter += 10}
                else if (checkState == 0) {pointsCounter -= 10}
            }
        }

        CheckBox {
            text: "IDetermining the type of contaminant(s) present in the sediment sample"
            font.pixelSize: 17
            onCheckStateChanged:
            {
                if (checkState != 0) {pointsCounter += 5}
                else if (checkState == 0) {pointsCounter -= 5}
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
            color: "black"
        }
        Row{
            Label {
                id: plasticDerbisCheckBox1
                text: "Removing floating plastic debris from the surface"
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
            text: "Pulling a pin to simulate cutting the ghost net free"
            font.pixelSize: 17
            onCheckStateChanged:
            {
                if (checkState != 0) {pointsCounter += 10}
                else if (checkState == 0) {pointsCounter -= 10}
            }
        }

        CheckBox {
            text: "Removing the ghost net from the water"
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
                text: "Removing plastic debris from the bottom of the Mariana Trench"
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
