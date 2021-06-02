import QtQuick 2.12
import QtQuick.Controls 2.15

Item {
    id: axis
    property string lableText
    property string axisValue
    property int xAll
    property int yAll

    TextField {
        text: axis.axisValue
        width: 80
        horizontalAlignment: Text.AlignHCenter
        readOnly : true
        color: "white"
        x:axis.xAll
        y:axis.yAll
    }

    Label {
        text: axis.lableText
        font.bold : true
        font.pixelSize: 15
        color: "white"
        x:axis.xAll - 45
        y:axis.yAll + 12
    }
}
