
/*
 * Iniziamo classicamente
 */

// tutte le intestazioni dal framework Qt iniziano con la lettera maiuscola 'Q'
#include <QApplication>
#include <QLineEdit>

int main(int argc, char *argv[]) {
	  // crea un oggetto per gestire le risorse a livello di applicazione
    QApplication app(argc, argv);

    // crea un widget di campo di testo e lo mostra sullo schermo
    QLineEdit lineEdit("Hello world!");
    lineEdit.show();

    // avvia il ciclo degli eventi dell'applicazione
    return app.exec();
}

/*
 * Creiamo un'etichetta e un pulsante.
 * Un'etichetta dovrebbe apparire quando si preme un pulsante.
 * 
 * Il codice Qt parla da solo.
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
    
    // add vertical layout 
    QVBoxLayout layout;
    dialogWindow.setLayout(&layout);  

    QLabel textLabel("Grazie per aver premuto quel pulsante");
    layout.addWidget(&textLabel);
    textLabel.hide();

    QPushButton button("Premimi");
    layout.addWidget(&button);
    
    // mostra l'etichetta nascosta quando viene premuto il pulsante
    QObject::connect(&button, &QPushButton::pressed,
                     &textLabel, &QLabel::show);

    return app.exec();
}

// counterlabel.hpp

#ifndef COUNTERLABEL
#define COUNTERLABEL

#include <QLabel>

class CounterLabel : public QLabel {
    Q_OBJECT  // Macro definite da Qt che devono essere presenti in ogni widget personalizzato
    
public:
    CounterLabel() : counter(0) {
        setText("Il contatore non è stato ancora aumentato");  // metodo di QLabel
    }

public slots:
    // azione che verrà chiamata in risposta alla pressione del pulsante
    void increaseCounter() {
        setText(QString("Valore contatore: %1").arg(QString::number(++counter)));
    }

private:
    int counter;
};

#endif // COUNTERLABEL

// main.cpp
// Quasi uguale all'esempio precedente

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

    QPushButton button("Premimi ancora una volta");
    layout.addWidget(&button);
    QObject::connect(&button, &QPushButton::pressed,
                     &counterLabel, &CounterLabel::increaseCounter);

    return app.exec();
}

