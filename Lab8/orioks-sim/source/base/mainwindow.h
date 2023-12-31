#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <memory>
#include <QMainWindow>
#include <QStackedWidget>
#include "login/loginform.h"
#include "employee/teacher.h"
#include "student/student.h"
#include "employee/methodist.h"
#include "administratorwidget.h"

#include "base/user.h"

#include "base/blockedwindow.h"

QT_BEGIN_NAMESPACE
namespace Ui { class MainWindow; }
QT_END_NAMESPACE

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    MainWindow(QWidget *parent = nullptr);
    ~MainWindow();

private:
    Ui::MainWindow *ui;

    AdministratorWidget *admin;
    LoginForm *login_form_;
    Teacher *teacher_interface_;
    Student *student_interface_;
    Methodist *methodist_interface;
    BlockedWindow *blocked_window;

    QStackedWidget *stackedWidget;

    std::shared_ptr<SqlService> database_unit_;

    void initDatabaseInterfaces();

private slots:
    void logIn(User user);
};
#endif // MAINWINDOW_H
