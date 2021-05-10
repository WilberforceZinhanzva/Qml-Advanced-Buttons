import QtQuick 2.15
import QtQuick.Window 2.15
import QtGraphicalEffects 1.12

Window {
    property double centralPosition:0.0
    property double outerPosition:0.5

    property double gradientVOffset: 0
    property double gradientHOffset:0

    visible: true
    width: 640
    height: 480
    title: qsTr("NICE BUTTON")


    Rectangle{
        id: niceButton
        width: 300
        height: 40
        anchors.centerIn: parent
        radius: 20
        RadialGradient{
            anchors.fill:parent
            horizontalOffset:gradientHOffset
            verticalOffset:gradientVOffset
            horizontalRadius: 300
            verticalRadius: 300
            source:parent
            gradient: Gradient{
                GradientStop{position: centralPosition;color:"lightsteelblue"}
                GradientStop{position: outerPosition;color:"#f2f2f2"}
            }
        }



        Text{
            anchors.centerIn: parent
            text:"NEW"
            font.family: "Montserrat"
            font.pixelSize: 12
            color:"black"
        }

        MouseArea{
            cursorShape: Qt.PointingHandCursor
            anchors.fill:parent
            hoverEnabled: true

            onMouseXChanged: {
                gradientHOffset = mouseX-150
            }
            onMouseYChanged: {
                gradientVOffset = mouseY-20
            }
            onExited: {
                gradientHOffset = 0
                gradientVOffset = 0
            }
        }
    }

    DropShadow {
        anchors.fill: niceButton
        horizontalOffset: 0
        verticalOffset: 0
        radius: 8.0
        samples: 17
        color: "#cccccc"
        source:niceButton
    }

    Behavior on gradientHOffset {
        NumberAnimation{duration: 100}
    }
    Behavior on gradientVOffset {
        NumberAnimation{duration: 600}
    }
}
