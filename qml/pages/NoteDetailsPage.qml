import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: noteDetailsPage
    objectName: "noteDetailsPage"

    property var noteData: [] // Свойство для хранения данных заметки

    PageHeader {
        id:headett
        title: "Детали заметки"
        Button {
            text: "Назад"
            onClicked: {
                pageStack.pop() // Возвращаемся на предыдущую страницу
            }
        }
    }

    Column {

        anchors.top: headett.bottom
        Label {
            text: "Время написания:"+ noteData[0] + "\n" + noteData[1] // Отображаем текст заметки
            wrapMode: Text.WordWrap // Переносим текст, если он не помещается в одну строку
            padding: Theme.paddingLarge
            verticalAlignment: Text.AlignBottom // Выравниваем текст по нижнему краю
        }
    }
}
