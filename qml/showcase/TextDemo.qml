import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Page {
    ColumnLayout {
        anchors.fill: parent

        RowLayout {
            spacing: 20
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

            TextField {
                placeholderText: "TextField"
            }
        }

        RowLayout {
            spacing: 20
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

            ScrollView {
                id: view

                TextArea {
                    text: "TextArea\n...\n...\n...\n...\n...\n...\n"
                }
            }
        }
    }
}
