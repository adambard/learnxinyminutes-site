/*
 * Vamos começar
 */

// Todos as dependências do framework Qt iniciam com a letra 'Q' maiúscula
#include <QApplication>
#include <QLineEdit>

int main(int argc, char *argv[]) {
	 // Cria um objeto para utilizar todos os recursos da aplicação
    QApplication app(argc, argv);

    // Cria um widget com linha editável e exibe na tela
    QLineEdit lineEdit("Hello world!");
    lineEdit.show();

    // Inicia a aplicação em um evento de loop
    return app.exec();
}
/*
 * Vamos criar um label e um botão.
 * Um label irá aparecer quando o botão for clicado
 *
 * O próprio código do Qt é autoexplicativo.
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

    // Adiciona um layout vertical
    QVBoxLayout layout;
    dialogWindow.setLayout(&layout);

    QLabel textLabel("Thanks for pressing that button");
    layout.addWidget(&textLabel);
    textLabel.hide();

    QPushButton button("Press me");
    layout.addWidget(&button);

    // Exibe o label oculto quando o botão é clicado
    QObject::connect(&button, &QPushButton::pressed,
                     &textLabel, &QLabel::show);

    return app.exec();
}
// counterlabel.hpp

#ifndef COUNTERLABEL
#define COUNTERLABEL

#include <QLabel>

class CounterLabel : public QLabel {
    Q_OBJECT  // Define os macros presente em todo objeto Qt

public:
    CounterLabel() : counter(0) {
        setText("Counter has not been increased yet");  // método do QLabel
    }

public slots:
    // Ação que será chamada em resposta ao clique do botão
    void increaseCounter() {
        setText(QString("Counter value: %1").arg(QString::number(++counter)));
    }

private:
    int counter;
};

#endif // COUNTERLABEL
// main.cpp
// Quase igual ao exemplo anterior

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
