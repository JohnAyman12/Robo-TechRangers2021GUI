import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.15
import io.qt.examples.backend 1.0

Item {
    Page {
        id:missionPage
        width: mainWindow.width
        height: mainWindow.height

        header: Label {
            text: qsTr("Missoin page")
            font.pixelSize: Qt.application.font.pixelSize * 2
            padding: 10
        }
        Task1 {}
    }
}
