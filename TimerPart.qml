import QtQuick 2.12
import QtQuick.Controls 2.15
import QtMultimedia 5.15

Item {
    property int borderX
    property int borderY
    property bool started: false

    Audio {
        id: playSound
        source: "/sounds/pip.wav"
    }

    Timer {
        id:timer
        repeat: true
        interval: 1000
        triggeredOnStart : true
        onTriggered: {
            if(timeMins == 0 && timeSecs == 0) {
                timer.stop()
            }
            else if(timeSecs == 0) {
                timeSecs = 59
                timeMins -= 1
                if (soundState.checkState)
                {
                    playSound.play()
                }
            }
            else {
                timeSecs -= 1
            }
        }
    }

    Rectangle{
        id: timerBorder
        x: borderX
        y: borderY
        color: "transparent"
        width: 245
        height: 120
        border.color: "deeppink"
        border.width: 2
        radius: 10
    }

    Label{
        id:timerLbl
        text: "Timer"
        font.bold : true
        font.pixelSize: 20
        color: "white"
        x: borderX + 34
        y: borderY - 24
    }

    Image {
        id: timerImg
        x: timerLbl.x - 34
        y: timerLbl.y - 11
        source: "images/timer.png"
        width: 33
        height: timerImg.width
    }

    Label {
        id: timerLabel
        anchors.centerIn: timerBorder
        anchors.verticalCenterOffset: -35
        text: "Remaining time\n          "+ timeMins + " : " + timeSecs
        color: "white"
        font.bold : true
        font.pixelSize: 20
    }

    Row {
        spacing: 5
        anchors.centerIn: timerBorder
        anchors.verticalCenterOffset: 10

        Button {
            id:startBtn
            text: "Start"
            onClicked:{
                timer.start()
                if(timer.running){started = true}
                else{started = false}
            }
        }

        Button {
            id:pauseBtn
            text: "Pause"
            onClicked:{
                if(timer.running)
                {
                    timer.stop()
                    pauseBtn.text = "Continue"
                    started = true
                }
                else if(/*timer.running && */started)
                {
                    timer.start()
                    pauseBtn.text = "Pause"
                    started = false
                }
            }
        }

        Button {
            id:resetBtn
            text: "Reset"
            onClicked:{
                startBtn.enabled = true
                pauseBtn.text = "Pause"
                pauseBtn.enabled = true
                started = false
                timeSecs = 0
                timeMins = 15
                timer.stop()
            }
        }
    }

    CheckBox {
        id:soundState
        anchors.centerIn: timerBorder
        anchors.verticalCenterOffset: 45
        text: "<font color=\"white\"><b>Sound"
        font.pixelSize: 17
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
