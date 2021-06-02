import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.15

Item {
    property color textColor: "white"

    Page {
        id:missionPage
        width: mainWindow.width
        height: mainWindow.height

        header:
            Image {
            id: headerBackground
            source: "images/about.jpeg"
            width: 800
            height: 60
            Label {
                text: qsTr("Missoin page")
                color: textColor
                font.pixelSize: Qt.application.font.pixelSize * 2
                padding: 10
            }

            Label {
                id: timerLabel
                text: "Remaining time\n          "+ timeMins + " : " + timeSecs
                color: "white"
                font.bold : true
                font.pixelSize: 20
                x: 1120
                y: 10
            }
        }

        Image {
            id: background
            source: "images/black.jpg"
            width: 1500
            height: 750
        }

        Label {
            id: points
            text:"Total points: " + pointsCounter
            font.bold : true
            font.pixelSize: 20
            color: textColor
            x:1070
            y:13
        }

        Row {
            x: 500

            RadioButton {
                id: task1CheckBox
                checked: true
                text: "<font color=\"white\">Task 1"
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
                background: Rectangle {
                    x: 9
                    y: 17
                    width: 17
                    height: 17
                    radius: 60
                    color: "white"
                }
            }

            RadioButton {
                id: task2CheckBox
                text: "<font color=\"white\">Task 2"
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
                background: Rectangle {
                    x: 9
                    y: 17
                    width: 17
                    height: 17
                    radius: 60
                    color: "white"
                }
            }

            RadioButton {
                id: task3CheckBox
                text: "<font color=\"white\">Task 3"
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
                background: Rectangle {
                    x: 9
                    y: 17
                    width: 17
                    height: 17
                    radius: 60
                    color: "white"
                }
            }
        }

        Task1 {id: task1}
        Task2 {id: task2}
        Task3 {id: task3}
    }
}

