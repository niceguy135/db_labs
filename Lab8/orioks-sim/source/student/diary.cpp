#include <QDebug>
#include <iostream>
#include "diary.h"
#include "ui_diary.h"
#include "tables_stuff/centeralignmentdelegate.h"
#include "tables_stuff/tableinterfacehelper.h"


// TOD0: перенести в отдельный файл (лень)
class NoSelectionItemDelegate : public QStyledItemDelegate
{
public:
    NoSelectionItemDelegate(QObject* parent = nullptr) : QStyledItemDelegate(parent) {}

    QWidget* createEditor(QWidget* parent, const QStyleOptionViewItem& option, const QModelIndex& index) const override
    {
        Q_UNUSED(parent);
        Q_UNUSED(option);
        Q_UNUSED(index);
        return nullptr; // Возвращаем nullptr, чтобы ячейка не была редактируемой
    }
};

Diary::Diary(QWidget *parent, QStackedWidget *stack, QWidget *block) :
    QWidget(parent),
    ui(new Ui::Diary)
{
    ui->setupUi(this);

    mainWidgetStack = stack;
    blockForm = block;

    // Настройки журнала
    ui->diary_table->setColumnCount(2);

    ui->diary_table->horizontalHeader()->setVisible(false);
    ui->diary_table->verticalHeader()->setVisible(false);
    ui->diary_table->horizontalHeader()->setSectionResizeMode(0, QHeaderView::Stretch);
    ui->diary_table->horizontalHeader()->setSectionResizeMode(1, QHeaderView::Stretch);

    // Оцентровка, запрет на редактирование
    CenterAlignmentDelegate* centerDelegate = new CenterAlignmentDelegate;
    ui->diary_table->setItemDelegateForColumn(0, centerDelegate);
    ui->diary_table->setItemDelegateForColumn(1, centerDelegate);

    // student_id_ = 1;

    NoSelectionItemDelegate* delegate = new NoSelectionItemDelegate;
    ui->diary_table->setItemDelegate(delegate);

    // connects
    connect(ui->search_button, &QPushButton::clicked, this, &Diary::searchBySubject);
}

Diary::~Diary()
{
    delete ui;
}

void Diary::setStudent(User user)
{
    current_student_ = user;
    loadMarks();
}

void Diary::loadMarks()
{
    QSqlQuery marks_query;
    marks_query.prepare("select field_name, mark FROM field_comprehension "
                        "LEFT OUTER JOIN Field "
                        "ON Field_comprehension.field = Field.field_id "
                        "where student_id = :id");
    // Делаю бинды и запускаю запрос на получение оценок
    marks_query.bindValue(":id", current_student_.getUserId());
    marks_query.exec();

    fillDiaryMarks(std::move(marks_query));
}

void Diary::fillDiaryMarks(QSqlQuery marks_query)
{
    // Очищаю старые оценки:
    ui->diary_table->clearContents();
    ui->diary_table->setRowCount(0);

    // Заполняю таблицу
    int rows = 0;

    while (marks_query.next()) {
        QString subject = marks_query.value(0).toString();
        int mark = marks_query.value(1).toInt();

        // Создаю значок оценки и выравниваю его по центру:
        QLabel* markContainer = createMarkBorder(mark);

        QWidget * w = new QWidget(this);
        QHBoxLayout * hlw = new QHBoxLayout;

        // hlw->SetMinimumSize(QSize(200, 200));
        hlw->addWidget(markContainer, 0, Qt::AlignCenter);
        w->setLayout(hlw);

        // w->setFixedHeight(200);
        // ui->diary_table->setRowHeight(rows, 120);

        ui->diary_table->insertRow(rows);
        ui->diary_table->setRowHeight(rows, 50);
        ui->diary_table->setItem(rows, 0, new QTableWidgetItem(subject));
        ui->diary_table->setCellWidget(rows, 1, w);

        ++rows;
    }
}

void Diary::searchBySubject()
{
    // Эта функция - демонстрация возможности SQL иньекции.
    // См ЛР. 8 или ChatGPT

    QStringList fields_list = QString(ui->search_line->text()).split(",");

    QSqlQuery search_query;
    QString query = "select field_name, mark FROM field_comprehension "
                    "LEFT OUTER JOIN Field "
                    "ON Field_comprehension.field = Field.field_id "
                    "where student_id =" + QString::number(current_student_.getUserId()); // + " AND field_name = '" + QString(ui->search_line->text()) + "'";

    if(!fields_list.isEmpty() && QString::compare(fields_list.first(),"")){
        query += " AND field_name IN (''";
        for( const QString& field : fields_list ){
            query += ",";
            query += "'" + field + "'";
        }
        query += ")";

        if(Diary::is_SQL_injection(fields_list)){
            current_student_.blockCheater();
            mainWidgetStack->setCurrentWidget(blockForm);
            return;

        } else {
            search_query.exec(query);
            if (search_query.size() == 0) {
                ui->search_line->clear();
                ui->search_line->setPlaceholderText("Предметы не найдены!");
            } else {
                fillDiaryMarks(std::move(search_query));
            }
        }

    } else {
        ui->search_line->clear();
        ui->search_line->setPlaceholderText("Вы не выбрали предметы!");
    }
}


void Diary::textEdited()
{
    ui->search_line->setPlaceholderText(" ");
}

bool Diary::is_SQL_injection(QStringList &user_query){
    QStringList bad_expressions = (QStringList() << "SELECT" << "UPDATE" << "ALTER" << "SHOW" << "DROP" << "INSERT" << "CREATE");

    for(const QString& expr : bad_expressions){
        for(const QString& query : user_query){
            if(query.contains(expr, Qt::CaseInsensitive)){
                return true;
            }
        }
    }

    return false;
}
