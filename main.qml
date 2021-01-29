import QtQuick 2.12
import QtQuick.Controls 2.15

ApplicationWindow {
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

    Timer {
        interval: 1000;
        running: true;
        onTriggered: time.text = Date().toString()
    }

    Text { id: time }
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
