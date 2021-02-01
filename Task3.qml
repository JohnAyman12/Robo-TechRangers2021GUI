import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import io.qt.examples.backend 1.0

Item {
    property bool task3Visibilty: false
    property double filteredWater: 0

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
            color: "black"
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

        Row {
            spacing: 8


            Label {
                text: "<i>mussels counted</i>"
                font.pixelSize: 18
            }

            TextField {
                id:mussleField
                y: -5
                inputMethodHints: Qt.ImhDigitsOnly
                horizontalAlignment: Text.AlignHCenter
                width: 50
            }

            Label {
                text: "mussel bed <i>height</i>"
                font.pixelSize: 18
            }

             TextField {
                 id:heightField
                 y: -5
                 inputMethodHints: Qt.ImhDigitsOnly
                 horizontalAlignment: Text.AlignHCenter
                 width: 50
             }

             Label {
                 text: "mussel bed <i>width</i>"
                 font.pixelSize: 18
             }

              TextField {
                  id:widthField
                  y: -5
                  inputMethodHints: Qt.ImhDigitsOnly
                  horizontalAlignment: Text.AlignHCenter
                  width: 50
              }

              Label {
                  text: "<i>filtration rate</i>"
                  font.pixelSize: 18
              }

               TextField {
                   id:filtrationField
                   y: -5
                   inputMethodHints: Qt.ImhDigitsOnly
                   horizontalAlignment: Text.AlignHCenter
                   width: 50
               }

               Button {
                   y: -10
                   text: "calculate"
                   onClicked: {
                       var mussle = mussleField.text
                       var area = widthField.text * heightField.text
                       area /= 0.25
                       var filtration = filtrationField.text
                       filteredWater =  area * mussle * filtration
                   }
               }

               Label {
                   text: "filtration rate " + filteredWater
                   font.pixelSize: 18
                   font.bold : true
               }
        }

        Label {
            text: "Eel restoration:"
            font.bold : true
            font.pixelSize: 18
            color: "black"
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
