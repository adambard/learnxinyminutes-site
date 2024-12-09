/*
 * 让我们从最经典的开始
 */

// Qt框架的所有标头均以大写字母'Q'开头
#include <QApplication>
#include <QLineEdit>

int main(int argc, char *argv[]) {
	 // 创建一个对象来管理应用程序范围内的资源
    QApplication app(argc, argv);

    // 创建行编辑widgets并在屏幕上显示
    QLineEdit lineEdit("Hello world!");
    lineEdit.show();

    // 启动应用程序的事件循环
    return app.exec();
}
/*
 * 让我们创建一个标签和一个按钮。
 * 按下按钮时应显示一个标签。
 * Qt代码本身就可以说明问题。
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
    
    // 添加垂直布局
    QVBoxLayout layout;
    dialogWindow.setLayout(&layout);  

    QLabel textLabel("Thanks for pressing that button");
    layout.addWidget(&textLabel);
    textLabel.hide();

    QPushButton button("Press me");
    layout.addWidget(&button);
    
    // 按下按钮时显示隐藏标签
    QObject::connect(&button, &QPushButton::pressed,
                     &textLabel, &QLabel::show);

    return app.exec();
}
// counterlabel.hpp

#ifndef COUNTERLABEL
#define COUNTERLABEL

#include <QLabel>

class CounterLabel : public QLabel {
    Q_OBJECT  // 在每个自定义wiget中必须存在的Qt定义的宏

public:
    CounterLabel() : counter(0) {
        setText("Counter has not been increased yet");  // QLabel方法
    }

public slots:
    // 将响应按钮按下而调用的操作
    void increaseCounter() {
        setText(QString("Counter value: %1").arg(QString::number(++counter)));
    }

private:
    int counter;
};

#endif // COUNTERLABEL
// main.cpp
// 与前面的示例几乎相同

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
