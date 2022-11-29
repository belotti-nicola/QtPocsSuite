import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: root
    height: 100
    width: 400

    Rectangle {
        id: headerbox
        height: root.height
        width: root.width
        color: "grey"
        Button {
            width: 20
            height: 20
            anchors.right: headerbox.right
            anchors.top: headerbox.top
            text: "X"
        }
    }
}
