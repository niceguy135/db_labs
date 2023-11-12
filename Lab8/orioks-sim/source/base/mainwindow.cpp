#include <QVBoxLayout>

#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <QStackedWidget>
#include <QDebug>

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    // Stacked widget является скелетом приложения
    stackedWidget = new QStackedWidget();

    initDatabaseInterfaces();

    stackedWidget->addWidget(login_form_);
    stackedWidget->addWidget(teacher_interface_);
    stackedWidget->addWidget(student_interface_);
    stackedWidget->addWidget(methodist_interface);
    stackedWidget->addWidget(blocked_window);

    stackedWidget->setCurrentWidget(login_form_);

    setCentralWidget(stackedWidget);

    // connects
    connect(login_form_, &LoginForm::authorized, this, &MainWindow::logIn);
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::initDatabaseInterfaces()
{
    database_unit_ = std::make_unique<SqlService>();
    database_unit_->databaseConnect();

    // Setting for interfaces
    teacher_interface_ = new Teacher();
    teacher_interface_->setSqlUnit(database_unit_);

    login_form_ = new LoginForm();
    methodist_interface = new Methodist();
    blocked_window = new BlockedWindow(nullptr, stackedWidget, login_form_);
    student_interface_ = new Student(nullptr, stackedWidget, blocked_window);
}

void MainWindow::logIn(User user)
{
    if (user.getBlockStatus()) {
        stackedWidget->setCurrentWidget(blocked_window);
        return;
    }
    if (user.getAcessLevel() == User::teacher) {
        stackedWidget->setCurrentWidget(teacher_interface_);
        teacher_interface_->setCurrentUser(user);
        teacher_interface_->initSubjectsList();
    } else if (user.getAcessLevel() == User::methodist) {
        stackedWidget->setCurrentWidget(methodist_interface);
        methodist_interface->setCurrentUser(user);
    } else {
        student_interface_->setCurrentUser(user);
        stackedWidget->setCurrentWidget(student_interface_);
    }

}


