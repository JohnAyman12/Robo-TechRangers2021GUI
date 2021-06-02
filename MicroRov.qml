import QtQuick 2.12
import QtQuick.Controls 2.15

Item {
    property int microMotor: 0
    property int rollerMotor: 0

    property int microMotorDir: 0
    property int rollerMotorDir: 0

    property int microArm: 0
    property int microArmDir: 0

    property int microROV_x
    property int microROV_y
    property color textColor: "white"

    function sendToBackend(value, direction, device)
    {
        if(device === 2){backend.getMicroArm(value, direction);}
        else if(device === 1){backend.getMicro(value, direction);}
        else if(device === 0) {backend.getRoller(value, direction);}
    }

    // controling shortcuts

    Shortcut {
        id: shortcutMicroForward
        sequence: "R"
        context: Qt.ApplicationShortcut
        enabled:  {checkBoxMicro.checkState}
        onActivated:{microMotor = 255; microMotorDir = 1; sendToBackend(microMotor, microMotorDir, 1);}
    }

    Shortcut {
        id: shortcutMicroStop
        sequence: "F"
        context: Qt.ApplicationShortcut
        enabled:  {checkBoxMicro.checkState}
        onActivated:{microMotor = 0; microMotorDir = 0; sendToBackend(microMotor, microMotorDir, 1);}
    }

    Shortcut {
        id: shortcutMicroBack
        sequence: "C"
        context: Qt.ApplicationShortcut
        enabled:  {checkBoxMicro.checkState}
        onActivated:{microMotor = 255; microMotorDir = -1; sendToBackend(microMotor, microMotorDir, 1);}
    }

    Shortcut {
        id: shortcutRollerForward
        sequence: "I"
        context: Qt.ApplicationShortcut
        enabled:  {checkBoxMicro.checkState}
        onActivated:{rollerMotor = 255; rollerMotorDir = 1; sendToBackend(rollerMotor, rollerMotorDir, 0);}
    }

    Shortcut {
        id: shortcutRollerStop
        sequence: "J"
        context: Qt.ApplicationShortcut
        enabled:  {checkBoxMicro.checkState}
        onActivated:{rollerMotor = 0; rollerMotorDir = 0; sendToBackend(rollerMotor, rollerMotorDir, 0);}
    }

    Shortcut {
        id: shortcutRollerBack
        sequence: "M"
        context: Qt.ApplicationShortcut
        enabled:  {checkBoxMicro.checkState}
        onActivated:{rollerMotor = 255; rollerMotorDir = -1; sendToBackend(rollerMotor, rollerMotorDir, 0);}
    }

    Shortcut {
        id: shortcutMicroArmClose
        sequence: "O"
        context: Qt.ApplicationShortcut
        enabled:  {checkBoxMicro.checkState}
        onActivated:{microArm = 255; microArmDir = 1; sendToBackend(microArm, microArmDir, 2)}
    }

    Shortcut {
        id: shortcutMicroArmStop
        sequence: "E"
        context: Qt.ApplicationShortcut
        enabled:  {checkBoxMicro.checkState}
        onActivated:{microArm = 0; microArmDir = 0; sendToBackend(microArm, microArmDir, 2)}
    }

    Shortcut {
        id: shortcutMicroArmopen
        sequence: "W"
        context: Qt.ApplicationShortcut
        enabled:  {checkBoxMicro.checkState}
        onActivated:{microArm = 255; microArmDir = -1; sendToBackend(microArm, microArmDir, 2)}
    }

    //  MICRO ROV

    Rectangle{
        id:microBorder
        x: microROV_x
        y: microROV_y
        color: "transparent"
        width: 290
        height: 305
        border.color: "deeppink"
        border.width: 2
        radius: 10
    }

    Label{
        id: microLbl
        text: "Micro ROV"
        font.bold : true
        font.pixelSize: 20
        color: "white"
        x: microROV_x + 58
        y: microROV_y - 24
    }

    Image {
        id: microImg
        x: microLbl.x - 86
        y: microLbl.y - 52
        source: "images/micro.png"
        width: 112
        height: microImg.width
    }

    CheckBox { // micro mood control
        id:checkBoxMicro
        text: "<font color=\"white\">Micro<font>"
        font.pixelSize: 17
        font.bold: true
        x: microBorder.x + 100
        y: microBorder.y - 5
        onCheckStateChanged:
        {
            if(!checkBoxMicro.checked)
            {
                microMotor = 0
                microMotorDir = 0
                rollerMotor = 0
                rollerMotorDir = 0
                microArm = 0
                microArmDir = 0
            }
        }
        background: Rectangle {
            x: 9
            y: 17
            width: 16
            height: 16
            radius: 2
            color: "white"
        }
    }

    Motor { // micro motor
        id:microMotorID
        name: "Micro Motor"
        value: microMotor * microMotorDir
        motorEnable: {checkBoxMicro.checkState}
        directionIamgeSource: if (microMotorDir == 0) {"images/hold.png"}
                              else if (microMotorDir == 1){"images/clockwise.jpeg"}
                              else {"images/anticlockwise.png"}
        xAll: microBorder.x + 15
        yAll: microBorder.y + 60
    }

    Motor { // roller motor
        id:rollerMotorID
        name: "Roller Motor"
        value: rollerMotor * rollerMotorDir
        motorEnable: {checkBoxMicro.checkState}
        directionIamgeSource: if (rollerMotorDir == 0) {"images/hold.png"}
                              else if (rollerMotorDir == 1){"images/clockwise.jpeg"}
                              else {"images/anticlockwise.png"}
        xAll: microBorder.x + 165
        yAll: microBorder.y + 60
    }

    Motor { // roller motor
        id:microArmMotorID
        name: "Micro Arm Motor"
        value: microArm * microArmDir
        motorEnable: {checkBoxMicro.checkState}
        directionIamgeSource: if (microArmDir == 0) {"images/hold.png"}
                              else if (microArmDir == 1){"images/clockwise.jpeg"}
                              else {"images/anticlockwise.png"}
        xAll: microBorder.x + 94
        yAll: microBorder.y + 195
    }
}
