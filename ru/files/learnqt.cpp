/*
 * Начнём по-старинке
 */

// все header файлы импортированные из Qt начинаются с заглавной 'Q'
#include <QApplication>
#include <QLineEdit>

int main(int argc, char *argv[]) {
    // создаем объект для управления данными приложения
    QApplication app(argc, argv);

    // создаем редактируемую строку и отобразим её на экране
    QLineEdit lineEdit("Hello world!");
    lineEdit.show();

    // запускаем цикл для обработки событий (event loop)
    return app.exec();
}
/*
 * В этом примере мы отобразим надпись с кнопкой.
 * Надпись будет появляться после нажатия на кнопку.
 *
 * Код на Qt говорит сам за себя.
 */

#include <QApplication>
#include <QDialog>
#include <QVBoxLayout>
#include <QPushButton>
#include <QLabel>

int main(int argc, char *argv[]) {
    QApplication app(argc, argv);

    QDialog dialogWindow;
    dialogWindow.show();

    // добавляем вертикальное расположение
    QVBoxLayout layout;
    dialogWindow.setLayout(&layout);  

    QLabel textLabel("Thanks for pressing that button");
    layout.addWidget(&textLabel);
    textLabel.hide();

    QPushButton button("Press me");
    layout.addWidget(&button);

    // отображаем скрытую надпись после нажатия на кнопку
    QObject::connect(&button, &QPushButton::pressed,
                     &textLabel, &QLabel::show);

    return app.exec();
}
// counterlabel.hpp

#ifndef COUNTERLABEL
#define COUNTERLABEL

#include <QLabel>

class CounterLabel : public QLabel {
    Q_OBJECT  // макрос Qt, обязателен для всех виджетов

public:
    CounterLabel() : counter(0) {
        setText("Counter has not been increased yet");  // метод QLabel
    }

public slots:
    // действие, которое будет вызвано в ответ на нажатие
    void increaseCounter() {
        setText(QString("Counter value: %1").arg(QString::number(++counter)));
    }

private:
    int counter;
};

#endif // COUNTERLABEL
// main.cpp
// Почти тоже самое, что и в предыдущем примере

#include <QApplication>
#include <QDialog>
#include <QVBoxLayout>
#include <QPushButton>
#include <QString>
#include "counterlabel.hpp"

int main(int argc, char *argv[]) {
    QApplication app(argc, argv);

    QDialog dialogWindow;
    dialogWindow.show();

    QVBoxLayout layout;
    dialogWindow.setLayout(&layout);

    CounterLabel counterLabel;
    layout.addWidget(&counterLabel);

    QPushButton button("Push me once more");
    layout.addWidget(&button);
    QObject::connect(&button, &QPushButton::pressed,
                     &counterLabel, &CounterLabel::increaseCounter);

    return app.exec();
}
