import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id:motor

    property string lableText
    property int motorValue
    property int valueFieldWidth: 35
    property int dialMinimum: 0
    property int dialMaximum: 255
    property int awayFromCenter: 20
    property bool dialEnable: true
    property string imgSource: "images/pinkDialDC.png"
    property int xAll
    property int yAll

    function valueNumber()
    {
        var place
        if(motorValue <256)
        {
            place = 32
        }
        else
        {
            place = 26
        }
        return place
    }

    Label { // motor name
        text: motor.lableText
        font.bold : true
        font.pixelSize: 15
        color: "white"
        x: motor.xAll - awayFromCenter
        y: motor.yAll - 18
    }

    Dial {
        id:dial
        enabled: dialEnable
        from: motor.dialMinimum
        to: motor.dialMaximum
        value: motor.motorValue
        x: motor.xAll
        y: motor.yAll
//        Component.onCompleted: dial.baseline.color = "red"
    }

    Image {
        id: dialImg
        source: imgSource
        width: 102
        height: dialImg.width
        x: motor.xAll - 1.5
        y: motor.yAll - 12
        visible: dialEnable
    }

    TextField { // motor value
        id: motorInput
        text: dialEnable? motor.motorValue : 0
        font.pixelSize: 20
        horizontalAlignment: Text.AlignHCenter
        width: motor.valueFieldWidth
        color: "white"
        readOnly: true
        x: motor.xAll + valueNumber()
        y: motor.yAll + 30
        enabled: dialEnable
    }
}
/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
