import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import Quickshell.Services.SystemTray
import Quickshell.Io
import QtQuick
import QtQuick.Layouts

PanelWindow {
    anchors {
        left: true
        right: true
        bottom: true
    }

    implicitHeight: 34
    color: "transparent"

    Rectangle{
        anchors.fill: parent

        gradient: Gradient {

            orientation: Gradient.Vertical

            GradientStop {position: 1.0; color: "#80000000"}
            GradientStop {position: 0.5; color: "#28808080"}
            GradientStop {position: 0.0; color: "#80ffffff"}
        }

        Rectangle {
            anchors {
                top: parent.top
                left: parent.left
                right: parent.right
            }

            height: 1
            color: "#ffffff"
        }

    }

    SystemClock {
        id: clock
        precision: SystemClock.Seconds
    }        

    Row {
        anchors {
            left: parent.left
            leftMargin: 7
            
            verticalCenter: parent.verticalCenter
        }

        spacing: 0

        Rectangle {
            anchors.verticalCenter: parent.verticalCenter
            
            width: dateText.contentWidth + 4
            height: 28
            
            color: "transparent"

            Column {
                anchors {
                    left: parent.left
                    
                    verticalCenter: parent.verticalCenter
                }

                spacing: 1

                Text {
                    id: timeText
                    anchors.horizontalCenter: parent.horizontalCenter

                    font.family: 'Google Sans Code'
                    font.pixelSize: 13
                    color: "#ffffff"

                    text: Qt.formatDateTime(clock.date, "hh:mm")
                
                }

                Text {
                    id: dateText
                    anchors.horizontalCenter: parent.horizontalCenter


                    font.family: 'Google Sans Code'
                    font.pixelSize: 11
                    color: "#ffffff"

                    text: Qt.formatDateTime(clock.date, "dd/MM/yyyy")
                
                }     
            }
        }

        Rectangle {
            anchors.verticalCenter: parent.verticalCenter
            width: 10 + volumeText.contentWidth + 4
            height: 28
            color: 'transparent'
            
            Text {
                id: volumeText
                anchors.centerIn: parent
                
                font.family: 'Google Sans Code'
                font.pixelSize: 18
                color: "#ffffff"

                text: " "
            }

            Process {
                id: volProcess

                command: ["wpctl", "get-volume", "@DEFAULT_AUDIO_SINK@"]
                running: true

                stdout: StdioCollector {
                    onStreamFinished: {
                        let output = this.text.trim();
                        if (output.includes("Volume:")) {
                            let parts = output.split(" ");
                            let volFloat = parseFloat(parts[1]);
                            let volPercent = Math.round(volFloat * 100);
                            let isMuted = output.includes("MUTED");

                            volumeText.text = isMuted ? volPercent + "% 󰖁" : volPercent + "% 󰕾"
                        }
                    }
                }
            }

            Timer {
                interval: 28
                running: true
                repeat: true
                onTriggered: {
                    volProcess.running = true;
                }
            }
        }

        Repeater {
            model: SystemTray.items

            delegate: Item {
                width: 28
                height: 28

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

    Row {
        anchors {
            right: parent.right
            rightMargin: 4

            verticalCenter: parent.verticalCenter
        }

        spacing: 4

        Repeater {
            model: Hyprland.workspaces

            delegate: Rectangle {
                anchors { verticalCenter: parent.verticalCenter }
                width: wsText.contentWidth + 18
                height: 28

                color: modelData.active ? "#808000ff" : "#00000000"

                border.width: 1
                border.color: "#ffffff"
                radius: 4

                Text {
                    id: wsText
                    anchors.centerIn: parent
                    
                    font.family: 'Google Sans Code'
                    font.pixelSize: 18
                    color: "#ffffff"

                    text: modelData.name

                    
                }
            }
        }

        Rectangle {
            anchors.verticalCenter: parent.verticalCenter
            width: 28
            height: 28
            color: 'transparent'

            border.width: 1
            border.color: "#ffffff"
            radius: 20

            Image {
                id: osLogo

                anchors { centerIn:parent }
                width: 20
                height: 20

                source: "nixOS.png"

            }
        }
    }
}
