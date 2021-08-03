import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Page {
    ColumnLayout {
        anchors.fill: parent

        ListView {
            Layout.alignment: Qt.AlignHCenter
            Layout.fillHeight: true
            Layout.fillWidth: true

            model: Qt.fontFamilies()
            delegate: Label {
                text: modelData
            }
        }

        // Repeater {
        //     model: Qt.fontFamilies()

        //     delegate: Label {
        //             Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
        //             text: modelData
        //     }
        // }
    }
}
