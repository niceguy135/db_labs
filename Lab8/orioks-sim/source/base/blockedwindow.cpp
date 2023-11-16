#include "blockedwindow.h"
#include "ui_blockedwindow.h"

BlockedWindow::BlockedWindow(QWidget *parent, QStackedWidget *stack, QWidget *login) :
    QDialog(parent),
    ui(new Ui::BlockedWindow)
{
    ui->setupUi(this);
    mainWidgetStack = stack;
    loginForm = login;

    connect(ui->pushButton, &QPushButton::clicked, this, &BlockedWindow::acceptDestiny);
}

BlockedWindow::~BlockedWindow()
{
    delete ui;
}

void BlockedWindow::acceptDestiny() {
    mainWidgetStack->setCurrentWidget(loginForm);
}
