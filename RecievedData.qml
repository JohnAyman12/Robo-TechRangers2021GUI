import QtQuick 2.0
import QtQuick.Controls 2.15
import QtQuick.Controls.Styles 1.4

Item {
    id:item
    property string dataName
    property double dataValue
    property int xAll
    property int yAll
    property int dataNameX : 0

    Label {// data name
        text: item.dataName
        font.bold: true
        font.pixelSize: 18
        color: "white"
        x: item.xAll + dataNameX
        y: item.yAll
    }

    ProgressBar {// data value
        from: 0
        to: 100
        value: item.dataValue
        x: item.xAll + 120
        y: item.yAll + 10
    }

    Label {// data value
        text: item.dataValue
        font.bold: true
        font.pixelSize: 18
        color: "white"
        x: item.xAll + 330
        y: item.yAll
    }

}
