import QtQuick 2.12
import QtQuick.Controls 2.15
//import QtMultimedia 5.15

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

//    SoundEffect {
//        id: playSound
//        source: "pip.wav"
//        volume: 1.0
//    }

    Row{ // Timer
        spacing: 10
        x:450
        y:15

        Timer {
            id:timer
            repeat: true
            interval: 1000
            triggeredOnStart : true
            onTriggered: {
                if(timeMins == 0 && timeSecs == 0) {
                    timer.stop()
                    startBtn.enabled = false
                    pauseBtn.enabled = false
                }
                else if(timeSecs == 0) {
                    timeSecs = 59
                    timeMins -= 1
                }
                else {
                    timeSecs -= 1
//                    playSound.play()
                }
            }
        }

        Button {
            id:startBtn
            text: "Start"
            onClicked:{
                startBtn.text = "Continue"
                timer.start()
            }
        }

        Button {
            id:pauseBtn
            text: "Pause"
            onClicked:{
                timer.stop()
            }
        }

        Button {
            id:resetBtn
            text: "Reset"
            onClicked:{
                startBtn.text = "Start"
                startBtn.enabled = true
                pauseBtn.enabled = true
                timeSecs = 0
                timeMins = 15
                timer.stop()
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
