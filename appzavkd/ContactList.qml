import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

ListView {
    id: list
    property int menuIndex: null //для сохранения номера эл-та на кот. вызвано меню, null - меню закрыто
    signal menu()

//    anchors.fill: parent тут убрала тк управляется теперь с помощью лейаутов
    clip: true //запрет на любую адрессовку эл-ов за пределами списка
    boundsBehavior: ListView.StopAtBounds //отключение поведения подпружинивания эл-ов
    ScrollBar.vertical: ScrollBar {} //прокрутка
    delegate: ContactItem {
        text: name
        text2: line2
        icon: picture //для отдельного добавления аватарок
        selected: list.currentIndex === index
        onLeftClick: {
            list.currentIndex = index //хранит номер текущего эл-та
        }
        onRightClick: {
            menuIndex = index; //запоминает номер открытого эл-та
            menu();
        }
    }
    footer: Rectangle {
        width: parent.width
        height: 40
        border {
            color: "black"
            width: 1
        }

        Text {
            anchors.centerIn: parent
            renderType: Text.NativeRendering
            text: "тут по идее ''вернуться к началу''" // если это можно как-то сделать
        }
    }
}
