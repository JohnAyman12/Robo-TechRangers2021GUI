import QtQuick 2.5
import QtQuick.Controls 2.15

Item {
    id:motor

    property string lableText
    property int motorValue
    property string motorDirection
    property int valueFieldWidth: 35
    property int dialMinimum: 0
    property int dialMaximum: 255
    property int awayFromCenter: 20
    property bool dialEnable: true
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
        color: "black"
        x: motor.xAll - awayFromCenter
        y: motor.yAll - 15
    }

    Dial {
        id:dial
        enabled: dialEnable
        from: motor.dialMinimum
        to: motor.dialMaximum
        value: motor.motorValue
        x: motor.xAll
        y: motor.yAll
    }

    TextField { // motor value
        id: motorInput
        text: motor.motorValue
        font.pixelSize: 20
        horizontalAlignment: Text.AlignHCenter
        width: motor.valueFieldWidth
        color: "black"
        x: motor.xAll + valueNumber()
        y: motor.yAll + 30
    }
}
/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
