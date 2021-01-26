import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.15
import io.qt.examples.backend 1.0

Item {

    property int pointsCounter: 0

    Page {
        id:missionPage
        width: mainWindow.width
        height: mainWindow.height

        header: Label {
            text: qsTr("Missoin page")
            font.pixelSize: Qt.application.font.pixelSize * 2
            padding: 10
        }

        Label {
            id: points
            text:"Total points: " + pointsCounter
            font.bold : true
            font.pixelSize: 20
            color: "black"
            x:1070
            y:13
        }

        Row {
            x: 500

            RadioButton {
                id: task1CheckBox
                checked: true
                text: "Task 1"
                font.bold : true
                font.pixelSize: 20
                onCheckedChanged:
                {
                    if(task1CheckBox.checked)
                    {
                        task1.task1Visibilty = true
                        task2.task2Visibilty = false
                        task3.task3Visibilty = false
                    }
                }
            }

            RadioButton {
                id: task2CheckBox
                text: "Task 2"
                font.bold : true
                font.pixelSize: 20
                onCheckedChanged:
                {
                    if(task2CheckBox.checked)
                    {
                        task1.task1Visibilty = false
                        task2.task2Visibilty = true
                        task3.task3Visibilty = false
                    }
                }
            }

            RadioButton {
                id: task3CheckBox
                text: "Task 3"
                font.bold : true
                font.pixelSize: 20
                onCheckedChanged:
                {
                    if(task3CheckBox.checked)
                    {
                        task1.task1Visibilty = false
                        task2.task2Visibilty = false
                        task3.task3Visibilty = true
                    }
                }
            }
        }

        Task1 {id: task1}
        Task2 {id: task2}
        Task3 {id: task3}
    }
}

