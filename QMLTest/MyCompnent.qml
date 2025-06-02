import QtQuick
import QtQuick.Controls

Item {
    Text {
        id: window_text
        text: qsTr("MyCompnent text")
    }

    Button{
        x:20
        y:100
        text:qsTr("button")
        onClicked: {
            window_text.text += " -> add"
        }
    }
}
