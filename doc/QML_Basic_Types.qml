// import QtQml
//      Basic Types:
//          bool: true /false
//          int / double / real / enumeration
//          string
//          list
//          url
//          color: "#RRGGBB" "#AARRGGBB" Qt.rgba() Qt.hsva() Qt.hsla() Qt.darker() Qt.lighter() Qt.tint()
//          date: "YYYY-MM-DDThh:mm:ss.zzzZ"
//          font
//      Binding
//      Component
//          Attached Signals: completed, destruction
//      Connections: creates a connection to a QML signal
//      QtObject: basic qml type
//          objectName
//      Qt: a global object with useful enums and functions

// Binding
ColumnLayout {
    Label {
        id: label
        // No.1
        Binding on text {
            value: textArea.text
        }
        // No.2
        text: textArea.text
    }

    TextArea {
        id: textArea
        text: "Hello world"
    }

    // No.3
    Binding {
        target: label
        property: 'text'
        value: textArea.text
    }
}

// Component
Rectangle {
    Component.onCompleted: console.log("Nested Completed Running!")
}

// Connections
MouseArea {
    id: area
}

Connections {
    target: area
    function onClicked(mouse) { foo(mouse) }
}

// QtObject
Item {
    QtObject {
        id: attributes
        property string name
        property int size
        property variant attributes
    }

    Text { text: attributes.name }
}