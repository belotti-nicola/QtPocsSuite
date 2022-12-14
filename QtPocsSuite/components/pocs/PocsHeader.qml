import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: root
    height: 100
    width: 400

    property string name:"define me with \"name\"!"

    Rectangle {
        id: headerbox
        height: root.height
        width: root.width
        border.width: 3
        color: "grey"
        Button {
            width: 30
            height: 30
            anchors.right: headerbox.right
            anchors.rightMargin: 5
            anchors.verticalCenter: headerbox.verticalCenter
            text: "X"
            background:
                Rectangle {
                    radius: 5
                    color: "white"
                }

        }
        Label {
            id: title
            text: name
            color: "white"
            anchors.left: headerbox.left
            anchors.leftMargin: 10
            anchors.verticalCenter: headerbox.verticalCenter
        }
    }
}
