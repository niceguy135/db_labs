#include <QSqlQuery>
#include <QDebug>
#include "user.h"


User::User()
{

}

void User::setUserId(int user_id)
{
    this->user_id_ = user_id;
}

void User::setAcessLevel(AcessLevel level)
{
    this->acess_level_ = level;
}

QString User::getFullUsername()
{
    QString fullname{"null"};

    if (user_id_) {
        QSqlQuery username_query;
        if (this->acess_level_ == AcessLevel::student) {
            username_query.prepare("SELECT surname, name, patronymic "
                                   "FROM Student "
                                   "WHERE student_id = :id ");
        } else
            username_query.prepare("SELECT surname, name, patronymic "
                                   "FROM Professor "
                                   "WHERE professor_id = :id");
        username_query.bindValue(":id", user_id_);
        qDebug() << user_id_;
        username_query.exec();
        username_query.next();
        QString name = username_query.value(0).toString();
        QString surname = username_query.value(1).toString();
        QString patronymic = username_query.value(2).toString();
        fullname = name + ' ' + surname + ' ' + patronymic;
    }

    return fullname;

}

void User::checkBlock(){
    QSqlQuery block_query;
    if(!block_query.prepare("SELECT is_blocked FROM users WHERE login = " + QString::number(user_id_)))
        qDebug() << "Bad query!";

    block_query.exec();
    block_query.next();
    QString result = block_query.value(0).toString();

    is_blocked = result.contains("f", Qt::CaseInsensitive) ? false : true;
}

void User::blockCheater(){
    QSqlQuery block_query;
    if(!block_query.prepare("UPDATE users SET is_blocked = true WHERE login =" + QString::number(user_id_)))
        qDebug() << "Bad query!";

    if(!block_query.exec()){
        qDebug() << "I cant block cheater!";
    }

}
