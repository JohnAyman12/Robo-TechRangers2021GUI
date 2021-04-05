import QtQuick 2.12
import QtQuick.Controls 2.15
//import QtMultimedia 5.15

ApplicationWindow {
    property int timeSecs: 0
    property int timeMins: 15
    property int pointsCounter: 0

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

    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex

        TabButton {
            text: "<font color=\"white\">Main Page"
            Image {
                id: tab1Background
                source: "images/mainButton.jpeg"
                width: 322.75
                height: 48
            }
        }

        TabButton {
            text: qsTr("<font color=\"white\">Mission Page")
            Image {
                id: tab2Background
                source: "images/missionButton.jpeg"
                width: 322.75
                height: 48
            }
        }

        TabButton {
            text: qsTr("<font color=\"white\">Connection Page")
            Image {
                id: tab3Background
                source: "images/cenncetionButton.jpeg"
                width: 322.75
                height: 48
            }
        }

        TabButton {
            text: qsTr("<font color=\"white\">About us")
            Image {
                id: tab4Background
                source: "images/aboutButton.jpeg"
                width: 322.75
                height: 48
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
