
import sys
from PyQt4 import QtGui

def window():
	# Cria um objeto para a aplicação
    app = QtGui.QApplication(sys.argv)
	# Cria um widget onde o nosso label será inserido
    w = QtGui.QWidget()
	# Adiciona um label ao widget
    b = QtGui.QLabel(w)
	# Informa algum texto ao label
    b.setText("Hello World!")
	# Define os tamanhos e posições dos objetos
    w.setGeometry(100, 100, 200, 50)
    b.move(50, 20)
	# Define o título da janela
    w.setWindowTitle("PyQt")
	# Exibe a janela
    w.show()
	# Executa tudo o que foi pedido, apenas uma vez
    sys.exit(app.exec_())

if __name__ == '__main__':
    window()

import sys
from PyQt4.QtGui import *
from PyQt4.QtCore import *


def window():
    app = QApplication(sys.argv)
    w = QWidget()
    # Cria um botão e o anexa ao widget w
    b = QPushButton(w)
    b.setText("Press me")
    b.move(50, 50)
    # Informa b a chamar essa função quando for clicado
    # observe que a função chamada não necessita de "()"
    b.clicked.connect(showdialog)
    w.setWindowTitle("PyQt Dialog")
    w.show()
    sys.exit(app.exec_())

# Essa função deve criar uma janela de diálogo com um botão,
# aguarda ser clicado e encerra o programa
def showdialog():
    d = QDialog()
    b1 = QPushButton("ok", d)
    b1.move(50, 50)
    d.setWindowTitle("Dialog")
    # Essa modalidade define que o popup deve bloquear as outras janelas quando ativo
    d.setWindowModality(Qt.ApplicationModal)
    # Ao ser clicado deve encerrar o processo
    b1.clicked.connect(sys.exit)
    d.exec_()

if __name__ == '__main__':
    window()

