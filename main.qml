import QtQuick 2.12
import QtQuick.Controls 2.15
//import QtMultimedia 5.15

ApplicationWindow {
    property int timeSecs: 0
    property int timeMins: 15

    id: mainWindow
    width: 1500
    height: 750
    visible: true
    title: qsTr("Robo-Tech Rangers 20/21")
    color: "red"

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

    Rectangle{
        id: timerBorder
        x: 869
        y: 488
        color: "transparent"
        width: 240
        height: 80
        border.color: "deeppink"
        border.width: 2
        radius: 10
    }

    Column{
        spacing: 10
        anchors.centerIn: timerBorder

        Label { // timer lable
            id: timerLabel
            text: "Remaining time "+ timeMins + " : " + timeSecs
            font.bold : true
            font.pixelSize: 20
            //            color:"white"
        }

        Row{ // Timer
            spacing: 10

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
                    if(timerBorder.width == 240){timerBorder.width += 15}
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
                    if(timerBorder.width != 240){timerBorder.width -= 15}
                    startBtn.enabled = true
                    pauseBtn.enabled = true
                    timeSecs = 0
                    timeMins = 15
                    timer.stop()
                }
            }
        }
    }

    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex

        TabButton {
            text: qsTr("Main Page")
            onClicked:{
                if(timerBorder.x != 869)
                {
                    timerBorder.x -= 50;
                    timerBorder.y -= 50;
                }
            }
        }

        TabButton {
            text: qsTr("Mission Page")
            onClicked:{
                if(timerBorder.x == 869)
                {
                    timerBorder.x += 50;
                    timerBorder.y += 50;
                }
            }
        }

        TabButton {
            text: qsTr("Connection Page")
            onClicked:{
                if(timerBorder.x != 869)
                {
                    timerBorder.x -= 50;
                    timerBorder.y -= 50;
                }
            }
        }

        TabButton {
            text: qsTr("About us")
            onClicked:{
                if(timerBorder.x != 869)
                {
                    timerBorder.x -= 50;
                    timerBorder.y -= 50;
                }
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
