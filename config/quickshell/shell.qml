import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import Quickshell.Services.SystemTray
import Quickshell.Io
import QtQuick
import QtQuick.Layouts

PanelWindow {
    anchors {
        //top: true
        left: true
        right: true
        bottom: true
    }

    //margins {
        //top: 5
        //left: 10
        //right: 10
        //bottom: 5
    //}

    implicitHeight: 32
    color: "transparent"

    Rectangle{
        anchors.fill: parent

        gradient: Gradient {

            orientation: Gradient.Vertical

            GradientStop {position: 0.0; color: "#40000000"}
            GradientStop {position: 0.5; color: "#20808080"}
            GradientStop {position: 1.0; color: "#40ffffff"}
       }

        //radius: 4
        //border.color: "#ffffff"
        //border.width: 1

        Rectangle {
            anchors {
                top: parent.top
                left: parent.left
                right: parent.right
                //bottom: parent.bottom
            }

            height: 1
            color: "#ffffff"
        }

    }

    SystemClock {
        id: clock
        precision: SystemClock.Seconds
    }

    Text {
        text: Qt.formatDateTime(clock.date, "hh:mm")
        color: "#ffffff"
        font.pixelSize: 14
            
        anchors.verticalCenter: parent.verticalCenter
        anchors.centerIn: parent

        leftPadding: 7
        rightPadding: 7
    }
        

    Row {
        anchors {
            left: parent.left
            leftMargin: 7
            verticalCenter: parent.verticalCenter
        }

        spacing: 4

        Repeater {
            model: SystemTray.items

            delegate: Item {
                width: 20
                height: 20

                Image {
                    anchors.fill: parent
                    source: modelData.icon || ""
                }

                MouseArea {
                    anchors.fill: parent
                    acceptedButtons: Qt.LeftButton | Qt.RightButton

                    onClicked: mouse => {
                        if (mouse.button === Qt.LeftButton) {
                            modelData.activate()
                        } else if (mouse.button === Qt.RightButton) {
                            if (modelData.hasMenu) {
                                modelData.menu.open()
                            } else {
                                modelData.secondaryActivate()
                            }
                        }
                    }
                }
            }
        }
    }

}
