import QtQuick 2.5
import QtQuick.Controls

import "../components/pocs"

Item {

    Connections {
        target: cmbackend
        function onColorChanged() {
            console.log("onColorChanged")
        }
        function onImgChanged() {
            console.log("onImgChanged")
        }
    }

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
            source: "qrc:/QtPocsSuite/utils/worldmap.png"
            MouseArea {
                anchors.fill: parent
                onClicked : (mouse) => {
                    console.log(mouse.x+" "+mouse.y)
                }
            }
        }
    }
    Button {
        id: deployPoly
        anchors.top: pocsheader.bottom
        anchors.left: pocsheader.left
        onClicked: {
            cmbackend.paint()
            console.log("painted")
            img.update()
            console.log("updated")
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
            ComboBox {
                id: combo
                textRole: "text"
                valueRole: "source"
                model: [
                    {text: "worldmap" , source: "qrc:/QtPocsSuite/utils/worldmap.png"},
                    {text: "europemap", source: "qrc:/QtPocsSuite/utils/europemap.jpg"},
                    {text: "italymap", source: "qrc:/QtPocsSuite/utils/italymap.png"}
                ]
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
        }
   }
}

