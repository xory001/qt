import QtQuick 2.15
import QtQuick.Controls
import "../global"

Item {
    Button {
        text: qsTr("Return")
        font.pointSize: GlobalUISettings.btnFontSizeStd
        width: 100
        anchors.right: parent.right
        anchors.rightMargin: 20
        onClicked: {
            root_stackView.pop()
        }
    }
}
