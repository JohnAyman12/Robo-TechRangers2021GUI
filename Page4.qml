import QtQuick 2.0
import QtQuick.Window 2.12
import QtQuick.Controls 2.15
import io.qt.examples.backend 1.0
import QtMultimedia 5.5

import Qt3D.Core 2.15
import Qt3D.Render 2.15
import Qt3D.Input 2.15
import Qt3D.Logic 2.15
import Qt3D.Extras 2.15
import Qt3D.Animation 2.15
import QtQuick.Scene2D 2.15
import QtQuick.Scene3D 2.15

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
