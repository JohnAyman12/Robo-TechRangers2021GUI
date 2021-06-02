import QtQuick 2.12
import QtQuick.Controls 2.15

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
        text: "PID Factors"
        font.bold : true
        font.pixelSize: 20
        color: "white"
        x: borderX + 42
        y: borderY - 24
    }

    Image {
        id: imgPID
        x: lblPID.x - 43
        y: lblPID.y - 26
        source: "images/PID.png"
        width: 45
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
                id: constPSpinbox
                x: 78
                y: -10
                currecntFactor: "p"
                realValue: 0.2
                realStepSize: 0.1
//                Component.onCompleted: backend.get_P_facrot(constPSpinbox.realValue)
            }
        }

        Row { // I const
            spacing: 8

            Label {
                id: constI
                text: "I-const"
                font.pixelSize: 18
                font.bold: true
                color: "white"
            }

            DoubleSpinBox{
                x: 78
                y: -10
                currecntFactor: "i"
                realValue: 0.2
                realStepSize: 0.1
//                Component.onCompleted: backend.get_I_facrot(constPSpinbox.realValue)
            }
        }

        Row { // D const
            spacing: 8

            Label {
                id: constD
                text: "D-const"
                font.pixelSize: 18
                font.bold: true
                color: "white"
            }

            DoubleSpinBox{
                x: 78
                y: -10
                currecntFactor: "d"
                realValue: 0.2
                realStepSize: 0.1
//                Component.onCompleted: backend.get_D_facrot(constPSpinbox.realValue)
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
