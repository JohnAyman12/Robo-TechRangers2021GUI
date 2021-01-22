import QtQuick 2.0
import QtQuick.Controls 2.15
import QtQuick.Controls.Styles 1.4

Item {
    id:item
    property string dataName
    property int dataValue
    property int xAll
    property int yAll
    property bool lableVisible: false

    Label {// data name
        text: item.dataName
        font.bold: true
        font.pixelSize: 18
        color: "black"
        x: item.xAll
        y: item.yAll
    }

    ProgressBar {// data value
        from: 0
        to: 255
        value: item.dataValue
        x: item.xAll + 70
        y: item.yAll + 10
    }

    Label {// data value
        text: item.dataValue
        font.bold: true
        font.pixelSize: 18
        color: "black"
        x: item.xAll + 280
        y: item.yAll
        visible: item.lableVisible
    }

}
