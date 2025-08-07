import QtQuick 2.15
import QtQuick.Particles
import QtQuick.Shapes
import "../baseComponent"
import "../global"

Item {
    Header {
        id: header
        width: parent.width
        height: GlobalUISettings.headerHeight
    }

    Column {
        anchors.top: header.bottom
        anchors.bottom: parent.bottom
        width: parent.width
        spacing: 2

        Row {
            id: row_1
            width: parent.width
            height: 100
            spacing: 2

            Rectangle {
                width: 100
                height: 100
                color: "red"
            }

            Rectangle {
                width: 100
                height: 50
                color: "blue"
                radius: 50
            }

            Rectangle {
                width: 100
                height: 100
                color: "#e1e1e1"
                Shape {
                    id: shape

                    //  containsMode: Shape.FillContains
                    ShapePath {
                        fillColor: "#00000000"
                        strokeColor: "red"
                        strokeWidth: 1
                        startX: 50
                        startY: 25
                        PathArc {
                            x: 50
                            y: 75
                            radiusX: 20
                            radiusY: 25
                            //useLargeArc: true
                        }
                    }
                }
            }

            Rectangle {
                width: 100
                height: 100
                color: "#e1e1e1"
                Shape {

                    //  containsMode: Shape.FillContains
                    ShapePath {
                        fillColor: "#00000000"
                        strokeColor: "red"
                        strokeWidth: 1

                        PathAngleArc {
                            centerX: 50
                            centerY: 50
                            startAngle: 0
                            sweepAngle: -180
                            radiusX: 20
                            radiusY: 50

                            //useLargeArc: true
                        }
                    }
                }
            }
        }
    }
}
