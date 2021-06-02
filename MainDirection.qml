import QtQuick 2.0
import QtQuick.Controls 2.1

Item {
    property int mainDirection_X
    property int mainDirection_Y


    property int frontRightDir: backend.frontRightMotorDir
    property int frontLeftDir: backend.frontLeftMotorDir
    property int backRightDir: backend.backRightMotorDir
    property int backLeftDir: backend.backLeftMotorDir

    Rectangle {
        id:rovBorder
        x: mainDirection_X
        y: mainDirection_Y
        width: 190
        height: 190
        color: "transparent"
        border.color: "deeppink"
        border.width: 2
        radius: 10
    }

    Label {
        id:mainRovDirectionLbl
        x: mainDirection_X + 46
        y: mainDirection_Y - 26
        text: "ROV Direction"
        color: "white"
        font.pixelSize: 20
        font.bold: true
    }

    Image {
        id: mainImg
        x: mainRovDirectionLbl.x - 54
        y: mainRovDirectionLbl.y - 25
        source: "images/main.png"
        width: 55
        height: mainImg.width
    }

    Image {
        id:mainRovDirectionImg
        source:
            if (frontRightDir == 1 && frontLeftDir == 1 && backRightDir == 1){"images/forward.png"}
            else if (frontRightDir == -1 && frontLeftDir == -1 && backRightDir == -1){"images/back.png"}
            else if (frontRightDir == -1 && frontLeftDir == 1 && backRightDir == 1){"images/right.png"}
            else if (frontRightDir == 1 && frontLeftDir == -1 && backRightDir == -1){"images/left.png"}
            else if (frontRightDir == -1 && frontLeftDir == 1 && backRightDir == -1){"images/clockwise.jpeg"}
            else if (frontRightDir == 1 && frontLeftDir == -1 && backRightDir == 1){"images/anticlockwise.jpeg"}
            else {"images/hold.png"}
        width: 165
        height: 165
        anchors.centerIn: rovBorder
    }

}
