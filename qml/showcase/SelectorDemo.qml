import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Page {
    ColumnLayout {
        anchors.fill: parent

        RowLayout {
            spacing: 20
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

            ColumnLayout {

                Label {
                    text: "Slider"
                    Layout.alignment: Qt.AlignHCenter
                }

                Slider {
                    id: slider

                    from: 0
                    to: 100
                    stepSize: 1
                }

                Label {
                    text: slider.value
                    Layout.alignment: Qt.AlignHCenter
                }
            }

            ColumnLayout {

                Label {
                    text: "RangeSlider"
                    Layout.alignment: Qt.AlignHCenter
                }

                RangeSlider {
                    id: rangeSlider

                    first.value: 0.25
                    second.value: 0.75
                }

                Label {
                    text: rangeSlider.first.value + "-" + rangeSlider.second.value
                    Layout.alignment: Qt.AlignHCenter
                }
            }

            ColumnLayout {

                Label {
                    text: "SpinBox"
                    Layout.alignment: Qt.AlignHCenter
                }

                SpinBox {
                    id: spinBox

                    value: 50
                }

                Label {
                    text: spinBox.value
                    Layout.alignment: Qt.AlignHCenter
                }
            }

            ColumnLayout {

                Label {
                    text: "Dial"
                    Layout.alignment: Qt.AlignHCenter
                }

                Dial {
                    id: dial

                    from: 0
                    to: 100
                    stepSize: 1
                }

                Label {
                    text: dial.value
                    Layout.alignment: Qt.AlignHCenter
                }
            }

            ColumnLayout {

                Label {
                    text: "tumbler"
                    Layout.alignment: Qt.AlignHCenter
                }

                
                Tumbler {
                    id: tumbler

                    model: 10
                }

                Label {
                    text: tumbler.currentIndex
                    Layout.alignment: Qt.AlignHCenter
                }
            }
        }
    }
}
