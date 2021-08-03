//  Signal: event
//  EventHandler
//      on<Signal>
//      on<Property>Changed
//      Connections
//      attached signal handler
//          DragHandler: Handler for dragging
//          HoverHandler: Handler for mouse and tablet hover
//          KeyNavigation: Supports key navigation by arrow keys
//          Keys: Provides key handling to Items
//          PinchHandler: Handler for pinch gestures
//          PointHandler: Handler for reacting to a single touchpoint
//          TapHandler: Handler for taps and clicks
//          WheelHandler: Handler for the mouse wheel
Button {
    onClicked: {
        rect.color = Qt.rgba(Math.random(), Math.random(), Math.random(), 1);
    }
}

Rectangle {
    id: rect

    TapHandler {
        onPressedChanged: console.log("taphandler pressed?", pressed)
    }
}

Rectangle {
    id: rect

    Button {
        id: button
    }

    Connections {
        target: button
        function onClicked() {
            rect.color = Qt.rgba(Math.random(), Math.random(), Math.random(), 1);
        }
    }
}

Rectangle {
    color: Qt.rgba(Qt.random(), Qt.random(), Qt.random(), 1)

    Component.onCompleted: {
        console.log("The rectangle's color is", color)
    }
}
