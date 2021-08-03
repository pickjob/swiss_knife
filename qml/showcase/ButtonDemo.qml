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
                text: "Common"
            }

            Button {
                text: "Highlighted"
                highlighted: true
            }

            Button {
                text: "Disabled"
                enabled: false
            }
        }

        RowLayout {
            spacing: 20
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter


            RoundButton {
                text: "\u2713"
            }

            RoundButton {
                text: "\u2713"
                highlighted: true
            }

            RoundButton {
                text: "\u2713"
                enabled: false
            }
        }
    }
}
