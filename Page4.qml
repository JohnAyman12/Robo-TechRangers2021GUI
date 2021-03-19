import QtQuick 2.0
import QtQuick.Window 2.12
import QtQuick.Controls 2.15
import io.qt.examples.backend 1.0
import QtMultimedia 5.5

Item {
    Page {
        id:aboutPage
        width: mainWindow.width
        height: mainWindow.height

        header: Label {
            text: qsTr("About us")
            font.pixelSize: Qt.application.font.pixelSize * 2
            padding: 10
        }
    }
}
