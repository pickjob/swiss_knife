import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Window

ApplicationWindow {
    id: root

    title: "QML Template"
    width: Screen.width / 2
    height: Screen.height / 2
    font.family: "FiraCode NF"
    font.weight: Font.Medium
    visible: true

    Component.onCompleted: {
        x = Screen.width / 4
        y = Screen.height / 4
    }

    RowLayout {
        anchors.fill: parent

        Label {
            text: "Hello QML"
            Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
        }
    }
}
