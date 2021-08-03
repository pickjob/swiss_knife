// non-layout parent item:
//      anchors / width + height
// layout parent item::
//      Layout attached property

// Anchors
// anchors.alignWhenCentered : bool
// anchors.baseline : AnchorLine
// anchors.baselineOffset : real
// anchors.bottom : AnchorLine
// anchors.bottomMargin : real
// anchors.centerIn : Item
// anchors.fill : Item
// anchors.horizontalCenter : AnchorLine
// anchors.horizontalCenterOffset : real
// anchors.left : AnchorLine
// anchors.leftMargin : real
// anchors.margins : real
// anchors.right : AnchorLine
// anchors.rightMargin : real
// anchors.top : AnchorLine
// anchors.topMargin : real
// anchors.verticalCenter : AnchorLine
// anchors.verticalCenterOffset : real

// Layout Elements:
//      import QtQuick.Layouts
//          GridLayout
//          RowLayout
//          ColumnLayout
//          StackLayout

// Layout attached property(GridLayout、RowLayout、ColumnLayout)
//      Layout.alignment(combination): 对齐方式, 默认 Qt.AlignVCenter | Qt.AlignLeft
//              Qt.AlignLeft
//              Qt.AlignHCenter
//              Qt.AlignRight
//              Qt.AlignTop
//              Qt.AlignVCenter
//              Qt.AlignBottom
//              Qt.AlignBaseline
//      Layout.fillHeight 、 Layout.fillWidth: 是否和父元素同样高、宽 true false
//      Layout.preferredHeight 、 Layout.preferredWidth: 优先高度、宽度

RowLayout {
    anchors.fill: parent
    spacing: 6

    Rectangle {
        color: 'teal'
        Layout.fillWidth: true
        Layout.fillHeight: true
        Layout.preferredWidth: 1
        Text {
            anchors.centerIn: parent
            text: parent.width + 'x' + parent.height
        }
    }

    Rectangle {
        color: 'plum'
        Layout.fillWidth: true
        Layout.fillHeight: true
        Layout.preferredWidth: 2
        Text {
            anchors.centerIn: parent
            text: parent.width + 'x' + parent.height
        }
    }
}
