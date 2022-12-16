import QtQuick 2.5
import QtQuick.Controls
import QtQuick.Layouts

import "../components/pocs"

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

        Column {
            spacing: 10
            Row {
                Label{
                    text: "Available images:"
                }
            }
            Row {
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
                        img.source = model[currentIndex].source
                    }
                }
            }

            ColumnLayout {
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
                            cmbackend.brush = 1;
                        }
                }
                Label {
                        text: "Pick a brush type:"
                }
                ComboBox {
                        model: [
                            "Solid",
                            "Dense1",
                            "Dense2",
                            "Dense3",
                            "Dense4",
                            "Dense5",
                            "Dense6",
                            "Dense7",
                            "NoBrush",
                            "Horintal",
                            "Vertical",
                            "Cross",
                            "BDiag",
                            "FDiag",
                            "DiagCross",
                            "LinearGradient",
                            "RadialGradient",
                            "ConicalGradient"
                        ]
                }
                Label {
                        text:"border width:"
                }
                SpinBox {
                        from:1
                        to: 10
                        onValueChanged: cmbackend.borderWidth=value
                }
                Label {
                        text: "Preview:"
                }
                Image {
                        source: "image://ColouringImageProvider/paintingpreview"

                }
            }
        }
    }

    Button {
        anchors.horizontalCenter: pick_a_color.horizontalCenter
        anchors.bottom: pick_a_color.bottom
        anchors.bottomMargin: 5
        text: "Reset"

    }

    function updateImage(){
        cmbackend.paint()
    }
    function updateImagePreview(){
        cmbackend.paint()
    }

}

