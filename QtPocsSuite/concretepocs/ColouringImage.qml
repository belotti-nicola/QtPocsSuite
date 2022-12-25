import QtQuick 2.5
import QtQuick.Controls
import QtQuick.Layouts

import "../components/pocs"
import BrushesModel 1.0

Item {

    PocsHeader {
        id: pocsheader
        width: box.width + pick_a_color.width
        height: 50
        name: "Colour this map!"
    }

    Rectangle {
        id: box
        width: img.width
        height: img.height
        border.width: 1
        anchors.top : pocsheader.bottom
        anchors.left: pocsheader.left
        Image {
            id: img
            source: "qrc:/QtPocsSuite/utils/maps/concrete_maps/canvas1.png"
            MouseArea {
                anchors.fill: parent
                onClicked : (mouse) => {
                    console.log(mouse.x+" "+mouse.y)
                }
            }
        }
    }

    Rectangle {
        id: pick_a_color
        anchors.left: box.right
        anchors.top : pocsheader.bottom
        color: "burlywood"
        height: box.height
        width: 250
        border.width: 1

        ColumnLayout {
            spacing: 2
            Label{
                text: "Available images:"
            }
            ComboBox {
                id: combo
                textRole: "text"
                valueRole: "source"
                model: [
                    {"source":"qrc:/QtPocsSuite/utils/maps/concrete_maps/canvas1.png",      "text":"canvas1"},
                    {"source":"qrc:/QtPocsSuite/utils/maps/concrete_maps/canvas2.png",      "text":"canvas2"},
                    {"source":"qrc:/QtPocsSuite/utils/maps/concrete_maps/worldmap.png",     "text":"worldmap"},
                    {"source":"qrc:/QtPocsSuite/utils/maps/concrete_maps/europemap.jpg",    "text":"europemap"},
                    {"source":"qrc:/QtPocsSuite/utils/maps/concrete_maps/italymap.png",     "text":"italymap"}
                    ]
                onCurrentIndexChanged: {

                }
            }
            Label {
                    text: "Pick a color:"
            }
            ComboBox {
                        model: [
                            "Red",
                            "Green",
                            "Blue",
                            "Yellow",
                            "Grey",
                            "Orange"
                        ]
                        onCurrentIndexChanged: {
                            cmbackend.brush = currentIndex;
                        }
            }
            Label {
                text: "Pick a brush type:"
            }
            ComboBox {
                id: cb
                model: BrushesModel{}
                textRole : "brushname"
                delegate:
                    Text {
                        text:  model.brushname
                        color: model.concretebrush
                }
            }

            Label {
                text:"border width:"
            }
            SpinBox {
                from:1
                to: 10
                value: cmbackend.borderWidth
                onValueChanged: {
                    cmbackend.borderWidth=value
                }
            }
            Label {
                text: "Preview:"
            }
            Image {
                source: "image://ColouringImageProvider/paintingpreview"
            }
        }
    }

    Button {
        anchors.horizontalCenter: pick_a_color.horizontalCenter
        anchors.bottom: pick_a_color.bottom
        anchors.bottomMargin: 5
        text: "Reset"
    }

}

