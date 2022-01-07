import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Window

Page {
    RowLayout {
        anchors.fill: parent
        anchors.margins: 10
        spacing: 10

        ColumnLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.preferredWidth: 1
            Layout.margins: 10
            spacing: 10

            Label {
                text: "原始数据"
            }

            ScrollView {
                Layout.fillWidth: true
                Layout.fillHeight: true

                TextArea {
                    id: srcTextArea

                    selectByMouse: true
                    wrapMode: TextEdit.WordWrap
                    placeholderText : "Original Data ..."
                }
            }
        }

        ColumnLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.margins: 10
            spacing: 10

            ColumnLayout {
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.alignment: Qt.AlignHCenter
                Layout.margins: 10
                spacing: 10

                ColumnLayout {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                }

                ComboBox {
                    id: transformSelector

                    textRole: "text"
                    valueRole: "value"
                    implicitHeight: 50
                    implicitWidth: 180

                    model: [
                        {text: "FireFox", value: "FireFox"},
                        {text: "Base64", value: "Base64"},
                        {text: "UrlEncoding", value: "UrlEncoding"},
                    ]

                    ToolTip.visible: highlightedIndex > -1
                    ToolTip.text: textAt(highlightedIndex)

                }
            }

            ColumnLayout {
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.alignment: Qt.AlignHCenter
                Layout.margins: 10
                spacing: 10

                ColumnLayout {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                }

                Button {
                    text: "TransForm"
                    Layout.alignment: Qt.AlignHCenter

                    onClicked: {
                        let src = srcTextArea.text;
                        let dest = destTextArea.text;
                        if (src) {
                            let srcEncoding = _bridge.encoding(transformSelector.currentValue, src)
                            if (srcEncoding) {
                                destTextArea.text = srcEncoding;
                            }
                        }
                        if (dest) {
                            let destDecoding = _bridge.decoding(transformSelector.currentValue, dest)
                            if (destDecoding) {
                                srcTextArea.text = destDecoding;
                            }
                        }
                        if (transformSelector.currentValue == "FireFox") {
                            if (src) {
                                let srcFormat = _bridge.format(transformSelector.currentValue, src)
                                if (srcFormat) {
                                    srcTextArea.text = srcFormat;
                                }
                            }
                        }
                    }
                }
            
            }
        }

        ColumnLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.preferredWidth: 1
            Layout.margins: 10
            spacing: 10

            Label {
                text: "编码后数据"
            }

            ScrollView {
                Layout.fillWidth: true
                Layout.fillHeight: true

                TextArea {
                    id: destTextArea

                    selectByMouse: true
                    wrapMode: TextEdit.WordWrap
                    placeholderText : "EnCoding Data ..."
                }
            }
        }
    }
}