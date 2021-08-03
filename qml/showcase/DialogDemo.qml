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
                text: "MessageDialog"

                onClicked: messageDialog.open()
            }

            Button {
                text: "ConfirmationDialog"

                onClicked: confirmationDialog.open()
            }
        }

        Dialog {
            id: messageDialog

            x: (parent.width - width) / 2
            y: (parent.height - height) / 2

            title: "Message"

            Label {
                text: "Text From Dialog"
            }
        }

        Dialog {
            id: confirmationDialog

            x: (parent.width - width) / 2
            y: (parent.height - height) / 2
            parent: Overlay.overlay

            modal: true
            title: "Confirmation"
            standardButtons: Dialog.Yes | Dialog.No

            ColumnLayout {
                spacing: 20
                anchors.fill: parent

                Label {
                    text: "Something you need to comfirm ..."
                }

                CheckBox {
                    text: "Do not ask again"
                    Layout.alignment: Qt.AlignRight
                }
            }
        }
    }
}
