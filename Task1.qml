import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import io.qt.examples.backend 1.0

Item {
    property int firstCheckBoxY: 60
    property int spaceBetweenChackBoxes: 40
    property int pointsCounter: 0

    Label {
        text: pointsCounter
        font.bold : true
        font.pixelSize: 20
        color: "black"
        x: 500
        y: 10
    }

    Label {
        text: "Task 1"
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
            text: "Seabin:"
            font.bold : true
            font.pixelSize: 18
            color: "black"
        }

        CheckBox {
            text: "Disconnecting the old power connector to the recently installed Seabin"
            font.pixelSize: 17
            onCheckStateChanged:
            {
                if (checkState != 0) {pointsCounter += 5}
                else if (checkState == 0) {pointsCounter -= 5}
            }
        }

        CheckBox {
            text: "Removing a previously installed Seabin’s mesh catch bag"
            font.pixelSize: 17
            onCheckStateChanged:
            {
                if (checkState != 0) {pointsCounter += 10}
                else if (checkState == 0) {pointsCounter -= 10}
            }
        }

        CheckBox {
            text: "Installing a new mesh catch bag into the Seabin"
            font.pixelSize: 17
            onCheckStateChanged:
            {
                if (checkState != 0) {pointsCounter += 10}
                else if (checkState == 0) {pointsCounter -= 10}
            }
        }

        CheckBox {
            text: "Reconnecting a new power connector to the recently installed Seabin"
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
            color: "black"
        }
        Row{
            CheckBox {
                id: platicDerbis1
                text: "Removing floating plastic debris from the surface"
                font.pixelSize: 17
            }

            SpinBox {
                to: 6
                width: 140
                onValueModified:
                {
                    if (not(platicDerbis1.checkState == 0))
                    {
                        if (not(value == 0))
                        {
                            if (value == 6) {pointsCounter += 15}
                            else if (value <= 2) {pointsCounter += 5}
                            else if (value <= 5) {pointsCounter += 10}
                        }
                    }
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
            CheckBox {
                id: platicDerbis2
                text: "Removing plastic debris from the bottom of the Mariana Trench"
                font.pixelSize: 17
            }

            SpinBox {
                to: 2
                width: 140
                onValueModified:
                {
                    if (not(platicDerbis2.checkState == 0))
                    {
                        if (not(value == 0))
                        {
                            if (value == 6) {pointsCounter += 15}
                            else if (value <= 2) {pointsCounter += 5}
                            else if (value <= 5) {pointsCounter += 10}
                        }
                    }
                }
            }
        }
    }

}
