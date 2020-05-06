import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Window { //само окно соответственно
    visible: true
    width: 320
    height: 480
    title: qsTr("Друзья")

    ListModel { //невидимый элемент для хранения данных модели (данные только внутри себя)
        id:contactsModel

        ListElement {
            name: "Ирина"
            picture: "icons/icon_4.png"
            line2: "Прислать отчёт до 19:00!!!"
        }
        ListElement {
            name: "Екатерина"
            picture: "icons/icon_6.png"
        }
        ListElement {
            name: "Витя"
            picture: "icons/icon_3.png"
        }
        ListElement {
            name: "Николай"
            picture: "icons/icon_8.png"
        }
        ListElement {
            name: "Сергей"
            picture: "icons/icon_2.png"
        }
        ListElement {
            name: "Анна"
        }
        ListElement {
            name: "Артур"
        }
        ListElement {
            name: "Илья"
        }
    }
    ColumnLayout { //тут лежат МейнТулБар и КонтактЛист
        anchors.fill: parent
        MainToolBar {
            Layout.fillWidth: true
            onNewItem: {
                contactsModel.append({name: text}) //добавление эл-та
            }
        }
        ContactList {
            id: list
            Layout.fillHeight: true
            Layout.fillWidth: true
            model: contactsModel //задание модели
            onMenu: { //обработчик для сигнала меню
                contactListMenu.popup();
            }
        }
    }

    Menu {
        id: contactListMenu
        modal: true //при открытии меню больше ничего нельзя нажать
        MenuItem {
            text: "Удалить"
            onTriggered: { //обработчик пункта срабатывания меню
                contactsModel.remove(list.menuIndex);
            }
        }
//        MenuItem {
//            text: "Добавить в избранное"
//            onTriggered: { //обработчик пункта срабатывания меню
//                picture: "icons/star1.png"
//            }
//        }
    }

}
