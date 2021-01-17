import QtQuick 2.12
import QtQuick.Controls 2.5

Item {
    id: axis
    property string lableText
    property string axisValue
    property int fieldWidth: 30
    property int xAll
    property int yAll

    TextField {
        text: axis.axisValue
        width: axis.fieldWidth
        readOnly : true
        x:axis.xAll
        y:axis.yAll
    }

    Label {
        text: axis.lableText
        font.bold : true
        font.pixelSize: 15
        color: "black"
        x:axis.xAll - 45
        y:axis.yAll + 12
    }
}
