import QtQuick 2.12
import QtQuick.Controls 2.15
import io.qt.examples.backend 1.0

Item {
    property int itemX
    property int itemY
    property string lableText
    property string imgSource

    Row{
        spacing: 5
        x: itemX
        y: itemY

        Label {
            text: lableText
            color: textColor
            font.pixelSize: 17
            font.bold: true
        }

        Image {
            source: imgSource
            width: 20
            height: 20
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
