import QtQuick
import QtQuick.Controls

Item {

    Component.onCompleted: {

    }

    Rectangle {
        anchors.fill: parent
        color: "Red"
    }

    Button {
        anchors.right: parent.right
        anchors.rightMargin: 5
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 5
        width: GlobalUISettings.btnReturnWid
        height: GlobalUISettings.btnReturnHei
        text: GlobalUISettings.btnReturnText
        font.pointSize: GlobalUISettings.btnFontSizeLarge2
        onClicked: {
            root_stackView.pop()
        }
    }
}
