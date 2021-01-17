import QtQuick 2.0
import QtQuick.Controls 2.5

Item {
    id:motor
    property string lableText
    property string motorValue
    property string motorDirection
    property bool directionvisibility: true
    property int farFromLable1: 0
    property int farFromLable2: 0
    property int valueFieldWidth: 30
    property int xAll
    property int yAll

    Label {
        text: motor.lableText
        font.bold : true
        font.pixelSize: 15
        color: "black"
        x: motor.xAll - 125 - motor.farFromLable1
        y: motor.yAll
    }

    TextField {
        text: motor.motorValue
        width: valueFieldWidth
        readOnly : true
        x: motor.xAll + 3
        y: motor.yAll - 11
    }

    Label {
        text: qsTr("direction")
        font.bold : true
        visible: motor.directionvisibility
        font.pixelSize: 15
        color: "black"
        x: motor.xAll + 35 + motor.farFromLable2
        y: motor.yAll
    }

    TextField {
        text: motor.motorDirection
        width: 30
        visible: motor.directionvisibility
        readOnly : true
        x:motor.xAll + 104 + motor.farFromLable2
        y:motor.yAll - 12
    }
}
