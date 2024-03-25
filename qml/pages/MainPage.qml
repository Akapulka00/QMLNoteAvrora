import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.LocalStorage 2.0
import "../assets/Database.js" as JS

Page {
    objectName: "mainPage"
    allowedOrientations: Orientation.All

    SilicaListView {
        anchors.fill: parent
        model: ListModel {id: noteModel}
        delegate: ListItem {
            Label {
                height: 50
                text: date + " " + message
                Component.onCompleted: console.log(date + " " + message)
                anchors.verticalCenter: parent.verticalCenter

            }
            Button {
                            anchors.fill: parent
                            onClicked: {
                                var noteData = [date,message]; // Получаем данные заметки по индексу
                                pageStack.push(Qt.resolvedUrl("NoteDetailsPage.qml"), {noteData: noteData}); // Переходим на страницу с деталями заметки и передаем данные
                            }
                        }

        }
        header: PageHeader {
            objectName: "pageHeader"
            title: qsTr("Список заметок")
        }

        PullDownMenu {
            quickSelect: true
            MenuItem {
                text: "Добавить заметку"
                onClicked: {
                    var dialog = pageStack.push(Qt.resolvedUrl("CreateNoteDialog.qml"))
                    dialog.onAccepted.connect(function () {
                        var currentDate = new Date();
                      var arr=(" " + currentDate.toLocaleTimeString());
                        noteModel.append({"date": arr, "message": dialog.note})
                    });
                }
            }
        }
    }

    Component.onCompleted: {
       //JS.dbClear()
        JS.dbInit()
        JS.dbReadAll()
    }
}
