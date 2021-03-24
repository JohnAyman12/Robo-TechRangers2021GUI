import QtQuick 2.0
import QtQuick.Window 2.12
import QtQuick.Controls 2.15
import io.qt.examples.backend 1.0

Item {
    Page {
        id:connectionPage
        width: mainWindow.width
        height: mainWindow.height

        header: Label {
            text: qsTr("Connection page")
            font.pixelSize: Qt.application.font.pixelSize * 2
            padding: 10
        }
        AxisPart {
            id: axisPart
            fields_xAxis: 500
            firstField_yAxis: 140
            spaceBetweenAxises: 50
        }

        ButtonPart {
            buttons_x: axisPart.fields_xAxis + 100
            buttons_y: axisPart.firstField_yAxis - 120
        }
    }
}
