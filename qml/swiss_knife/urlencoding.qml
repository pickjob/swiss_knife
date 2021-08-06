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

                wrapMode: TextEdit.WordWrap
                selectByMouse: true
                placeholderText : "PUT SOURCE STRING HERE"
            }
        }

        Button {
            text: " \uf0ec UrlEncoding"
            font.pointSize: 20

            onClicked: {
                let srcText = srcTextArea.text
                let destText = destTextArea.text
                if (srcText) {
                    destTextArea.text = _bridge.transform(srcText, 3)
                }
                if (destText) {
                    srcTextArea.text = _bridge.transform(destText, 4)
                }
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
                placeholderText : "ENCODING WILL SHOW HERE"
            }
        }
    }
}