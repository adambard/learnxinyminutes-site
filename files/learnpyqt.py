import sys
from PyQt4 import QtGui

def window():
	# Create an application object
    app = QtGui.QApplication(sys.argv)
	# Create a widget where our label will be placed in
    w = QtGui.QWidget()
	# Add a label to the widget
    b = QtGui.QLabel(w)
	# Set some text for the label
    b.setText("Hello World!")
	# Give some size and placement information
    w.setGeometry(100, 100, 200, 50)
    b.move(50, 20)
	# Give our window a nice title
    w.setWindowTitle("PyQt")
	# Have everything display
    w.show()
	# Execute what we have asked for, once all setup
    sys.exit(app.exec_())

if __name__ == '__main__':
    window()
import sys
from PyQt4.QtGui import *
from PyQt4.QtCore import *


def window():
    app = QApplication(sys.argv)
    w = QWidget()
    # Create a button and attach to widget w
    b = QPushButton(w)
    b.setText("Press me")
    b.move(50, 50)
    # Tell b to call this function when clicked
    # notice the lack of "()" on the function call
    b.clicked.connect(showdialog)
    w.setWindowTitle("PyQt Dialog")
    w.show()
    sys.exit(app.exec_())

# This function should create a dialog window with a button
# that waits to be clicked and then exits the program
def showdialog():
    d = QDialog()
    b1 = QPushButton("ok", d)
    b1.move(50, 50)
    d.setWindowTitle("Dialog")
    # This modality tells the popup to block the parent whilst it's active
    d.setWindowModality(Qt.ApplicationModal)
    # On click I'd like the entire process to end
    b1.clicked.connect(sys.exit)
    d.exec_()

if __name__ == '__main__':
    window()
