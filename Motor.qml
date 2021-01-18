import QtQuick 2.0
import QtQuick.Controls 2.15

Item {
    id:motor
    property string lableText
    property string motorValue
    property string motorDirection
    property bool directionvisibility: true
    property int farFromLable1: 0
    property int farFromLable2: 0
    property int valueFieldWidth: 30
    property int dialMinimum: 0
    property int dialMaximum: 255
    property int xAll
    property int yAll

    function valueNumber()
    {
        var place
        if(motorValue < 100)
        {
            place = 44
        }
        else if(motorValue <256)
        {
            place = 35
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
        x: motor.xAll + 10
        y: motor.yAll - 15
    }

    Dial {
        from: motor.dialMinimum
        to: motor.dialMaximum
        value: motor.motorValue
        x: motor.xAll
        y: motor.yAll
    }

    Label { // motor value
        text: motor.motorValue
        font.pixelSize: 20
        color: "black"
        x: motor.xAll + valueNumber()
        y: motor.yAll + 36
    }

    Label { // direction text
        text: qsTr("direction")
        font.bold : true
        visible: motor.directionvisibility
        font.pixelSize: 15
        color: "black"
        x: motor.xAll + 10
        y: motor.yAll + 100
    }

    Label { // direction value
        text: motor.motorDirection
        font.pixelSize: 20
        color: "black"
        visible: motor.directionvisibility
        x:motor.xAll + 80
        y:motor.yAll + 95
    }
}
