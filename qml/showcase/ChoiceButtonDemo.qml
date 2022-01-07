import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Page {
    ColumnLayout {
        anchors.fill: parent

        RowLayout {
            spacing: 20
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

            Switch {
                text: "Common"
            }

            Switch {
                text: "Checked"
                checked: true
            }

            Switch {
                text: "Disabled"
                enabled: false
            }
        }

        RowLayout {
            spacing: 20
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

            GroupBox {
                title: 'Common'

                ColumnLayout {

                    RadioButton {
                        text: "Common"
                    }

                    RadioButton {
                        text: "Checked"
                        checked: true
                    }
                }
            }

            GroupBox {
                title: 'ButtonGroup'

                ColumnLayout {

                    ButtonGroup {
                        id: radioGroup
                    }

                    RadioButton {
                        checked: true
                        text: "Checked Child Node"
                        ButtonGroup.group: radioGroup
                    }

                    RadioButton {
                        text: "UnChecked Child Node"
                        ButtonGroup.group: radioGroup
                    }
                }
            }
        }

        RowLayout {
            spacing: 20
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

            GroupBox {
                title: 'Common'

                ColumnLayout {

                    CheckBox {
                        text: "Common"
                    }

                    CheckBox {
                        text: "Checked"
                        checked: true
                    }
                }
            }

            GroupBox {
                title: 'CheckState'

                ColumnLayout {

                    ButtonGroup {
                        id: childGroup
                        exclusive: false
                        checkState: parentBox.checkState
                    }

                    CheckBox {
                        id: parentBox
                        text: "Root Node"
                        checkState: childGroup.checkState
                    }

                    CheckBox {
                        checked: true
                        text: "Checked Child Node"
                        leftPadding: indicator.width
                        ButtonGroup.group: childGroup
                    }

                    CheckBox {
                        text: "UnChecked Child Node"
                        leftPadding: indicator.width
                        ButtonGroup.group: childGroup
                    }
                }
            }
        }

        RowLayout {
            spacing: 20
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

            ComboBox {
                model: ["First", "Second", "Third"]
            }

            ComboBox {
                editable: true
                model: ListModel {
                    id: model
                    ListElement { text: "Banana" }
                    ListElement { text: "Apple" }
                    ListElement { text: "Coconut" }
                }

                onAccepted: {
                    if (find(editText) === -1)
                        model.append({text: editText})
                }
            }
        }
    }
}
