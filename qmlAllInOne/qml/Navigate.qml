import QtQuick
import QtQuick.Controls

import "./baseComponent"

Item {
    id: navigate

    Item {
        id: navigate_item_title
        width: parent.width
        height: 36

        Text {
            id: navigate_text_title
            text: qsTr("navigate")
            font.pointSize: GlobalUISettings.btnFontSizeStd
        }

        PixLine {
            anchors.top: navigate_text_title.bottom
            orientation: PixLine.Horizontal
            width: parent.width
            color: "blue"
        }
    }

    Grid {
        id: navigate_grid
        anchors.top: navigate_item_title.bottom
        anchors.bottom: parent.bottom
        width: parent.width
        x: 5

        property int btnWidth: 120
        property int btnHeight: 60

        onWidthChanged: {
            columns = width / (btnWidth + spacing)
        }

        columns: 1
        spacing: 5

        Button {
            width: parent.btnWidth
            height: parent.btnHeight
            text: qsTr("Audio && Video")
            onClicked: {
                root_stackView.push("audioVideo/AVDisplay.qml")
            }
        }

        Rectangle {
            width: parent.btnWidth
            height: parent.btnHeight
            color: "green"
            Text {
                anchors.centerIn: parent
                text: "2"
                color: "white"
            }
        }
        Rectangle {
            width: parent.btnWidth
            height: parent.btnHeight
            color: "blue"
            Text {
                anchors.centerIn: parent
                text: "3"
                color: "white"
            }
        }
        Rectangle {
            width: parent.btnWidth
            height: parent.btnHeight
            color: "orange"
            Text {
                anchors.centerIn: parent
                text: "4"
                color: "white"
            }
        }
        Rectangle {
            width: parent.btnWidth
            height: parent.btnHeight
            color: "purple"
            Text {
                anchors.centerIn: parent
                text: "5"
                color: "white"
            }
        }
        Rectangle {
            width: parent.btnWidth
            height: parent.btnHeight
            color: "teal"
            Text {
                anchors.centerIn: parent
                text: "6"
                color: "white"
            }
        }
        Rectangle {
            width: parent.btnWidth
            height: parent.btnHeight
            color: "pink"
            Text {
                anchors.centerIn: parent
                text: "7"
                color: "white"
            }
        }
        Rectangle {
            width: parent.btnWidth
            height: parent.btnHeight
            color: "brown"
            Text {
                anchors.centerIn: parent
                text: "8"
                color: "white"
            }
        }
        Rectangle {
            width: parent.btnWidth
            height: parent.btnHeight
            color: "navy"
            Text {
                anchors.centerIn: parent
                text: "9"
                color: "white"
            }
        }
        Rectangle {
            width: parent.btnWidth
            height: parent.btnHeight
            color: "#999"
            Text {
                anchors.centerIn: parent
                text: "10"
                color: "white"
            }
        }
        Rectangle {
            width: parent.btnWidth
            height: parent.btnHeight
            color: "#666"
            Text {
                anchors.centerIn: parent
                text: "11"
                color: "white"
            }
        }
        Rectangle {
            width: parent.btnWidth
            height: parent.btnHeight
            color: "#333"
            Text {
                anchors.centerIn: parent
                text: "12"
                color: "white"
            }
        }
        Rectangle {
            width: parent.btnWidth
            height: parent.btnHeight
            color: "#0a0"
            Text {
                anchors.centerIn: parent
                text: "13"
                color: "white"
            }
        }
        Rectangle {
            width: parent.btnWidth
            height: parent.btnHeight
            color: "#a00"
            Text {
                anchors.centerIn: parent
                text: "14"
                color: "white"
            }
        }
        Rectangle {
            width: parent.btnWidth
            height: parent.btnHeight
            color: "#00a"
            Text {
                anchors.centerIn: parent
                text: "15"
                color: "white"
            }
        }
    }
}
