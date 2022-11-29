import QtQuick 2.5
import QtQuick.Controls

import "../components/pocs"


Item {
    PocsHeader {
        id: pocsheader
        width: box.width + pick_a_color.width
        height: 50
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
            source: combo.model[combo.currentIndex].source
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
            ComboBox {
                id: combo
                textRole: "text"
                valueRole: "source"
                model: [
                    {text: "worldmap", source: "qrc:/QtPocsSuite/utils/worldmap.png"},
                    {text: "europemap", source: "qrc:/QtPocsSuite/utils/europemap.jpg"}
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
                    width:20;height:20
                }
            }
            Row {
                Label {
                    color: text
                    text: "Purple"
                }
                Button {
                    width:20;height:20
                }
            }
            Row {
                Label {
                    color: text
                    text: "Red"
                }
                Button {
                    width:20;height:20
                }
            }
            Row {
                Label {
                    color: text
                    text: "Blue"
                }
                Button {
                    width:20;height:20
                }
            }
        }
   }
}

