import QtQuick 2.12
import QtQuick.Controls 2.15


ApplicationWindow {
    property int timeSecs: 0
    property int timeMins: 15

    id: mainWindow
    width: 1050
    height: 750
    visible: true
    title: qsTr("Robo-Tech Rangers 20/21")

    Shortcut {
        sequence: "esc"
        context: Qt.ApplicationShortcut
        onActivated: Qt.quit()
    }

    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        Page1 {}
        Page2 {}
        Page3 {}
        Page4 {}
    }

    Row{ // Timer
        spacing: 10
        x:450
        y:15

        Timer {
            id:timer
            triggeredOnStart: true
            repeat: true
            interval: 1000
            onTriggered: {
                if(timeSecs == 0) {
                    timeSecs = 59
                    timeMins -= 1
                }
                else {
                    timeSecs -= 1
                }
            }
        }

        Button {
            text: "Start"
            onClicked:{
                timer.start()
            }
        }

        Button {
            text: "Pause"
            onClicked:{
                timer.stop()
            }
        }

        Button {
            text: "Reset"
            onClicked:{
                timer.stop()
                timeSecs = 0
                timeMins = 15
            }
        }

        Label { // timer lable
            id: timerLabel
            text: "Remaining time "+ timeMins + " : " + timeSecs
            font.bold : true
            font.pixelSize: 20
            y: 13
        }
    }

    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex

        TabButton {
            text: qsTr("Main Page")
        }

        TabButton {
            text: qsTr("Mission Page")
        }

        TabButton {
            text: qsTr("Connection Page")
        }

        TabButton {
            text: qsTr("About us")
        }
    }
}
