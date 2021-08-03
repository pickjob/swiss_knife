import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Window

ApplicationWindow {
    id: root

    title: "QML ShowCase"
    width: Screen.width / 2
    height: Screen.height / 2
    font.family: "FiraCode NF"
    font.weight: Font.Medium
    visible: true

    Component.onCompleted: {
        x = Screen.width / 4
        y = Screen.height / 4
        toPage(swipeView.count - 1)
    }

    header: ToolBar {
        id: header

        RowLayout {
            anchors.fill: parent

            ToolButton {
                text: "\uf060"
                enabled: swipeView.currentIndex != 0
                Layout.alignment: Qt.AlignVCenter | Qt.AlignLeft
                onClicked: {
                    previousPage()
                }
            }

            Label {
                id: toolBarLabel

                elide: Label.ElideRight
                horizontalAlignment: Qt.AlignHCenter
                verticalAlignment: Qt.AlignVCenter
                Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
            }

            ToolButton {
                text: "\uf0c9"
                Layout.alignment: Qt.AlignVCenter | Qt.AlignRight
                onClicked: drawer.open()
            }
        }
    }

    Drawer {
        id: drawer

        y: header.height
        width: root.width / 3
        height: root.height - header.height
        edge: Qt.RightEdge

        ListView {
            id: listView

            currentIndex: swipeView.currentIndex
            anchors.fill: parent
            model: qmlListModel

            delegate: ItemDelegate {
                width: listView.width
                text: title
                highlighted: ListView.isCurrentItem
                onClicked: {
                    toPage(index)
                    drawer.close()
                }
            }

        }
    }

    SwipeView {
        id: swipeView

        anchors.fill: parent
        currentIndex: listView.currentIndex

        Repeater {
            model: qmlListModel
            delegate: Loader {
                active: SwipeView.isCurrentItem || SwipeView.isNextItem || SwipeView.isPreviousItem
                source: qmlSource
            }
        }

        onCurrentIndexChanged: {
            toolBarLabel.text = qmlListModel.get(swipeView.currentIndex).title
        }
    }

    PageIndicator {
        count: swipeView.count
        currentIndex: swipeView.currentIndex

        anchors.bottom: swipeView.bottom
        anchors.horizontalCenter: swipeView.horizontalCenter
    }

    ListModel {
        id: qmlListModel

        ListElement { title: "ButtonDemo"; qmlSource: "ButtonDemo.qml" }
        ListElement { title: "ChoiceButtonDemo"; qmlSource: "ChoiceButtonDemo.qml" }
        ListElement { title: "SelectorDemo"; qmlSource: "SelectorDemo.qml" }
        ListElement { title: "IndicatorDemo"; qmlSource: "IndicatorDemo.qml" }
        ListElement { title: "TextDemo"; qmlSource: "TextDemo.qml" }
        ListElement { title: "DialogDemo"; qmlSource: "DialogDemo.qml" }
        ListElement { title: "AnimatorDemo"; qmlSource: "AnimatorDemo.qml" }
        ListElement { title: "AnimationDemo"; qmlSource: "AnimationDemo.qml" }
        ListElement { title: "ListViewDemo"; qmlSource: "ListViewDemo.qml" }

        // ListElement { title: "test"; qmlSource: "test.qml" }
    }

    function nextPage() {
        swipeView.incrementCurrentIndex()
    }

    function previousPage() {
        swipeView.decrementCurrentIndex()
    }

    function toPage(index) {
        swipeView.setCurrentIndex(index)
    }
}
