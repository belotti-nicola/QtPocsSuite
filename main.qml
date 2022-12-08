import QtQuick 2.5
import QtQuick.Controls
import QtQuick.Layouts


Window {
    id: mainwindow
    visible: true
    visibility: Qt.WindowFullScreen

    Column {
        spacing: 10
        Row {
            Button {
                text: "Colour this image!"
                onClicked: {
                    var comp = Qt.createComponent("QtPocsSuite/concretepocs/ColouringImage.qml")
                    var obj  = comp.createObject(mainwindow,{x:100,y:100})
                }
            }
        }
        Row {
                Button {
                    text: "TCP status"
                }
            }
        Row {
                Button {
                    text: "VideoStream"
                }
            }
        Row {
                Button {
                    text: "DataEngine"
                }
            }

    }
}
