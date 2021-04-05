import QtQuick 2.12
import QtQuick.Controls 2.15
import io.qt.examples.backend 1.0

Item {
    property int borderX
    property int borderY

    Rectangle{
        id: timerBorder
        x: borderX
        y: borderY
        color: "transparent"
        width: 228
        height: 138
        border.color: "deeppink"
        border.width: 2
        radius: 10
    }

    Label{
        id: lblPID
        text: "PID\nFactors"
        font.bold : true
        font.pixelSize: 20
        color: "white"
        x: borderX + 52
        y: borderY - 50
    }

    Image {
        id: imgPID
        x: lblPID.x - 56
        y: lblPID.y - 15
        source: "images/PID.png"
        width: 60
        height: imgPID.width + 10
    }

    Column{
        spacing: 20
        x:borderX + 10
        y:borderY + 18

        Row { // P const
            spacing: 8

            Label {
                id: constP
                text: "P-const"
                font.pixelSize: 18
                font.bold: true
                color: "white"
            }

            DoubleSpinBox{
                x: 78
                y: -10
                realValue: 0.2
                realStepSize: 0.3
            }
        }

        Row { // I const
            spacing: 8

            Label {
                id: constI
                text: "P-const"
                font.pixelSize: 18
                font.bold: true
                color: "white"
            }

            DoubleSpinBox{
                x: 78
                y: -10
                realValue: 0.2
                realStepSize: 0.3
            }
        }

        Row { // D const
            spacing: 8

            Label {
                id: constD
                text: "P-const"
                font.pixelSize: 18
                font.bold: true
                color: "white"
            }

            DoubleSpinBox{
                x: 78
                y: -10
                realValue: 0.2
                realStepSize: 0.3
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
