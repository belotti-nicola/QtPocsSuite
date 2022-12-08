import QtQuick 2.5
import QtQuick.Controls

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
                        {text: "canvas1" , source: "qrc:/QtPocsSuite/utils/maps/concrete_maps/canvas1.png"},
                        {text: "canvas2" , source: "qrc:/QtPocsSuite/utils/maps/concrete_maps/canvas2.png"},
                        {text: "worldmap" , source: "qrc:/QtPocsSuite/utils/maps/concrete_maps/worldmap.png"},
                        {text: "europemap", source: "qrc:/QtPocsSuite/utils/maps/concrete_maps/europemap.jpg"},
                        {text: "italymap", source: "qrc:/QtPocsSuite/utils/maps/concrete_maps/italymap.png"}
                    ]
                    onModelChanged: {
                        console.log("1")
                        img.source = "qrc:/QtPocsSuite/utils/maps/concrete_maps/canvas2.png"
                    }
                    }
            }
            Row {
                Label {
                    text: "Pick a color:"
                }
            }
            Row {
                Label {
                    color: text
                    text: "Green"
                }
                Button {
                    id: gre_btn
                    checked: cmbackend.color === 1
                    checkable : true
                    width:20;height:20
                    background: Rectangle {
                        color:gre_btn.checked ? "Green" : "white"
                    }
                    onClicked: {
                        cmbackend.color = 1
                    }
                }

            }
            Row {
                Label {
                    color: text
                    text: "Purple"
                }
                Button {
                    id: prp_btn
                    checked: cmbackend.color === 2
                    checkable : true
                    width:20;height:20
                    background: Rectangle {
                        color:prp_btn.checked ? "Purple" : "white"
                    }
                    onClicked: {
                        cmbackend.color = 2
                    }
                }
            }
            Row {
                Label {
                    color: text
                    text: "Red"
                }
                Button {
                    id: red_btn
                    checked: cmbackend.color === 3
                    checkable : true
                    width:20;height:20
                    background: Rectangle {
                        color:red_btn.checked ? "Red" : "white"
                    }
                    onClicked: {
                        cmbackend.color = 3
                    }
                }
            }
            Row {
                Label {
                    color: text
                    text: "Blue"
                }
                Button {
                    id: blue_btn
                    checked: cmbackend.color === 4
                    checkable : true
                    width:20;height:20
                    background: Rectangle {
                        color:blue_btn.checked ? "Blue" : "white"
                    }
                    onClicked: {
                        cmbackend.color = 4
                    }
                }

            }
            Row {
                Label {
                    text: "Pick a brush type:"
                }
            }

            ComboBox {
                model: [
                    "1",
                    "2",
                    "3"
                ]
            }

        }
   }
}

