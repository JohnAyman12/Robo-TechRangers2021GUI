import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Item {
    property bool task3Visibilty: false
    property double musselsNumber: 0
    property double filteredWater: 0

    visible: task3Visibilty

    Label {
        text: "Task 3"
        font.bold : true
        font.pixelSize: 20
        color: textColor
        x: 20
        y: 10
    }

    Column{
        x: 25
        y: 40

        CheckBox {
            text: "<font color=\"white\">Creating a photomosaic of a subway car submerged to create an artificial
reef"
            font.pixelSize: 17
            onCheckStateChanged:
            {
                if (checkState != 0) {pointsCounter += 20}
                else if (checkState == 0) {pointsCounter -= 20}
            }
            background: Rectangle {
                x: 9
                y: 17
                width: 16
                height: 16
                radius: 2
                color: "white"
            }
        }

        Label {
            text: "Sediment sample:"
            font.bold : true
            font.pixelSize: 18
            color: textColor
        }

        CheckBox {
            text: "<font color=\"white\">Deploying a device into the pipe to collect a sediment sample"
            font.pixelSize: 17
            onCheckStateChanged:
            {
                if (checkState != 0) {pointsCounter += 25}
                else if (checkState == 0) {pointsCounter -= 25}
            }
            background: Rectangle {
                x: 9
                y: 17
                width: 16
                height: 16
                radius: 2
                color: "white"
            }
        }

        CheckBox {
            text: "<font color=\"white\">Returning the sample to the surface"
            font.pixelSize: 17
            onCheckStateChanged:
            {
                if (checkState != 0) {pointsCounter += 10}
                else if (checkState == 0) {pointsCounter -= 10}
            }
            background: Rectangle {
                x: 9
                y: 17
                width: 16
                height: 16
                radius: 2
                color: "white"
            }
        }

        CheckBox {
            text: "<font color=\"white\">Determining the type of contaminant(s) present in the sediment sample"
            font.pixelSize: 17
            onCheckStateChanged:
            {
                if (checkState != 0) {pointsCounter += 5}
                else if (checkState == 0) {pointsCounter -= 5}
            }
            background: Rectangle {
                x: 9
                y: 17
                width: 16
                height: 16
                radius: 2
                color: "white"
            }
        }

        Label {
            text: "Mussel bed:"
            font.bold : true
            font.pixelSize: 18
            color: textColor
        }

        CheckBox {
            text: "<font color=\"white\">Deploying a quadrat and counting the number of mussels in the quadrat"
            font.pixelSize: 17
            onCheckStateChanged:
            {
                if (checkState != 0) {pointsCounter += 5}
                else if (checkState == 0) {pointsCounter -= 5}
            }
            background: Rectangle {
                x: 9
                y: 17
                width: 16
                height: 16
                radius: 2
                color: "white"
            }
        }

        CheckBox {
            id: musselCheck
            text: "<font color=\"white\">Estimating the number of mussels and the total amount of water filtered
by the mussel bed"
            font.pixelSize: 17
            onCheckStateChanged:
            {
                if (checkState != 0) {pointsCounter += 5}
                else if (checkState == 0) {pointsCounter -= 5}
            }
            background: Rectangle {
                x: 9
                y: 17
                width: 16
                height: 16
                radius: 2
                color: "white"
            }
        }

        Row {
            spacing: 8

            Label {
                id: mainText
                text: "<i>Mussels counted</i>"
                font.pixelSize: 16
                color: textColor
            }

            TextField {
                id:mussleField
                y: -5
                inputMethodHints: Qt.ImhDigitsOnly
                horizontalAlignment: Text.AlignHCenter
                width: 60
                enabled: musselCheck.checkState
                placeholderText: "Mussel"
                background: Rectangle {
                    implicitWidth: 220
                    implicitHeight: 20
                    radius: 2
                }
            }

            Label {
                text: "<i>bed height</i>"
                font.pixelSize: mainText.font.pixelSize
                color: textColor
            }

            TextField {
                id:heightField
                y: -5
                inputMethodHints: Qt.ImhDigitsOnly
                horizontalAlignment: Text.AlignHCenter
                width: 60
                font.pixelSize: 18
                enabled: musselCheck.checkState
                placeholderText: "Height"
                background: Rectangle {
                    implicitWidth: 220
                    implicitHeight: 20
                    radius: 2
                }
            }

            Label {
                text: "<i>bed width</i>"
                color: textColor
                font.pixelSize: mainText.font.pixelSize
            }

            TextField {
                id:widthField
                y: -5
                inputMethodHints: Qt.ImhDigitsOnly
                horizontalAlignment: Text.AlignHCenter
                width: 60
                font.pixelSize: 18
                enabled: musselCheck.checkState
                placeholderText: "Width"
                background: Rectangle {
                    implicitWidth: 220
                    implicitHeight: 20
                    radius: 2
                }
            }

            Label {
                text: "Mussels number " + musselsNumber
                color: textColor
                font.pixelSize: 18
                font.bold : true
            }

            Label {
                text: "<i>Filtration rate</i>"
                color: textColor
                font.pixelSize: mainText.font.pixelSize
            }

            TextField {
                id:filtrationField
                y: -5
                inputMethodHints: Qt.ImhDigitsOnly
                horizontalAlignment: Text.AlignHCenter
                width: 60
                font.pixelSize: 18
                enabled: musselCheck.checkState
                placeholderText: "Rate"
                background: Rectangle {
                    implicitWidth: 220
                    implicitHeight: 20
                    radius: 2
                }
            }

            Label {
                text: "Filtration rate " + Math.round(filteredWater)
                color: textColor
                font.pixelSize: 18
                font.bold : true
            }

            Button {
                y: -10
                text: "Calculate"
                onClicked: {
                    var mussle = mussleField.text
                    var area = widthField.text * heightField.text
                    var filtrationRate = filtrationField.text
                    area /= 0.25
                    musselsNumber =   area * mussle
                    filteredWater = musselsNumber * filtrationRate
                }
            }
        }

        Label {
            text: "Eel restoration:"
            font.bold : true
            font.pixelSize: 18
            color: textColor
        }

        CheckBox {
            text: "<font color=\"white\">Removing a trap full of eels from a designated area"
            font.pixelSize: 17
            onCheckStateChanged:
            {
                if (checkState != 0) {pointsCounter += 10}
                else if (checkState == 0) {pointsCounter -= 10}
            }
            background: Rectangle {
                x: 9
                y: 17
                width: 16
                height: 16
                radius: 2
                color: "white"
            }
        }

        CheckBox {
            text: "<font color=\"white\">Placing an empty eel trap in a designated area"
            font.pixelSize: 17
            onCheckStateChanged:
            {
                if (checkState != 0) {pointsCounter += 10}
                else if (checkState == 0) {pointsCounter -= 10}
            }
            background: Rectangle {
                x: 9
                y: 17
                width: 16
                height: 16
                radius: 2
                color: "white"
            }
        }
    }
}
