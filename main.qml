import QtQuick 2.12
import QtQuick.Controls 2.15

ApplicationWindow {
    id: mainWindow
    width: 740
    height: 760
    visible: true
    title: qsTr("Robo-Tech Rangers 20/21")

    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        Page1 {
        }

        Page2 {
        }
    }

    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex

        TabButton {
            text: qsTr("Main Page")
        }

        TabButton {
            text: qsTr("another Page")
        }
    }
}
