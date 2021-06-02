import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id:motor

    property string name
    property int value
    property int motorSpeedFieldWidth: 35
    property int motorMinimum: -255
    property int motorMaxmum: 255
    property bool motorEnable: true
    property string motorIamgeSource: "images/pinkDialDC.png"
    property string directionIamgeSource

    property int xAll
    property int yAll

    function valueNumber()
    {
        var place
        if(value <256)
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
        text: motor.name
        font.bold : true
        font.pixelSize: 15
        color: "white"
        anchors.centerIn: dial
        anchors.verticalCenterOffset: -65
    }

    Dial {
        id:dial
        enabled: motorEnable
        from: motor.motorMinimum
        to: motor.motorMaxmum
        value: motor.value
        x: motor.xAll
        y: motor.yAll
    }

    Image {
        id: dialImg
        source: motorIamgeSource
        width: 102
        height: dialImg.width
        anchors.centerIn: dial
        anchors.verticalCenterOffset: -11
//        visible: motorEnable
        opacity: motorEnable ? 1 : 0.5
    }

    TextField { // motor value
        id: motorInput
        text: motorEnable? Math.abs(motor.value) : 0
        font.pixelSize: 20
        horizontalAlignment: Text.AlignHCenter
        width: motor.motorSpeedFieldWidth
        color: "white"
        readOnly: true
        anchors.centerIn: dial
        enabled: motorEnable
    }
}
/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
