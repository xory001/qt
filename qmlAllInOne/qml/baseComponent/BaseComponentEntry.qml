import QtQuick 2.15
import QtQuick.Controls
import "../baseComponent"

//import QtQuick.Controls.Basic

//import QtQuick.Controls.Fusion

//import QtQuick.Controls.Imagine
import QtQuick.Controls.Material

//import QtQuick.Controls.Universal
//import QtQuick.Controls.Windows
Item {
    id: root

    property string qmlName: "BaseComponentEntry.qml"

    MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton | Qt.RightButton
        onClicked: me => {
                       //console.log(qmlName, "ma onClicked, me = ", me)
                       if (Qt.RightButton === me.button) {
                           root_stackView.pop()
                       }
                   }
    }

    Text {
        id: text_title
        y: 5
        text: "base component"
        font.pixelSize: 24
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Item {
        id: item_line
        anchors.top: text_title.bottom
        width: parent.width
        height: 10

        Rectangle {
            anchors.verticalCenter: parent.verticalCenter
            width: parent.width
            height: 1
            color: "#007f00"
        }
    }

    Item {
        id: item_main
        x: 5
        width: parent.width - x * 2
        anchors.top: item_line.bottom
        anchors.bottom: parent.bottom

        Column {
            Row {
                spacing: 20

                Slider {
                    id: slider_root
                    width: 600
                    height: 100

                    from: 1
                    to: 100
                    stepSize: 1

                    property int handleSize: 20

                    background: Rectangle {
                        id: rect_back
                        x: rect_handle.width / 2
                        y: (parent.height - height) / 2
                        width: parent.width - rect_handle.width
                        height: 40
                        color: "red"
                        radius: 10
                        clip: true
                        Rectangle {
                            width: parent.width * slider_root.visualPosition
                            height: parent.height
                            color: "blue"
                            radius: 10
                        }
                    }

                    handle: Rectangle {
                        id: rect_handle
                        x: slider_root.visualPosition * rect_back.width
                        y: slider_root.topPadding + slider_root.availableHeight / 2 - height / 2
                        //implicitWidth: 26
                        //implicitHeight: 26
                        //radius: 13
                        width: slider_root.handleSize
                        height: slider_root.handleSize
                        radius: height / 2
                        color: slider_root.pressed ? "#f0f0f0" : "#f6f6f6"
                        border.color: "#bdbebf"
                    }

                    Component.onCompleted: {
                        console.log(qmlName, "slider_root, from = ", from,
                                    ", to = ", to)
                    }
                }

                Text {
                    id: text_val
                    text: slider_root.value
                    width: 60
                }

                Button {
                    width: 60
                    text: "-"
                    font.pixelSize: 24
                    onClicked: {

                        slider_root.decrease()
                    }
                }

                Button {
                    width: 60
                    text: "+"
                    font.pixelSize: 24
                    onClicked: {

                        slider_root.increase()
                    }
                }

                Slider {
                    id: slider_2
                    width: 500
                    height: 30

                    from: 1
                    to: 100
                    stepSize: 1
                    value: 50

                    //enabled: false
                    onValueChanged: {
                        console.log(qmlName, "slider_2, handel.width = ",
                                    handle.width, ", handle.implicitWidth = ",
                                    handle.implicitWidth, ", handle.x = ",
                                    handle.x, ", availableWidth = ",
                                    availableWidth, ", leftPadding = ",
                                    leftPadding, ", rightPadding = ",
                                    rightPadding)

                        console.log(qmlName, "slider_2, back.width = ",
                                    background.width, " back.x = ",
                                    background.x, ", back.height = ",
                                    background.height, "back.child.x = ",
                                    background.children[0].x,
                                    ", back.child.width = ",
                                    background.children[0].width)
                    }

                    Component.onCompleted: {
                        console.log(qmlName, "slider_2, handel.width = ",
                                    handle.width, ", handle.implicitWidth = ",
                                    handle.implicitWidth, ", handle.x = ",
                                    handle.x, ", handle.height = ",
                                    handle.height, ", availableWidth = ",
                                    availableWidth, ", leftPadding = ",
                                    leftPadding)
                        console.log(qmlName, "slider_2, back.width = ",
                                    background.width, ", back.height = ",
                                    background.height, " back.x = ",
                                    background.x, "back.child.x = ",
                                    background.children[0].x, ", back.child.width = ",
                                    background.children[0].width, ", back.child.size = ",
                                    background.children.length)
                    }
                }

                Text {
                    id: text_val2
                    text: slider_2.value
                }

                Button {
                    width: 60
                    text: "-"
                    font.pixelSize: 24
                    onClicked: {

                        slider_2.decrease()
                    }
                }

                Button {
                    width: 60
                    text: "+"
                    font.pixelSize: 24
                    onClicked: {

                        slider_2.increase()
                    }
                }
            }

            Row {

                Text {
                    id: text_sliderV2_1
                    text: sliderV2_1.value
                    width: 60
                }

                Button {
                    width: 60
                    text: "-"
                    font.pixelSize: 24
                    onClicked: {
                        sliderV2_2.decrease()
                        sliderV2_1.decrease()
                    }
                }

                Button {
                    width: 60
                    text: "+"
                    font.pixelSize: 24
                    onClicked: {

                        sliderV2_1.increase()
                        sliderV2_2.increase()
                    }
                }
                SliderV2 {
                    id: sliderV2_1
                    width: 300
                    height: 30
                    value: 50

                    //enabled: false
                    onValueChanged: {
                        text_sliderV2_1.text = value
                    }
                }

                SliderV2 {
                    id: sliderV2_2
                    width: 30
                    height: 300
                    value: 50
                    orientation: Qt.Vertical

                    //enabled: false
                    onValueChanged: {
                        text_sliderV2_1.text = value
                    }
                }
            }
        }
    }
}
