import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Window

ApplicationWindow {
    id: root

    title: "Swiss Knife"
    width: Screen.width / 2
    height: Screen.height / 2
    font.family: "FiraCode NF"
    font.weight: Font.Medium
    visible: true

    Component.onCompleted: {
        x = Screen.width / 4
        y = Screen.height / 4
    }

    header: TabBar {
        id: tabBar

        Repeater {
            model: qmlListModel
            delegate: TabButton {
                text: title
            }
        }
    }

    StackLayout {
        id: stackLayout

        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        Repeater {
            model: qmlListModel
            delegate: Loader {
                active: StackLayout.isCurrentItem
                source: qmlSource
            }
        }
    }


    PageIndicator {
        count: stackLayout.count
        currentIndex: stackLayout.currentIndex

        anchors.bottom: stackLayout.bottom
        anchors.horizontalCenter: stackLayout.horizontalCenter
    }

    ListModel {
        id: qmlListModel

        ListElement { title: " \uf0ec TransForm"; qmlSource: "transform.qml" }
    }
}
