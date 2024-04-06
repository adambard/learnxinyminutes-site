
import sys
from PyQt4 import QtGui

def window():
    # Crear el objeto de la aplicación
    app = QtGui.QApplication(sys.argv)
    # Crear un widget en el que colocaremos nuestra etiqueta
    w = QtGui.QWidget()
    # Agregamos nuestra etiqueta al widget
    b = QtGui.QLabel(w)
    # Agregamos texto a nuestra etiqueta
    b.setText("Hello World!")
    # Fijemos información de posición y tamaño del widget
    w.setGeometry(100, 100, 200, 50)
    b.move(50, 20)
    # Proporcionemos un título a nuestra ventana
    w.setWindowTitle("PyQt")
    # Mostremos todo
    w.show()
    # Ejecutemos lo que hayamos solicitado ya inicializado el resto
    sys.exit(app.exec_())

if __name__ == '__main__':
    window()

import sys
from PyQt4.QtGui import *
from PyQt4.QtCore import *


def window():
    app = QApplication(sys.argv)
    w = QWidget()
    # Crear un botón y adjuntarlo al widget w
    b = QPushButton(w)
    b.setText("Press me")
    b.move(50, 50)
    # Indicar al botón b que llame esta función cuando reciba un click
    # Nótese la falta de "()" en la llamada de la función
    b.clicked.connect(showdialog)
    w.setWindowTitle("PyQt Dialog")
    w.show()
    sys.exit(app.exec_())

# Esta función debería crear una ventana de diálogo con un botón
# que espera a recibir un click y luego sale del programa
def showdialog():
    d = QDialog()
    b1 = QPushButton("ok", d)
    b1.move(50, 50)
    d.setWindowTitle("Dialog")
    # Esta modalidad le indica al popup que bloquee al padre mientras activo
    d.setWindowModality(Qt.ApplicationModal)
    # Al recibir un click me gustaría que el proceso termine
    b1.clicked.connect(sys.exit)
    d.exec_()

if __name__ == '__main__':
    window()

