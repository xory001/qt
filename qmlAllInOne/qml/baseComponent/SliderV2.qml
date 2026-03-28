import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Controls.Material

Slider {
    id: root
    width: 100
    height: 20

    from: 1
    to: 100
    stepSize: 1

    property color crDisabled: "#9E9E9E"
    property int handleSize: 16
    property int handleRadius: handleSize / 2
    property color crhandleNormal: "#E91E63"
    property color crhandleHovered: "#f00E53"
    property color crhandlePressed: "#f90000"
    property color crhandleDisable: crDisabled

    property int backSize: 6
    property int backRadius: backSize / 2
    property color crBGNornal: "#F8B5CC"
    property color crBGDisabled: crDisabled
    property color crProgressNormal: crhandleNormal
    property color crProgressDisable: crDisabled

    background: Rectangle {
        id: rect_back
        x: (Qt.Horizontal === root.orientation) ? root.handleSize / 2 : (root.width - width) / 2
        y: (Qt.Horizontal === root.orientation) ? (root.height - height) / 2 : root.handleSize / 2
        width: (Qt.Horizontal === root.orientation) ? root.width - root.handleSize : root.backSize
        height: (Qt.Horizontal === root.orientation) ? root.backSize : root.height - root.handleSize
        color: root.enabled ? root.crBGNornal : root.crBGDisabled
        radius: root.backRadius
        clip: true
        Rectangle {
            y: (Qt.Horizontal === root.orientation) ? 0 : parent.height * root.visualPosition
            width: (Qt.Horizontal
                    === root.orientation) ? parent.width * root.visualPosition : parent.width
            height: (Qt.Horizontal === root.orientation) ? parent.height : parent.height
                                                           * (1 - root.visualPosition)
            color: root.enabled ? root.crProgressNormal : root.crProgressDisable
            radius: parent.radius
        }
    }

    handle: Rectangle {
        id: rect_handle
        x: (Qt.Horizontal === root.orientation) ? root.visualPosition
                                                  * rect_back.width : (root.width - width) / 2
        y: (Qt.Horizontal === root.orientation) ? (root.height - height)
                                                  / 2 : root.visualPosition * rect_back.height
        implicitWidth: root.handleSize * 2
        implicitHeight: root.handleSize * 2
        width: root.handleSize
        height: root.handleSize
        radius: root.handleRadius
        color: root.enabled ? (root.pressed ? root.crhandlePressed : (root.hovered ? root.crhandleHovered : root.crhandleNormal)) : root.crDisabled
    }
}
