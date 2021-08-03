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
                text: "RotationAnimator"
                onClicked: rotationAnimator.start()
            }

            Button {
                text: "ScaleAnimator"
                onClicked: scaleAnimator.start()
            }

            Button {
                text: "OpacityAnimator"
                onClicked: opacityAnimator.start()
            }
        }

        Rectangle {
            id: targetRect
            width: 200
            height: 200
            Layout.alignment: Qt.AlignHCenter

            RotationAnimator {
                id: rotationAnimator
                target: targetRect
                from: 0
                to: 360
                duration: 5000
            }

            ScaleAnimator {
                id: scaleAnimator
                target: targetRect
                from: 1
                to: 2.5
                duration: 5000
            }

            OpacityAnimator {
                id: opacityAnimator
                target: targetRect;
                from: 0;
                to: 1;
                duration: 5000
            }
        }
    }
}
