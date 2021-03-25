import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import io.qt.examples.backend 1.0

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
            text: "Creating a photomosaic of a subway car submerged to create an artificial reef"
            font.pixelSize: 17
            onCheckStateChanged:
            {
                if (checkState != 0) {pointsCounter += 10}
                else if (checkState == 0) {pointsCounter -= 10}
            }
        }

        Label {
            text: "Sediment sample:"
            font.bold : true
            font.pixelSize: 18
            color: textColor
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
            text: "Determining the type of contaminant(s) present in the sediment sample"
            font.pixelSize: 17
            onCheckStateChanged:
            {
                if (checkState != 0) {pointsCounter += 5}
                else if (checkState == 0) {pointsCounter -= 5}
            }
        }

        Label {
            text: "Mussel bed:"
            font.bold : true
            font.pixelSize: 18
            color: textColor
        }

        CheckBox {
            text: "Deploying a quadrat and counting the number of mussels in the quadrat"
            font.pixelSize: 17
            onCheckStateChanged:
            {
                if (checkState != 0) {pointsCounter += 10}
                else if (checkState == 0) {pointsCounter -= 10}
            }
        }

        CheckBox {
            text: "Estimating the number of mussels and the total amount of water filtered by the mussel bed"
            font.pixelSize: 17
            onCheckStateChanged:
            {
                if (checkState != 0) {pointsCounter += 10}
                else if (checkState == 0) {pointsCounter -= 10}
            }
        }
        //        Column {
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
                color: textColor
                inputMethodHints: Qt.ImhDigitsOnly
                horizontalAlignment: Text.AlignHCenter
                width: 50
            }

            Label {
                text: "<i>Mussel bed height</i>"
                font.pixelSize: mainText.font.pixelSize
                color: textColor
            }

            TextField {
                id:heightField
                y: -5
                color: textColor
                inputMethodHints: Qt.ImhDigitsOnly
                horizontalAlignment: Text.AlignHCenter
                width: 50
            }

            Label {
                text: "<i>Mussel bed width</i>"
                color: textColor
                font.pixelSize: mainText.font.pixelSize
            }

            TextField {
                id:widthField
                y: -5
                color: textColor
                inputMethodHints: Qt.ImhDigitsOnly
                horizontalAlignment: Text.AlignHCenter
                width: 50
            }

            Label {
                text: "Mussels number " + musselsNumber
                color: textColor
                font.pixelSize: mainText.font.pixelSize
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
                color: textColor
                inputMethodHints: Qt.ImhDigitsOnly
                horizontalAlignment: Text.AlignHCenter
                width: 50
            }

            Label {
                text: "Filtration rate " + Math.round(filteredWater)
                color: textColor
                font.pixelSize: 18
                font.bold : true
            }

            Button {
                y: -10
                text: "Number of mussels"
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
        //    }

        Label {
            text: "Eel restoration:"
            font.bold : true
            font.pixelSize: 18
            color: textColor
        }

        CheckBox {
            text: "Removing a trap full of eels from a designated area"
            font.pixelSize: 17
            onCheckStateChanged:
            {
                if (checkState != 0) {pointsCounter += 10}
                else if (checkState == 0) {pointsCounter -= 10}
            }
        }

        CheckBox {
            text: "Placing an empty eel trap in a designated area"
            font.pixelSize: 17
            onCheckStateChanged:
            {
                if (checkState != 0) {pointsCounter += 10}
                else if (checkState == 0) {pointsCounter -= 10}
            }
        }
    }
}
