import QtQuick 2.12
import QtQuick.Controls 2.15
import io.qt.examples.backend 1.0

Item {
    property int borderX
    property int borderY

    //    SoundEffect {
    //        id: playSound
    //        source: "pip.wav"
    //        volume: 1.0
    //    }

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

    Rectangle{
        id: timerBorder
        x: borderX
        y: borderY
        color: "transparent"
        width: 255
        height: 95
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
        width: 35
        height: timerImg.width
    }

    Column{
        spacing: 5
        anchors.centerIn: timerBorder

        Label {
            id: timerLabel
            text: "Remaining time "+ timeMins + " : " + timeSecs
            color: "white"
            font.bold : true
            font.pixelSize: 20
            leftPadding: 8
        }

        Row{ // Timer Buttons
            id:timerButtons
            spacing: 10
            leftPadding: 2

            Button {
                id:startBtn
                text: "Start"
                onClicked:{
                    startBtn.text = "Continue"
                    if(timerBorder.width == 255)
                    {
                        timerBorder.width += 15
                        timerButtons.leftPadding -= 4
                        timerLabel.leftPadding += 2
                    }
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
                    if(timerBorder.width != 255)
                    {
                        timerBorder.width -= 15
                        timerButtons.leftPadding += 4
                        timerLabel.leftPadding -= 2
                    }
                    startBtn.enabled = true
                    pauseBtn.enabled = true
                    timeSecs = 0
                    timeMins = 15
                    timer.stop()
                }
            }
        }
    }

}
