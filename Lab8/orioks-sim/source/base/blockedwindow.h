#ifndef BLOCKEDWINDOW_H
#define BLOCKEDWINDOW_H

#include <QDialog>
#include <QStackedWidget>

namespace Ui {
class BlockedWindow;
}

class BlockedWindow : public QDialog
{
    Q_OBJECT

public:
    explicit BlockedWindow(QWidget *parent = nullptr, QStackedWidget *stack = nullptr, QWidget *login = nullptr);
    ~BlockedWindow();

private:
    Ui::BlockedWindow *ui;
    QStackedWidget *mainWidgetStack;
    QWidget *loginForm;

private slots:
    void acceptDestiny();
};

#endif // BLOCKEDWINDOW_H
