import QtQuick 2.12
import QtQuick.Controls 2.15
//import QtMultimedia 5.15

ApplicationWindow {
    property int timeSecs: 0
    property int timeMins: 15

    id: mainWindow
    width: 1200
    height: 750
    //    height: 500
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

    Rectangle{
        id: timerBorder
        x: 869
        y: 488
        color: "transparent"
        width: 255
        height: 95
        border.color: "deeppink"
        border.width: 2
        radius: 10
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
            }
            else {
                timeSecs -= 1
                //                    playSound.play()
            }
        }
    }

    Column{
        spacing: 5
        anchors.centerIn: timerBorder

        Row{ // timer lable anf icon
            spacing: 5

            Label {
                id: timerLabel
                text: "Remaining time "+ timeMins + " : " + timeSecs
                color: "white"
                font.bold : true
                font.pixelSize: 20
            }

            Image {
                id: name
                source: "images/timer.png"
                width: 30
                height: 30
            }
        }

        Row{ // Timer
            id:timerButtons
            spacing: 10
            leftPadding: 10

            Button {
                id:startBtn
                text: "Start"
                onClicked:{
                    startBtn.text = "Continue"
                    if(timerBorder.width == 255)
                    {
                        timerBorder.width += 15
                        timerButtons.leftPadding -= 4
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

    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex

        TabButton {
            text: "<font color=\"white\">Main Page"
            Image {
                id: tab1Background
                source: "images/mainTab.jpg"
                width: 322.75
                height: 48
            }
            onClicked:{
                if(timerBorder.x != 869)
                {
                    timerBorder.x -= 50;
                    timerBorder.y -= 50;
                }
            }
        }

        TabButton {
            text: qsTr("<font color=\"white\">Mission Page")
            Image {
                id: tab2Background
                source: "images/missionsTab.jpg"
                width: 322.75
                height: 48
            }
            onClicked:{
                if(timerBorder.x == 869)
                {
                    timerBorder.x += 50;
                    timerBorder.y += 50;
                }
            }
        }

        TabButton {
            text: qsTr("<font color=\"white\">Connection Page")
            Image {
                id: tab3Background
                source: "images/connectionTab.jpg"
                width: 322.75
                height: 48
            }
            onClicked:{
                if(timerBorder.x != 869)
                {
                    timerBorder.x -= 50;
                    timerBorder.y -= 50;
                }
            }
        }

        TabButton {
            text: qsTr("<font color=\"white\">About us")
            Image {
                id: tab4Background
                source: "images/black.jpg"
                width: 322.75
                height: 48
            }
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
