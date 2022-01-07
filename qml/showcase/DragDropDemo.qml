import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Page {
    ColumnLayout {
        anchors.fill: parent

        Rectangle {
            width: 50; height: 50
            color: "Purple"
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

            Drag.active: dragArea.drag.active

            MouseArea {
                id: dragArea
                anchors.fill: parent

                drag.target: parent
            }
        }


        DropArea {
            width: 200; height: 200
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

            Rectangle {
                anchors.fill: parent
                color: parent.containsDrag ? "Green" : "Blue";
            }
        }

        
    }
}
