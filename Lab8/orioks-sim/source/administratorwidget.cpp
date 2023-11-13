#include "administratorwidget.h"
#include "ui_administratorwidget.h"

#include <QSqlQuery>
#include <QSqlRecord>
#include <QTableWidgetItem>
#include <QDebug>

#include "tables_stuff/centeralignmentdelegate.h"
#include "tables_stuff/tableinterfacehelper.h"

AdministratorWidget::AdministratorWidget(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::AdministratorWidget)
{
    ui->setupUi(this);

    connect(ui->pushButton, &QPushButton::clicked, this, &AdministratorWidget::sendQuery);
}

AdministratorWidget::~AdministratorWidget()
{
    delete ui;
}

void AdministratorWidget::sendQuery(){

    ui->tableWidget->clearContents();
    ui->tableWidget->setRowCount(0);

    QString adminQuery = ui->lineEdit->text();
    qDebug() << adminQuery;
    QSqlQuery query;

    if(query.prepare(adminQuery)){
        if(query.exec()){
            auto columnsSize = query.record().count();

            ui->tableWidget->setColumnCount(columnsSize);

            // Заполняю таблицу
            int rowCounter = 0;
            while(query.next()){
                ui->tableWidget->insertRow(rowCounter);
                for(int columnInd = 0; columnInd < columnsSize; columnInd++) {
                    ui->tableWidget->setItem(rowCounter, columnInd, new QTableWidgetItem(query.value(columnInd).toString()));
                }
                rowCounter++;

            }
        } else
            qDebug() << "Exec bad!";
    } else
        qDebug() << "Prepare bad!";
}
