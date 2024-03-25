import QtQuick 2.0
import Sailfish.Silica 1.0
import "../assets/Database.js" as JS
import QtQuick.LocalStorage 2.0

Dialog {
    objectName: "aboutPage"
    allowedOrientations: Orientation.All
    property string note
    Column {
        anchors.fill: parent
        DialogHeader {
            acceptText: "Сохранить"
            cancelText: "Отменить"
        }
        TextArea {
            id: noteArea
            placeholderText: "Введите заметку"
        }
    }
    function insertrec() {
    //   var dateString = currentDate.toLocaleDateString();
        var currentDate = new Date();

        var rowid = parseInt(JS.dbInsert(currentDate.toLocaleTimeString(),noteArea.text), 10)
        return rowid;
    }

    function setlistview() {
        var dateString = currentDate.toLocaleDateString();
        listView.model.append({"date": zz, "message": noteArea})
    }

    onAccepted:{

        note = noteArea.text
        insertrec();
    }

}
