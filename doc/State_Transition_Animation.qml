// import QtQuick
// State + Transition + Animation
//      State: how and where displayed + all the data associated with that state
//          PropertyChanges
//              target
//          AnchorChanges
//              target
//          ParentChange
//          StateChangeScript
//      Transition:  an "edge" between two states
//      Animation: a fluid animation can be used to aid the user during the transition
//          signal: finished  started  stopped
//          menthod: start() stop() pause() resume() restart() complete()
//          Animator:
//              OpacityAnimator
//              RotationAnimator
//              ScaleAnimator
//              UniformAnimator
//              XAnimator
//              YAnimator
//          ParallelAnimation 、SequentialAnimation
//          PropertyAnimation
//              target
//              properties
//              from / to
//              duration
//              ColorAnimation
//              NumberAnimation
//              RotationAnimation
//              Vector3dAnimation
//          AnchorAnimation

RowLayout {
    spacing: 20
    Layout.alignment: Qt.AlignHCenter
    Button {
        text: 'ChangeState'
        onClicked: colorRect.state == 'NORMAL' ? colorRect.state = 'CRITICAL' : colorRect.state = 'NORMAL'
    }
    Rectangle {
        id: colorRect
        width: 200; height: 200
        state: "NORMAL"
        states: [
            State {
                name: "NORMAL"
                PropertyChanges { target: colorRect; color: "Green"}
            },
            State {
                name: "CRITICAL"
                PropertyChanges { target: colorRect; color: "Red"}
            }
        ]
    }
}
