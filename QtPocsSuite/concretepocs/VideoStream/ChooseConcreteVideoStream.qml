import QtQuick 2.5
import QtQuick.Controls
import QtQuick.Layouts

Item {

    ComboBox {

        model: [
            "HTTP page"
        ]

        onCurrentIndexChanged: {
            if(currentIndex === 0){
                var comp = Qt.createComponent("QtPocsSuite/concretepocs/HTTP.qml")
                var obj  = comp.createObject(mainwindow,{x:100,y:100})
            }
        }
    }
}
