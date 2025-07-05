import QtQuick
import QtQuick.Controls

Window {
    id: root
    width: 640
    height: 480
    visible: true
    title: qsTr("QML All In One")

    StackView {
        id: root_stackView
        anchors.fill: parent
        initialItem: "Navigate.qml"
    }
}
