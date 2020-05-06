import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

//панель сверху для добавления элементов
//выглядит: вписать текст в TextField и нажать Button

RowLayout {
    signal newItem(string text) // передается имя из строки
    TextField {
        id:textField
        Layout.fillWidth: true
        selectByMouse: true //возможность выделять текст мышкой в текстфилде
        focus: true //ввести текст сразу после запуска проги
    }

    function add() //добавление
    {
        newItem(textField.text);
        textField.clear(); //очистка после вызова
    }

    Button {
        text: "Добавить"
        highlighted: true //подсвечивание кнопки
        onClicked: { //метод вызова при нажатии (ч\з функцию)
            add();
        }
    }
//    Button {
//        text: "Поиск"
//        highlighted: true //подсвечивание кнопки
//        onClicked: { //метод вызова при нажатии (ч\з функцию)
//            if (textField.text===name)


//        }
//    }

    Keys.onReturnPressed: { //обработка нажатия клавиш
        add();
    }
    Keys.onEnterPressed: {
        add();
    }
}

 //inputMask: "+7(###)-###-####" можно что-то придумать когда-нибудь с маской
 // # - числа  N - буквы
 // удобно для ввода пароля при регистрации наверн

/*##^##
Designer {
    D{i:0;autoSize:true;height:50;width:300}
}
##^##*/
