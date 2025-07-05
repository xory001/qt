import QtQuick
import QtQuick.Controls

Item {
    id: pixLine

    enum Orientation {
        Horizontal = 1,
        Vertical
    }
    property int orientation: Orientation.Horizontal
    property color color: "black"

    Rectangle {
        id: pixLine_rect
        anchors.centerIn: parent
        color: pixLine.color

        width: pixLine.orientation
               === PixLine.Orientation.Horizontal ? pixLine.width : 1 / Screen.devicePixelRatio
        height: pixLine.orientation
                === PixLine.Orientation.Vertical ? pixLine.height : 1 / Screen.devicePixelRatio
    }
}
