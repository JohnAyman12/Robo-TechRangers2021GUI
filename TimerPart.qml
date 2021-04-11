import QtQuick 2.12
import QtQuick.Controls 2.15
import QtMultimedia 5.15
import io.qt.examples.backend 1.0

Item {
    property int borderX
    property int borderY


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
                startBtn.enabled = false
                pauseBtn.enabled = false
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
        width: 179.5
        height: 230
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
        x: borderX + 15
        y: borderY + 6
        text: "Remaining time\n          "+ timeMins + " : " + timeSecs
        color: "white"
        font.bold : true
        font.pixelSize: 20
    }

    Button {
        anchors.centerIn: timerBorder
        anchors.verticalCenterOffset: -37
        id:startBtn
        text: "Start"
        onClicked:{
            startBtn.text = "Continue"
            timer.start()
        }
    }

    Column{
        spacing: 2
        anchors.centerIn: timerBorder
        anchors.verticalCenterOffset: 38

        Button {
            id:pauseBtn
            text: "Pause"
            onClicked:{
                timer.stop()
                playSound.play()
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
    }

    CheckBox {
        id:soundState
        anchors.centerIn: timerBorder
        anchors.verticalCenterOffset: 100
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
