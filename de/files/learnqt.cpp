/*
 * Lass uns klassisch starten
 */

// Alle Header vom Qt Framework starten mit dem Großbuchstaben 'Q'.
#include <QApplication>
#include <QLineEdit>

int main(int argc, char *argv[]) {
    // Erstellt ein Objekt um applikationsweit die Ressourcen zu managen.
    QApplication app(argc, argv);

    // Erstellt ein Line edit Widget und zeigt es auf dem Bildschirm
    QLineEdit lineEdit("Hello world!");
    lineEdit.show();

    // Startet die Event Loop der Anwendung.
    return app.exec();
}
/*
 * Lass uns Label und einen Button machen.
 * Ein Label soll auftauchen, wenn der Button gedrückt wird.
 * 
 * Der Qt Code spricht für sich selbst.
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
    
    // Füge ein vertikales Layout hinzu.
    QVBoxLayout layout;
    dialogWindow.setLayout(&layout);  

    QLabel textLabel("Danke für das Knopf drücken");
    layout.addWidget(&textLabel);
    textLabel.hide();

    QPushButton button("Drück mich");
    layout.addWidget(&button);
    
    // Zeigt verstecktes Label, wenn der Button gedrückt wird.
    QObject::connect(&button, &QPushButton::pressed,
                     &textLabel, &QLabel::show);

    return app.exec();
}
// counterlabel.hpp

#ifndef COUNTERLABEL
#define COUNTERLABEL

#include <QLabel>

class CounterLabel : public QLabel {
    Q_OBJECT  // Qt definiertes Makro, welches in jedem modifizierten Widget vorhanden sein muss.

public:
    CounterLabel() : counter(0) {
        setText("Zähler wurde noch nicht erhöht.");  // Methode von QLabel
    }

public slots:
    // Aktion, die ausgeführt wird, wenn der Button gedrückt wird.
    void increaseCounter() {
        setText(QString("Zähler Wert: %1").arg(QString::number(++counter)));
    }

private:
    int counter;
};

#endif // Zähllabel
// main.cpp
// Fast das Gleiche, wie das vorherige Beispiel

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

    QPushButton button("Drück mich nochmal.");
    layout.addWidget(&button);
    QObject::connect(&button, &QPushButton::pressed,
                     &counterLabel, &CounterLabel::increaseCounter);

    return app.exec();
}
