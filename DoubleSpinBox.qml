import QtQuick 2.0
import QtQuick.Controls 2.1

Item {
    property int decimals: 1
    property real realValue: 0.0
    property real realFrom: 0.0
    property real realTo: 10.0
    property real realStepSize: 1.0

    property string currecntFactor

    SpinBox{
        property real factor: Math.pow(10, decimals)
        id: spinbox
        stepSize: realStepSize*factor
        value: realValue*factor
        to : realTo*factor
        from : realFrom*factor
        editable: true
        validator: DoubleValidator {
            bottom: Math.min(spinbox.from, spinbox.to)*spinbox.factor
            top:  Math.max(spinbox.from, spinbox.to)*spinbox.factor
        }

        textFromValue: function(value, locale) {
            return parseFloat(value*1.0/factor).toFixed(decimals);
        }

        background: Rectangle {
            y:5
            width: 125
            height: 30
            radius: 2
        }

        onValueChanged:
        {
            if (currecntFactor === "p")
            {
//                backend.get_P_facrot(value*factor/100)
            }

            if (currecntFactor === "i")
            {
//                backend.get_I_facrot(value*factor/100)
            }

            if (currecntFactor === "d")
            {
//                backend.get_D_facrot(value*factor/100)
            }
        }
    }
}
