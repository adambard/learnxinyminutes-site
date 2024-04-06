
import sys
from PyQt4 import QtGui

def window():
	# Création de l'objet application
    app = QtGui.QApplication(sys.argv)
	# Création d'un widget où notre label sera placé
    w = QtGui.QWidget()
	# Ajout d'un label au widget
    b = QtGui.QLabel(w)
	# Assignation de texte au label
    b.setText("Hello World!")
	# Assignation des tailles et des informations de placement
    w.setGeometry(100, 100, 200, 50)
    b.move(50, 20)
	# Assignation d'un nom à notre fenêtre
    w.setWindowTitle("PyQt")
	# Affichage de la fenêtre
    w.show()
	# Exécution de l'application
    sys.exit(app.exec_())

if __name__ == '__main__':
    window()

import sys
from PyQt4.QtGui import *
from PyQt4.QtCore import *


def window():
    app = QApplication(sys.argv)
    w = QWidget()
    # Creation d'un bouton attaché au widget w
    b = QPushButton(w)
    b.setText("Press me")
    b.move(50, 50)
    # Dire à b d'appeler cette fonction quand il est cliqué
    # remarquez l'absence de "()" sur l'appel de la fonction
    b.clicked.connect(showdialog)
    w.setWindowTitle("PyQt Dialog")
    w.show()
    sys.exit(app.exec_())

# Cette fonction devrait créer une fenêtre de dialogue avec un bouton
# qui attend d'être cliqué puis quitte le programme
def showdialog():
    d = QDialog()
    b1 = QPushButton("ok", d)
    b1.move(50, 50)
    d.setWindowTitle("Dialog")
    # Cette modalité dit au popup de bloquer le parent pendant qu'il est actif
    d.setWindowModality(Qt.ApplicationModal)
    # En cliquant je voudrais que tout le processus se termine
    b1.clicked.connect(sys.exit)
    d.exec_()

if __name__ == '__main__':
    window()

