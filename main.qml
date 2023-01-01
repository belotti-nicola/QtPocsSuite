import QtQuick 2.5
import QtQuick.Controls
import QtQuick.Layouts


Window {
    id: mainwindow
    visible: true
    visibility: Qt.WindowFullScreen

    ColumnLayout {
        spacing: 10

        Button {
            text: "Colour this image!"
            onClicked: {
                var comp = Qt.createComponent("QtPocsSuite/concretepocs/ColouringImage.qml")
                var obj  = comp.createObject(mainwindow,{x:100,y:100})
            }

        }
        Button {
                    text: "TCP status"
        }
        Button {
                    text: "VideoStream"
                    onClicked: {
                        var comp = Qt.createComponent("QtPocsSuite/concretepocs/VideoStream/HTTP.qml")
                        var obj  = comp.createObject(mainwindow,{x:100,y:100})
                    }
        }
        Button {
                    text: "C++ Engine"
        }
        Button {
            text: "Track the mouse on the image!"
        }
    }
}
