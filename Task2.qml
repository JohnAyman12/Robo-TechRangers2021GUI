import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Item {
    property int coralFragmentsSpinBox1Value: 0
    property int coralAutonomouslyComboBox1: 0
    property int coralFragmentsSpinBox2Value: 0
    property int crownComboBox1: 0
    property int flyTransactValue: 0
    property bool task2Visibilty: false

    visible: task2Visibilty

    Label {
        text: "Task 2"
        font.bold : true
        font.pixelSize: 20
        color: textColor
        x: 20
        y: 10
    }

    Column{
        x: 25
        y: 40

        Row {
            y: 15
            spacing: 10

            Label {
                text: "Flying a transect line over a coral reef and mapping points of interest"
                color: textColor
                font.pixelSize: 17
                y: 14
            }

            ComboBox {
                id:flyTransact
                width: 200
                model: ["None", "Manually", "Autonomously"]
                onCurrentIndexChanged:
                {
                    pointsCounter -= flyTransactValue
                    var currentValue = currentIndex
                    var finalValue = 0
                    if(currentValue === 0){finalValue = 0}
                    else if(currentValue === 1){finalValue = 10}
                    else if(currentValue === 2){finalValue = 20}
                    pointsCounter += finalValue
                    flyTransactValue = finalValue
                }
            }
        }

        CheckBox {
            text: "<font color=\"white\">Mapping points of interest on the reef"
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

        Row{
            y:15
            spacing: 10

            Label {
                text: "determine the health of a coral colony by comparing its current condition to past data"
                color: textColor
                font.pixelSize: 17
                y: 14
            }

            CheckBox {
                id:coralColonyAutonomously
                font.pixelSize: 17
                text: "<font color=\"white\">Autonomously"
                onCheckStateChanged:
                {
                    if(coralColonyAutonomously.checkState === 0 && coralAutonomouslyComboBox1 !== 0)
                    {
                        coralAutonomouslyComboBox.currentIndex =  0
                        pointsCounter -= coralAutonomouslyComboBotruex1
                        coralAutonomouslyComboBox1 = 0
                    }
                    else if(coralColonyAutonomously.checkState !== 0 && coralColonyManually.checkState !== 0)
                    {
                        coralColonyManually.checkState = 0
                        pointsCounter -= 10
                    }
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

            ComboBox {
                id:coralAutonomouslyComboBox
                width: 200
                font.pixelSize: 17
                model: ["None", "not all but at least 1", "All areas"]
                visible: coralColonyAutonomously.checkState
                onCurrentIndexChanged:
                {
                    if(coralColonyManually.checkState === 0){
                        pointsCounter -= coralAutonomouslyComboBox1
                        var currentValue = currentIndex
                        var finalValue = 0
                        if(currentValue === 0){finalValue = 0}
                        else if(currentValue === 1){finalValue = 10}
                        else if(currentValue === 2){finalValue = 20}
                        pointsCounter += finalValue
                        coralAutonomouslyComboBox1 = finalValue
                    }
                }
            }

            CheckBox{
                id:coralColonyManually
                font.pixelSize: 17
                text: "<font color=\"white\">Manually"
                visible: !coralColonyAutonomously.checkState
                onCheckStateChanged:
                {
                    if(coralColonyAutonomously.checkState === 0){
                        if (checkState != 0){pointsCounter += 10}
                        else if (checkState == 0){pointsCounter -= 10}
                    }
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

        Row{
            spacing:5

            Label {
                id: coralFragmentsCheckBox1
                text: "Removing coral fragments from the nursery structure"
                color: textColor
                font.pixelSize: 17
                y: 16
            }

            SpinBox {
                id: coralFragmentsSpinBox1
                to: 2
                width: 140
                onValueChanged:
                {
                    pointsCounter -= coralFragmentsSpinBox1Value
                    var curretValue = coralFragmentsSpinBox1.value
                    var finalValue = 0
                    if(curretValue === 0){finalValue = 0}
                    else if(curretValue === 1){finalValue = 5}
                    else if(curretValue === 2){finalValue = 10}
                    pointsCounter += finalValue
                    coralFragmentsSpinBox1Value = finalValue
                }
                background: Rectangle {
                    width: 140
                    height: 30
                    y:9
                    radius: 2
                }
            }
        }

        Row{
            spacing: 5

            Label {
                id: coralFragmentsCheckBox2
                text: "Outplanting coral fragments to designated locations on the reef"
                color: textColor
                font.pixelSize: 17
                y: 16
            }

            SpinBox {
                id: coralFragmentsSpinBox2
                to: 2
                width: 140
                onValueChanged:
                {
                    pointsCounter -= coralFragmentsSpinBox2Value
                    var curretValue = coralFragmentsSpinBox2.value
                    var finalValue = 0
                    if(curretValue === 0){finalValue = 0}
                    else if(curretValue === 1){finalValue = 5}
                    else if(curretValue === 2){finalValue = 10}
                    pointsCounter += finalValue
                    coralFragmentsSpinBox2Value = finalValue
                }
                background: Rectangle {
                    width: 140
                    height: 30
                    y:9
                    radius: 2
                }
            }
        }

        Row{
            spacing: 5

            Label {
                id: crownCheckBox2
                text: "<font color=\"white\">Culling an outbreak of Crown of Thorn sea stars"
                color: textColor
                font.pixelSize: 17
                y: 16
            }

            SpinBox {
                id: crownSpinBox2
                to: 2
                width: 140
                onValueChanged:
                {
                    pointsCounter -= crownComboBox1
                    var curretValue = crownSpinBox2.value
                    var finalValue = 0
                    if(curretValue === 0){finalValue = 0}
                    else if(curretValue === 1){finalValue = 5}
                    else if(curretValue === 2){finalValue = 10}
                    pointsCounter += finalValue
                    crownComboBox1 = finalValue
                }
                background: Rectangle {
                    width: 140
                    height: 30
                    y:9
                    radius: 2
                }
            }
        }

        CheckBox {
            text: "<font color=\"white\">Collecting a sample of the sponge"
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
            text: "<font color=\"white\">Returning the sample to the surface"
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

    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
