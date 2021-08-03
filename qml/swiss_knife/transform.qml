import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Window

Page {
    RowLayout {
        anchors.fill: parent
        anchors.margins: 10
        spacing: 10

        ScrollView {
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.preferredWidth: 1

            TextArea {
                id: srcTextArea

                placeholderText : "PUT SOURCE HERE"
                wrapMode: TextEdit.WordWrap
                selectByMouse: true
            }
        }

        Button {
            text: "JSON \uf0ec FORM"
            font.pointSize: 20

            onClicked: {
                destTextArea.text = _bridge.transform(srcTextArea.text, 1)
            }
        }

        ScrollView {
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.preferredWidth: 1

            TextArea {
                id: destTextArea

                wrapMode: TextEdit.WordWrap
                selectByMouse: true
            }
        }
    }
}