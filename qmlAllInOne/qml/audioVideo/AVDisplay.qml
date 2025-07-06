import QtQuick
import QtQuick.Controls
import QtMultimedia

Item {

    id: avDisplay
    Component.onCompleted: {

    }

    Row {
        id: avDisplay_row_header
        width: parent.width
        height: 40
        spacing: 5

        property int btnWid: 120
        property int btnFontSize: GlobalUISettings.btnFontSizeSmall4

        Button {
            height: parent.height
            width: parent.btnWid
            //anchors.right: parent.right
            text: qsTr("Return")
            font.pointSize: parent.btnFontSize
            onClicked: {
                root_stackView.pop()
            }
        }
    }

    Row {
        id: avDisplay_row_display

        spacing: 5
        anchors.top: avDisplay_row_header.bottom
        anchors.topMargin: 5
        anchors.left: parent.left
        anchors.leftMargin: 5
        anchors.right: parent.right
        anchors.rightMargin: 5
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 5

        Item {
            id: avDisplay_video1_item
            height: parent.height
            width: parent.width / 2

            Row {
                height: 40
                spacing: 5
                id: avDisplay_video1_row

                property int btnWid: 120
                property int btnFontSize: GlobalUISettings.btnFontSizeSmall4

                Button {
                    height: parent.height
                    width: parent.btnWid
                    text: qsTr("Start Preview")
                    font.pointSize: parent.btnFontSize
                    onClicked: {
                        cppVideoProvider.videoSink = avDisplay_video1_videoOut.videoSink
                        //avDisplay_video1_camera.active = true
                    }
                }

                Button {
                    height: parent.height
                    width: parent.btnWid
                    text: qsTr("Stop Preview")
                    font.pointSize: parent.btnFontSize
                    onClicked: {
                        // avDisplay_video1_camera.active = false
                        cppVideoProvider.videoSink = null
                    }
                }
            }

            Rectangle {
                anchors.top: avDisplay_video1_row.bottom
                anchors.topMargin: 5
                anchors.bottom: parent.bottom
                width: parent.width
                color: "#f1f1f1"

                VideoOutput {
                    id: avDisplay_video1_videoOut
                    anchors.fill: parent

                    Component.onDestruction: {
                        cppVideoProvider.videoSink = null
                    }
                }

                MediaDevices {
                    id: avDisplay_video1_mediaDevices
                }

                CaptureSession {
                    camera: avDisplay_video1_camera
                    // videoOutput: avDisplay_video1_videoOut
                }

                Camera {
                    id: avDisplay_video1_camera
                    cameraDevice: avDisplay_video1_mediaDevices.defaultVideoInput
                }
            }
        }

        Rectangle {
            id: avDisplay_item_video2
            height: width * 0.75
            width: parent.width / 2
            color: "#e1e1e1"
        }
    }
}
