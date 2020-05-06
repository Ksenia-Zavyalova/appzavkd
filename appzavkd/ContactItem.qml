import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12

Rectangle
{
    id: me //внутренний id для обращения к свойствам списка
    property alias icon: icon.source //св-во элиас ссылается на icon.source
    property alias text: label.text // элиас текст на лейбл текст
    property alias text2: label2.text
    property bool selected: false //для выделения цветом при нажатии

    signal leftClick() //вызываются при клике
    signal rightClick()

    width: parent.width
    height: 60

    color: { //цвет с эффектом наведения
        if (selected) //курсором выделила
            return "gray"
        if (area.containsMouse) //курсор внутри области
            return "lightgray" //ни то ни другое
        return "white";
    }

    RowLayout
    {
        anchors.fill: parent // растягивание на весь ректангл
        anchors.leftMargin: 4 //внешние отступы слева и
        anchors.rightMargin: 4 // справа
        spacing: 7 //зазор м\у текстом и картинкой
        Image
        {
            id: icon //для обращения

            source: "icons/icon_1.png"
            Layout.fillHeight: true
            Layout.preferredWidth: height // присоединенное свойство
            Layout.margins: 7 //внешние отступы картинки
        }
        ColumnLayout { //две строки
          Layout.fillWidth: true
          Label
          {
              id: label //снова обращение
              Layout.fillWidth: true
              font.bold: true //настройка жирности
              text: "Имя"
          }
          Label
          {
              id: label2 //снова обращение
              Layout.fillWidth: true
              //font.bold: true //настройка жирности
              text: "нет непрочитанных..."
              elide: Label.ElideRight //многоточие для длинных сообщений
          }
        }


    }
    MouseArea { //обработка кликов мыши
        id: area
        anchors.fill: parent
        hoverEnabled: true
        acceptedButtons: Qt.LeftButton | Qt.RightButton //указание какой именно кнопки
        onClicked: { //код исполняющийся каждый раз при клике
            if (mouse.button===Qt.LeftButton) //тройное равно для сравнения
                leftClick();
            if (mouse.button===Qt.RightButton)
                rightClick();
        }
    }
//    states: [
//        State {
//            name: "State1"
//        }
//    ]
}
