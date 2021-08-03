import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Page {
    ColumnLayout {
        anchors.fill: parent

        RowLayout {
            spacing: 20
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

            Button {
                text: 'ChangeState'
                onClicked: colorRect.state == 'NORMAL' ? colorRect.state = 'CRITICAL' : colorRect.state = 'NORMAL'
            }

            Rectangle {
                id: colorRect
                width: 100
                height: 100
                state: "NORMAL"

                states: [
                    State {
                        name: "NORMAL"
                        PropertyChanges { target: colorRect; color: "Green"}
                    },
                    State {
                        name: "CRITICAL"
                        PropertyChanges { target: colorRect; color: "Red"}
                    }
                ]
            }
        }

        RowLayout {
            spacing: 20
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

            Button {
                text: 'ChangeState'
                onClicked: sizeRect.state == '' ? sizeRect.state = 'BIGGER' : sizeRect.state = ''
            }

            Rectangle {
                id: sizeRect
                color: "Cyan"
                width: 100
                height: 100

                states: [
                    State {
                        name: "BIGGER"
                        PropertyChanges {target: sizeRect; width: 500}
                    }
                ]

                transitions: [
                    Transition {
                        NumberAnimation { properties: "width"; duration: 5000 }
                    }
                ]
            }
        }

        RowLayout {
            spacing: 20
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

            Rectangle {
                id: behaviorRect
                color: "Purple"
                width: 100
                height: 100

                PropertyAnimation on color {
                    to: "Orange"
                    loops: Animation.Infinite
                    duration: 5000
                }
            }
        }
    }
}
