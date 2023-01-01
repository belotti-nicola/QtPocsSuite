import QtQuick 2.5
import QtQuick.Controls 2.15

Item {

    Rectangle {
        width: 660
        height: 500
        border.color: "black"
        Image {
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            width: 640
            height: 480
            source: "http://192.168.1.55:8000/stream.mjpg"
        }
    }

}
