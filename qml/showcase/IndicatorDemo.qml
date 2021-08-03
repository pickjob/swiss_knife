import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Page {
    ColumnLayout {
        id: columLayout
        anchors.fill: parent

        RowLayout {
            spacing: 20
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

            BusyIndicator {
                running: true
            }

            PageIndicator {
                count: swipeView.count
                currentIndex: swipeView.currentIndex
            }

            ProgressBar {
                value: 0.5
            }

            ProgressBar {
                indeterminate: true
            }
        }
    }
}
