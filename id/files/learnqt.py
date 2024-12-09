import sys
from PyQt4 import QtGui

def window():
# Buat objek aplikasi
    app = QtGui.QApplication(sys.argv)
# Buat sebuah widget, sebagai tempat di mana label kita akan ditempatkan
    w = QtGui.QWidget()
# Tambahkan label untuk widget
    b = QtGui.QLabel(w)
# Set teks untuk label
    b.setText("Halo, Dunia!")
# Set parameter penempatan dan ukuran
    w.setGeometry(100, 100, 200, 50)
    b.move(50, 20)
# Set judul pada jendela
    w.setWindowTitle("PyQt")
# Tampilkan segalanya
    w.show()
# Jalankan apa yang telah kita atur. Setelah semua selesai kita atur.
    sys.exit(app.exec_())

if __name__ == '__main__':
    window()
import sys
from PyQt4.QtGui import *
from PyQt4.QtCore import *


def window():
    app = QApplication(sys.argv)
    w = QWidget()
    # Buat tombol b dan tempelkan pada widget w
    b = QPushButton(w)
    b.setText("Tekan aku!")
    b.move(50, 50)
    # Perintahkan tombol b untuk memanggil fungsi ini ketika diklik
    # Perhatikan bahwa kita tidak menggunakan simbol "()" pada pemanggilan fungsi kali ini
    b.clicked.connect(ShowDialog)
    w.setWindowTitle("Dialog PyQt")
    w.show()
    sys.exit(app.exec_())

# Fungsi ini akan membuat jendela dialog dengan tombol
# yang menunggu untuk diklik untuk keluar dari program
def ShowDialog():
    d = QDialog()
    b1 = QPushButton("ok", d)
    b1.move(50, 50)
    d.setWindowTitle("Dialog")
    # Modalitas ini memberitahu popup untuk memblokir induk saat ini aktif
    d.setWindowModality(Qt.ApplicationModal)
    # Pada klik, kita ingin seluruh proses untuk berhenti
    b1.clicked.connect(sys.exit)
    d.exec_()

if __name__ == '__main__':
    window()
